"""Execute the emitted group gate against independently captured CMS markers."""
import json

from mediahuis_emitted import code, digest, locals_count, remove_instructions


GROUP = "com/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter"
OPTIONS = "com/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/GroupOptions"
GROUP_GATE = (GROUP, "isHidden_delegate$lambda$0(L" + GROUP + ";)Z")
HOME_GROUPS = (
    "com/mediahuis/oneapps/cueappsdk/toclean/articles/pagebuilders/HomePageBuilder",
    "homepageItems$co_novemberfive_mediahuis_cueappsdk(Lcom/mediahuis/oneapps/cueappsdk/data/cue/models/pages/section/CueSectionPage;Ljava/util/List;Lcom/mediahuis/oneapps/cueappsdk/data/cue/models/pages/section/CueSectionPageRootGroup$HomepageGroup;Lcom/mediahuis/oneapps/cueappsdk/data/cue/models/common/mysection/CueMySectionDataMap;Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/models/GridItemData$PageConfig;Lcom/mediahuis/oneapps/cueappsdk/data/personalised/helpers/PersonalisedArticlesRequestCombiner;Ljava/util/List;Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/pagebuilders/paywall/PaywallBuilderHolder;)Lkotlinx/coroutines/flow/Flow;",
)
GROUP_PREFIX_LENGTH = 16  # Five precise NYT-card instructions, then eleven sponsored-theme instructions.


def run_group_gate(lines, parameter_start, theme, *, options_present=True,
                   originally_hidden=False, empty=False, nyt_hidden=False,
                   shop_hidden=False, group_present=True):
    """Interpret real gate instructions; reject calls outside its pure getters."""
    group = {"group": True} if group_present else None
    options = {"options": True}
    hidden_type = "L" + OPTIONS.rsplit("/", 1)[0] + "/StoryBlockType;->Hide:L" + OPTIONS.rsplit("/", 1)[0] + "/StoryBlockType;"
    regs = {"r" + str(parameter_start): group}
    pending = None
    index = 0
    steps = 0
    while index < len(lines):
        steps += 1
        assert steps <= len(lines) * 3, "Group gate must terminate"
        line = lines[index]
        op, _, body = line.partition(" ")
        if op.startswith("invoke-"):
            names, target = body.split("}, ", 1)
            args = [regs[name] for name in names[1:].split(", ")]
            if target == "L" + GROUP + ";->getGroupOptions()L" + OPTIONS + ";":
                assert args == [group]
                pending = options if options_present else None
            elif target == "L" + OPTIONS + ";->getGroupTheme()Ljava/lang/String;":
                assert args == [options]
                pending = theme
            elif target == "L" + OPTIONS + ";->getType()L" + OPTIONS.rsplit("/", 1)[0] + "/StoryBlockType;":
                assert args == [options]
                pending = hidden_type if originally_hidden else None
            elif target == "L" + GROUP + ";->isEmpty()Z":
                assert args == [group]
                pending = int(empty)
            elif target == "L" + GROUP + ";->morpheIsNytPromotionGroup(L" + GROUP + ";)Z":
                assert args == [group]
                pending = int(nyt_hidden)
            elif target == "L" + GROUP + ";->morpheIsShopPromotionGroup(L" + GROUP + ";)Z":
                assert args == [group]
                pending = int(shop_hidden)
            elif target == "Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z":
                pending = int(args[0] == args[1])
            else:
                raise AssertionError("Unexpected group-gate call: " + target)
        elif op.startswith("move-result"):
            regs[body] = pending
        elif op == "sget-object":
            dest, field = body.split(", ", 1)
            assert field == hidden_type
            regs[dest] = field
        elif op == "const-string":
            dest, literal = body.split(", ", 1)
            regs[dest] = json.loads(literal)
        elif op == "const/4":
            dest, literal = body.split(", ", 1)
            regs[dest] = int(literal, 16)
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
            assert regs[body] in {0, 1}, "Boolean group decision"
            return bool(regs[body])
        else:
            raise AssertionError("Unexpected group-gate instruction: " + line)
        index += 1
    raise AssertionError("Group gate did not return")


def verify_sponsored_groups(root, enabled, originals):
    pins = {(cls, sig): expected for cls, sig, expected in originals}
    lines = code(root, *GROUP_GATE)
    parameter_start = locals_count(root, *GROUP_GATE)
    for theme in [None, "none", "premium", "accent-soft", "sponsored-content",
                  "sponsored-content-other", "Sponsored-Content", "sponsored"]:
        for options_present in [False, True]:
            for hidden in [False, True]:
                for empty in [False, True]:
                    want = ((enabled and options_present and theme == "sponsored-content")
                            or (options_present and hidden) or empty)
                    got = run_group_gate(lines, parameter_start, theme,
                                         options_present=options_present,
                                         originally_hidden=hidden, empty=empty)
                    assert got == want, ("sponsored group decision", theme,
                                         options_present, hidden, empty, got, want)
    original_lines = remove_instructions(lines, 0, GROUP_PREFIX_LENGTH) if enabled else lines
    assert digest(original_lines) == pins[GROUP_GATE], "Retain original group visibility tail"
    assert digest(code(root, *HOME_GROUPS)) == pins[HOME_GROUPS], "Retain complete parent filtering and group construction"
