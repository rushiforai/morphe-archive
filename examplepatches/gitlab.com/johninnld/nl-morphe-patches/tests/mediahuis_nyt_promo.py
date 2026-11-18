"""Execute the emitted narrow NYT card predicate at Android parsing boundaries."""
from html.parser import HTMLParser
import re
from urllib.parse import parse_qs, urlsplit

from mediahuis_emitted import code, locals_count, method_source, source
from mediahuis_sponsored_groups import GROUP, GROUP_GATE, run_group_gate


NYT_NAME = "morpheIsNytPromotionGroup"
NYT_METHOD = (GROUP, NYT_NAME + "(L" + GROUP + ";)Z")
NYT_PREFIX_LENGTH = 5


class Anchors(HTMLParser):
    def __init__(self, html):
        super().__init__(convert_charrefs=True)
        self.urls = []
        self.feed(html)

    def handle_starttag(self, tag, attrs):
        if tag == "a":
            self.urls.extend(value for name, value in attrs if name == "href" and value is not None)


def catch_contract(root, method=NYT_METHOD):
    body = method_source(root, *method)[1]
    labels, index = {}, 0
    for raw in body.splitlines():
        line = raw.strip()
        if line.startswith(":"):
            labels[line] = index
        elif line and not line.startswith((".", "#")):
            index += 1
    catches = re.findall(r"\.catch Ljava/lang/Exception; \{(:\w+) \.\. (:\w+)\} (:\w+)", body)
    assert len(catches) == 1, "One fail-open parser exception handler"
    start, end, handler = [labels[label] for label in catches[0]]
    lines = code(root, *method)
    calls = [i for i, line in enumerate(lines) if "Landroid/text/Html;->fromHtml" in line or "Landroid/net/Uri;->parse" in line or "DefaultExtractiFrameSourceUseCase;->execute" in line]
    assert len(calls) == 2 and all(start <= i < end for i in calls), "Both Android parsers inside fail-open guard"
    return start, end, handler


