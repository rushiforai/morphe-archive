"""Verify exact promotion filtering before shared group/header construction."""
from mediahuis_emitted import (code, digest, locals_count, remove_instructions,
                              run_boundary, source)
from mediahuis_sponsored_groups import GROUP, run_group_gate


PROMO_NAME = "morpheIsPublisherPromotionGroup"
PROMO_METHOD = (GROUP, PROMO_NAME + "(L" + GROUP + ";)Z")
GROUP_COMPONENTS = (
    "com/mediahuis/oneapps/cueappsdk/domain/internal/griditem/usecases/GetComponentItemsForGroupUseCase",
    "execute(Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/StoryBlockType;Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/group/GroupAdapter;Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/adapters/GroupOptions;Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/models/GridItemData$PageConfig;Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/models/GridItemData$TeaserConfig;Ljava/lang/String;Lcom/mediahuis/oneapps/cueappsdk/data/personalised/helpers/PersonalisedArticlesRequestCombiner;Ljava/util/List;)Lkotlinx/coroutines/flow/Flow;",
)
COMPONENT_PREFIX_LENGTH = 8


def verify_group_promotions(root, enabled, originals):
    pins = {(cls, sig): expected for cls, sig, expected in originals}
    assert (PROMO_NAME + "(" in source(root, GROUP)) == enabled, "Shared promotion helper only with Hide ads"
    lines = code(root, *GROUP_COMPONENTS)
    if enabled:
        prefix = lines[:COMPONENT_PREFIX_LENGTH]
        group = "r" + str(locals_count(root, *GROUP_COMPONENTS) + 2)
        assert prefix[:3] == [
            "invoke-static/range {" + group + " .. " + group + "}, L" + GROUP + ";->" + PROMO_NAME + "(L" + GROUP + ";)Z",
            "move-result r0", "if-eqz r0, @8",
        ], "Exact group argument; unmarked/null groups resume original entry"
        assert prefix[-1] == "return-object r0", "Typed Flow object return"
        assert run_boundary(prefix[3:]) == {"emissions": [[]], "completes": True}, "Real once-emitting empty-list Flow"
        predicate = code(root, *PROMO_METHOD)
        start = locals_count(root, *PROMO_METHOD)
        for theme in [None, "none", "premium", "accent-soft", "sponsored-content", "sponsored-content-other", "Sponsored-Content", "sponsored"]:
            for options in [False, True]:
                for nyt in [False, True]:
                    for shop in [False, True]:
                        for present in [False, True]:
                            want = present and ((options and theme == "sponsored-content") or nyt or shop)
                            got = run_group_gate(predicate, start, theme,
                                                 options_present=options, nyt_hidden=nyt,
                                                 shop_hidden=shop, group_present=present)
                            assert got == want, ("shared promotion decision", theme, options, nyt, shop, present)
        lines = remove_instructions(lines, 0, COMPONENT_PREFIX_LENGTH)
    assert digest(lines) == pins[GROUP_COMPONENTS], "Retain complete original component/header builder"
