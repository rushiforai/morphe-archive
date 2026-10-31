package santodan.patches;

import app.morphe.patcher.patch.BytecodePatchContext;

final class Pillo627Summary {
    static void apply(BytecodePatchContext context) {
        Pillo627Contracts.summary(Pillo627.classes(context));
        var vm = PilloWeightSummaryPatch.VM;
        PilloWeightSummaryPatch.defaultAll(Pillo627.method(context, vm, "<init>"));
        Pillo627.redirect(Pillo627.method(context, vm, "loadWeightRecordData"), "Ljv/e;", "s1", Pillo627.SUMMARY, "takeLast");
        String content = PilloWeightSummaryPatch.CONTENT;
        Pillo627.redirect(Pillo627.method(context, content, "WeightChartContent"),
            PilloWeightSummaryPatch.FILTER + "ChooseTakeLastLayoutKt;", "rememberChooseTakeLastLayout", Pillo627.SUMMARY, "rememberFilter");
        Pillo627.redirect(Pillo627.method(context, content, "WeightChartContent$lambda$7$0"),
            PilloWeightSummaryPatch.FILTER + "TakeLastFilterBtnKt;", "TakeLastFilterBtn", Pillo627.SUMMARY, "filterButton");
        // The R8 bridge preserves the captured state and unit as explicit static arguments.
        Pillo627.redirect(Pillo627.method(context, Pillo627.CARD, "a"), Pillo627.CARD,
            Pillo627.CARD_RENDER, Pillo627.SUMMARY, "render");
        var render = Pillo627.method(context, Pillo627.CARD, Pillo627.CARD_RENDER);
        String aggregate = Pillo627.ROOT + "ui/report/tracker/components/aggregate/";
        Pillo627.redirect(render, aggregate + "LatestValueDisplayKt;", "LatestValueDisplay", Pillo627.SUMMARY, "latest");
        Pillo627.redirect(render, aggregate + "AvgMinMaxRowKt;", "AvgMinMaxRow", Pillo627.SUMMARY, "averages");
    }
}