def run_nyt_predicate(root, group, parser_error=None, *, method=NYT_METHOD):
    lines = code(root, *method)
    start, end, handler = catch_contract(root, method)
    regs = {"r" + str(locals_count(root, *method)): group}
    pending, index, steps = None, 0, 0
    while index < len(lines):
        steps += 1
        assert steps <= len(lines) * 3, "NYT predicate must terminate"
        line = lines[index]
        op, _, body = line.partition(" ")
        if op.startswith("invoke-"):
            names, target = body.split("}, ", 1)
            args = [regs[name] for name in names[1:].split(", ")]
            if target.endswith("GroupAdapter;->getType()L" + GROUP + "$GroupType;"):
                pending = "html-group" if args[0].get("type") == "html" else "ordinary-group"
            elif target.endswith("GroupAdapter;->getMainTeasers()Ljava/util/List;"):
                pending = args[0].get("teasers")
            elif target == "Ljava/util/List;->size()I":
                pending = len(args[0])
            elif target == "Ljava/util/List;->get(I)Ljava/lang/Object;":
                pending = args[0][args[1]]
            elif "TeaserItem;->getTeaser()" in target:
                pending = args[0]
            elif "CueTeaser$HtmlBlock;->getHtmlBlock()Ljava/lang/String;" in target:
                pending = args[0].get("html")
            elif "CueTeaser$HtmlBlock;->getName()Ljava/lang/String;" in target:
                pending = args[0].get("name")
            elif target.endswith("DefaultExtractiFrameSourceUseCase;-><init>()V"):
                pass
            elif target.endswith("DefaultExtractiFrameSourceUseCase;->execute(Ljava/lang/String;)Ljava/lang/String;"):
                if parser_error == "source":
                    assert start <= index < end
                    index = handler
                    continue
                from mediahuis_shop_promo import run_shipped_src_extractor
                pending = run_shipped_src_extractor(root, args[1])
            elif target == "Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;":
                if parser_error == "html":
                    assert start <= index < end
                    index = handler
                    continue
                pending = {"urls": Anchors(args[0]).urls}
            elif target == "Ljava/lang/CharSequence;->length()I":
                pending = 1 if isinstance(args[0], dict) else len(args[0])
            elif target == "Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z":
                pending = int(args[1] in args[0])
            elif target == "Ljava/lang/String;->trim()Ljava/lang/String;":
                pending = args[0].strip()
            elif target == "Ljava/lang/String;->length()I":
                pending = len(args[0])
            elif target == "Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;":
                assert args[1:] == [0, 1, "Landroid/text/style/URLSpan;"]
                pending = args[0]["urls"]
            elif target == "Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;":
                pending = args[0]
            elif target == "Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;":
                if parser_error == "uri":
                    assert start <= index < end
                    index = handler
                    continue
                pending = urlsplit(args[0])
            elif target == "Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;":
                values = parse_qs(args[0].query, keep_blank_values=True).get(args[1])
                pending = values[0] if values else None
            elif target.startswith("Landroid/net/Uri;->get"):
                field = target.split("->get", 1)[1].split("(")[0]
                assert field in {"Scheme", "Host", "Path", "UserInfo", "Port"}
                parsed = args[0]
                pending = {"Scheme": parsed.scheme, "Host": parsed.hostname,
                           "Path": parsed.path, "UserInfo": parsed.username,
                           "Port": parsed.port if parsed.port is not None else -1}[field]
            elif target == "Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z":
                pending = int(args[1] is not None and args[0].casefold() == args[1].casefold())
            elif target == "Ljava/lang/String;->equals(Ljava/lang/Object;)Z":
                pending = int(args[0] == args[1])
            else:
                raise AssertionError("Unexpected NYT predicate call: " + target)
        elif op.startswith("move-result"):
            regs[body] = pending
        elif op == "move-exception":
            regs[body] = "parser-error"
        elif op == "new-instance":
            dest, typ = body.split(", ")
            assert typ.endswith("DefaultExtractiFrameSourceUseCase;")
            regs[dest] = {"type": typ}
        elif op == "sget-object":
            dest, field = body.split(", ", 1)
            assert field == "L" + GROUP + "$GroupType;->Html:L" + GROUP + "$GroupType;"
            regs[dest] = "html-group"
        elif op == "const-class":
            dest, value = body.split(", ", 1)
            regs[dest] = value
        elif op == "const-string":
            import json
            dest, value = body.split(", ", 1)
            regs[dest] = json.loads(value)
        elif op.startswith("const/"):
            dest, value = body.split(", ", 1)
            regs[dest] = int(value, 16)
        elif op == "instance-of":
            dest, value, typ = body.split(", ")
            assert typ.endswith("CueTeaser$HtmlBlock;")
            regs[dest] = int(isinstance(regs[value], dict) and regs[value].get("type") == "htmlBlock")
        elif op == "check-cast":
            pass
        elif op == "array-length":
            dest, array = body.split(", ")
            regs[dest] = len(regs[array])
        elif op == "aget-object":
            dest, array, offset = body.split(", ")
            regs[dest] = regs[array][regs[offset]]
        elif op.startswith("if-"):
            operands = body.split(", ")
            target = int(operands[-1][1:])
            if op in {"if-eqz", "if-nez"}:
                zero = regs[operands[0]] is None or regs[operands[0]] == 0
                take = zero if op == "if-eqz" else not zero
            else:
                assert op in {"if-eq", "if-ne"}, line
                equal = regs[operands[0]] == regs[operands[1]]
                take = equal if op == "if-eq" else not equal
            if take:
                index = target
                continue
        elif op.startswith("goto"):
            index = int(body[1:])
            continue
        elif op == "return":
            assert regs[body] in {0, 1}
            return bool(regs[body])
        else:
            raise AssertionError("Unexpected NYT predicate instruction: " + line)
        index += 1
    raise AssertionError("NYT predicate did not return")


def verify_nyt_promo(root, enabled, fixtures):
    exists = NYT_NAME + "(" in source(root, GROUP)
    assert exists == enabled, "Precise NYT helper only with Hide ads"
    if not enabled:
        return
    lines = code(root, *GROUP_GATE)
    parameter_start = locals_count(root, *GROUP_GATE)
    for row in fixtures:
        got = run_nyt_predicate(root, row["group"])
        assert got == row["expected_hidden"], ("NYT URL/type decision", row["case"], got)
        assert run_group_gate(lines, parameter_start, "none", nyt_hidden=got) == got, "NYT decision reaches whole-parent gate"
    positive = fixtures[0]["group"]
    for parser in ["html", "uri"]:
        assert run_nyt_predicate(root, positive, parser) is False, "Parser failure retains content"
