package app.morphe.extension.chmate;

/** Offline regressions for names copied from HTML and Hissi's encoded-ID links. */
public final class HissiFullSlipRegression {
    private static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    public static void main(String[] args){
        String[] names={"(ﾜｯﾁｮｲ Sdff-Q8ld)","（ﾜｯﾁｮｲ Ｓｄｆｆ－Ｑ８ｌｄ）","ﾜｯﾁｮｲ Sdff\u2011Q8ld","ﾜｯﾁｮｲ Sdff-\u200bQ8ld"};
        for(String text:names){
            var match=WacchoiSearch.SLIP.matcher(WacchoiSearch.normalizeSlipText(text));
            check(match.find()&&WacchoiSearch.matchesFilter("Sdff-Q8ld",match,false),"full slip missed: "+text);
            check(!WacchoiSearch.matchesFilter("Sdff-Q8LD",match,false),"case must stay exact");
        }
        String base="http://hissi.org/read.php/android/20261024/";
        check((base+"ab+cd_ef.html").equals(WacchoiSearch.profileUrl(base,"./ab+cd_ef.html")),"standard Base64 plus rejected");
        check((base+"ab/cd.html").equals(WacchoiSearch.profileUrl(base,"./ab/cd.html")),"standard Base64 slash rejected");
        check(WacchoiSearch.profileUrl(base,"https://example.org/a.html")==null,"external profile accepted");
        check(WacchoiSearch.profileUrl(base,"javascript:alert(1)")==null,"non-http URL accepted");
        check(WacchoiSearch.profileUrl(base,"../other.html")==null,"invalid date path accepted");
        System.out.println("PASS: full-slip normalization, case matching, Base64 profile URLs, URL boundaries");
    }
}
