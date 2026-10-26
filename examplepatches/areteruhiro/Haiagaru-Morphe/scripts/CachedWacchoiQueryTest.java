package app.morphe.extension.chmate;
public final class CachedWacchoiQueryTest {
    static int checks;
    static void eq(Object want,Object got){checks++;if(!java.util.Objects.equals(want,got))throw new AssertionError(want+" != "+got);}
    public static void main(String[] args){
        eq("-kAAU",CachedWacchoiQuery.suffix("(ﾜｯﾁｮｲ 0785-kAAU)"));
        eq("-6Zun",CachedWacchoiQuery.suffix("bed4-6Zun"));
        eq("-a+/Z",CachedWacchoiQuery.suffix("ｽｯﾌﾟ Sdff-a+/Z"));
        eq(null,CachedWacchoiQuery.suffix("ID:abcd"));
        eq(null,CachedWacchoiQuery.suffix("abcde-6Zun"));
        eq(null,CachedWacchoiQuery.suffix("bed4-6Zunn"));
        eq(null,CachedWacchoiQuery.suffix(null));
        eq("bed4-6Zun",CachedWacchoiQuery.restore("-6Zun","-6Zun","bed4-6Zun"));
        eq("edited",CachedWacchoiQuery.restore("edited","-6Zun","bed4-6Zun"));
        eq("-6Zun",CachedWacchoiQuery.suffix("[ﾜｯﾁｮｲ bed4-6Zun 2/9]"));
        System.out.println("PASS cached Wacchoi query "+checks+" checks");
    }
}
