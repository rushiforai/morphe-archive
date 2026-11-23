package app.template.patches.digisport.betting

import app.template.patches.digisport.ads.dataGetterFingerprint

internal const val UI_RESULTS_MATCH = "Lro/rcsrds/digisport/data/model/ui/articles/UIResultsMatch;"
internal const val UI_RESULTS_MATCH_BET = "Lro/rcsrds/digisport/data/model/ui/articles/UIResultsMatchBet;"

// UIResultsMatch's bet getter (renamed since 1.1.16; the serialised field "bet" keeps its name):
// the bookmaker odds (1 / X / 2 and the bet link) of a soccer match row. The match row binding
// sets the odds block (@id/nas) GONE when it is null, and the block's click callback returns
// early on null.
internal val uiResultsMatchBetFingerprint = dataGetterFingerprint(UI_RESULTS_MATCH, "bet", UI_RESULTS_MATCH_BET)
