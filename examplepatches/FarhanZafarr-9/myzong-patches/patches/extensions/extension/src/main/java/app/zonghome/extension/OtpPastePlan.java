package app.zonghome.extension;

/** Pure paste planning. The result is local to a single explicit paste/IME commit, never cached. */
final class OtpPastePlan {
    final String digits;
    final int start;
    final boolean rejected;
    private OtpPastePlan(String digits,int start,boolean rejected){this.digits=digits;this.start=start;this.rejected=rejected;}
    static String prefix(String id) {
        if(!FormStyleSpec.digit(id))return null;
        return id.substring(0,id.length()-1);
    }
    static OtpPastePlan create(CharSequence source,int capacity,int current) {
        if(source==null || source.length()<2 || source.length()>128 || capacity<4 || capacity>6 || current<0 || current>=capacity)return null;
        StringBuilder digits=new StringBuilder();
        for(int i=0;i<source.length();i++) {
            char value=source.charAt(i);int digit=Character.digit(value,10);
            if(digit>=0)digits.append((char)('0'+digit));
            else if(!Character.isWhitespace(value) && value!='-' && value!='\u00a0' && value!='\u200b' && value!='\u200e' && value!='\u200f')return null;
        }
        if(digits.length()<2)return null;
        if(digits.length()>capacity)return new OtpPastePlan("",current,true);
        int start=digits.length()==capacity?0:current;
        if(digits.length()>capacity-start)return new OtpPastePlan("",start,true);
        return new OtpPastePlan(digits.toString(),start,false);
    }
}
