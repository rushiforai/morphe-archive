package io.github.bryceaspringfield.morphe.extension.youtube;

/** A standalone check of Metadata's parsers: javac the two files and run main (no test framework in the bundle). */
public final class MetadataCheck {

    private static int failures;

    private static void eq(String name, Object got, Object want) {
        boolean ok = String.valueOf(got).equals(String.valueOf(want));
        if (!ok) failures++;
        System.out.println((ok ? "ok   " : "FAIL ") + name + " -> " + got + (ok ? "" : " (want " + want + ")"));
    }

    public static void main(String[] args) {
        eq("views 1.2M", Metadata.views("title\n1.2m views • 3 years ago"), 1200000L);
        eq("views 523", Metadata.views("523 views"), 523L);
        eq("views 1", Metadata.views("1 view"), 1L);
        eq("views none", Metadata.views("no views"), 0L);
        eq("views 12K", Metadata.views("12k views"), 12000L);
        eq("views 1,234", Metadata.views("1,234 views"), 1234L);
        eq("views es 1,2 M", Metadata.views("1,2 m de visualizaciones"), 1200000L);
        eq("views es mil", Metadata.views("45 mil visualizaciones"), 45000L);
        eq("views es 1.234", Metadata.views("1.234 visualizaciones"), 1234L);
        eq("views million", Metadata.views("1.2 million views"), 1200000L);
        eq("views absent", Metadata.views("streamed 2 days ago"), -1L);
        eq("age 3 years", Math.round(Metadata.ageDays("1.2m views • 3 years ago")), 1096L);
        eq("age 2 weeks", Math.round(Metadata.ageDays("2 weeks ago")), 14L);
        eq("age 5 hours", Metadata.ageDays("5 hours ago") < 1, true);
        eq("age es semanas", Math.round(Metadata.ageDays("hace 2 semanas")), 14L);
        eq("age es meses", Math.round(Metadata.ageDays("hace 3 meses")), 91L);
        eq("age es años", Math.round(Metadata.ageDays("hace 1 año")), 365L);
        eq("age streamed", Math.round(Metadata.ageDays("streamed 2 days ago")), 2L);
        eq("age none", Metadata.ageDays("12:34"), -1.0);
        eq("members", Metadata.membersOnly("a video\nmembers only\nchannel"), true);
        eq("members title word", Metadata.membersOnly("how members only clubs work"), false);
        eq("upcoming", Metadata.upcoming("title\npremieres in 3 hours"), true);
        eq("premiered", Metadata.upcoming("premiered 2 hours ago"), false);
        eq("scheduled", Metadata.upcoming("scheduled for 11/20/26"), true);
        eq("es upcoming", Metadata.upcoming("se estrena en 3 horas"), true);
        eq("title upcoming", Metadata.upcoming("upcoming trends in ai"), false);
        eq("parseViews 5k", Metadata.parseViews("5k"), 5000L);
        eq("parseViews 1.5m", Metadata.parseViews("1.5m"), 1500000L);
        eq("parseViews 5000", Metadata.parseViews("5000"), 5000L);
        eq("parseViews blank", Metadata.parseViews(""), -1L);
        eq("parseAge 30", Metadata.parseAge("30"), 30.0);
        eq("parseAge 8w", Metadata.parseAge("8w"), 56.0);
        eq("parseAge 2y", Metadata.parseAge("2y"), 730.5);
        eq("parseAge bad", Metadata.parseAge("soon"), -1.0);
        eq("course lessons", Metadata.isCourse("\u000b79 lessons8\u0012"), true);
        eq("course byline", Metadata.isCourse("(Jazz For Soul · Course · Updated today\u0012"), true);
        eq("course card line", Metadata.isCourse("\u0016Course · Updated today\u0012"), true);
        eq("curso alone", Metadata.isCourse("\u0005Curso\u0012"), true);
        eq("curso card line", Metadata.isCourse("\u0016Curso · Actualizado hoy\u0012"), true);
        eq("lecciones", Metadata.isCourse("\u000c13 lecciones8"), true);
        eq("title with course", Metadata.isCourse("\u0020Course intro: how to cook\u0012"), false);
        eq("title crash course", Metadata.isCourse("\u0012Crash Course History\u0012"), false);
        eq("plain video", Metadata.isCourse("\u00131.2 million views, 3 days ago"), false);
        System.out.println(failures == 0 ? "ALL_PASS" : "FAILURES " + failures);
        System.exit(failures == 0 ? 0 : 1);
    }
}
