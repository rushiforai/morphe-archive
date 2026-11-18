"""Execute the footer-shop predicate and the publisher's actual src extractor."""
import re

from mediahuis_emitted import code, locals_count, source
from mediahuis_group_promotions import PROMO_METHOD
from mediahuis_nyt_promo import run_nyt_predicate
from mediahuis_sponsored_groups import GROUP, run_group_gate


SHOP_NAME = "morpheIsShopPromotionGroup"
SHOP_METHOD = (GROUP, SHOP_NAME + "(L" + GROUP + ";)Z")
SRC_EXTRACTOR = (
    "com/mediahuis/oneapps/cueappsdk/toclean/usecases/DefaultExtractiFrameSourceUseCase",
    "execute(Ljava/lang/String;)Ljava/lang/String;",
)


def run_shipped_src_extractor(root, html):
    """Interpret the untouched emitted parser; Regex is the only parsing boundary."""
    lines = code(root, *SRC_EXTRACTOR)
    start = locals_count(root, *SRC_EXTRACTOR)
    regs = {"r" + str(start): None, "r" + str(start + 1): html}
    pending, index = None, 0
    while index < len(lines):
        op, _, body = lines[index].partition(" ")
        if op.startswith("invoke-"):
            names, target = body.split("}, ", 1)
            args = [regs[name] for name in names[1:].split(", ")]
            if target == "Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V":
                assert args[0] is not None
            elif target == "Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V":
                args[0]["pattern"] = args[1]
            elif target == "Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;":
                assert args[2:] == [0, 2, 0]
                match = re.search(args[0]["pattern"], args[1])
                pending = [match.group(0), *match.groups()] if match else None
            elif target == "Lkotlin/text/MatchResult;->getGroups()Lkotlin/text/MatchGroupCollection;":
                pending = args[0]
            elif target == "Lkotlin/text/MatchGroupCollection;->get(I)Lkotlin/text/MatchGroup;":
                pending = args[0][args[1]]
            elif target == "Lkotlin/text/MatchGroup;->getValue()Ljava/lang/String;":
                pending = args[0]
            else:
                raise AssertionError("Unexpected shipped src-parser call: " + target)
        elif op == "new-instance":
            dest, typ = body.split(", ")
            assert typ == "Lkotlin/text/Regex;"
            regs[dest] = {}
        elif op == "const-string":
            import json
            dest, literal = body.split(", ", 1)
            regs[dest] = json.loads(literal)
        elif op.startswith("const/"):
            dest, literal = body.split(", ")
            regs[dest] = int(literal, 16)
        elif op.startswith("move-result"):
            regs[body] = pending
        elif op == "check-cast":
            pass
        elif op == "if-eqz":
            value, label = body.split(", ")
            if regs[value] is None or regs[value] == 0:
                index = int(label[1:])
                continue
        elif op == "return-object":
            value = regs[body]
            return None if value is None or value == 0 else value
        else:
            raise AssertionError("Unexpected shipped src-parser instruction: " + lines[index])
        index += 1
    raise AssertionError("Shipped src parser did not return")


def run_shop_predicate(root, group, parser_error=None):
    return run_nyt_predicate(root, group, parser_error, method=SHOP_METHOD)


def verify_shop_promo(root, enabled, fixtures):
    assert (SHOP_NAME + "(" in source(root, GROUP)) == enabled, "Precise footer Shop helper only with Hide ads"
    if not enabled:
        return
    predicate = code(root, *PROMO_METHOD)
    start = locals_count(root, *PROMO_METHOD)
    for row in fixtures:
        result = run_shop_predicate(root, row["group"])
        assert result == row["expected_hidden"], ("footer Shop type/name/source decision", row["case"], result)
        assert run_group_gate(predicate, start, "none", shop_hidden=result) == result, "Footer Shop reaches shared parent predicate"
    for parser in ["source", "uri"]:
        assert run_shop_predicate(root, fixtures[0]["group"], parser) is False, "Shop parser failure retains content"
