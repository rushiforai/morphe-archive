package app.morphe.extension.chmate;

public final class RedIdExclusionsTest {
    static int checks;
    static void check(boolean ok) { if (!ok) throw new AssertionError("case " + checks); ++checks; }
    static void reject(String source) { try { RedIdExclusions.parse(source); throw new AssertionError("accepted invalid input"); } catch (IllegalArgumentException expected) { ++checks; } }
    public static void main(String[] args) {
        check(RedIdExclusions.parse(null).isEmpty());
        check(RedIdExclusions.parse("\n \r\n").isEmpty());
        var ids = RedIdExclusions.parse("ID:Abc+/123\r\nAbc+/123\nabc+/123\n ID: Other0 \n");
        check(ids.size() == 3);
        check(ids.contains("Abc+/123"));
        check(ids.contains("abc+/123"));
        check(ids.contains("Other0"));
        check(!ids.contains("Other"));
        check(!ids.contains("ABC+/123"));
        reject("two ids"); reject("??"); reject("x\ty"); reject("x\u0000y"); reject("x".repeat(129));
        StringBuilder full = new StringBuilder();
        for (int i = 0; i < 500; ++i) full.append("id").append(i).append('\n');
        check(RedIdExclusions.parse(full.toString()).size() == 500);
        reject(full.append("overflow").toString()); reject("x".repeat(65537));
        check(RedIdExclusions.parse("ID:Other0").contains("Other0"));
        check(RedIdExclusions.parse("").isEmpty());
        System.out.println("PASS red ID exclusions " + checks + " checks");
    }
}
