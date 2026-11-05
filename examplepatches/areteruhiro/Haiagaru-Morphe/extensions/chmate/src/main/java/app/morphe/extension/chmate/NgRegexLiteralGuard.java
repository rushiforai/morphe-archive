package app.morphe.extension.chmate;

/** Conservative necessary substring for a case-sensitive concatenation; unknown syntax has no guard. */
final class NgRegexLiteralGuard {
    static String required(String expression) {
        // DOTALL affects dots, not the literal requirements. Do not accept case folding or other flags.
        if(expression.startsWith("(?s:")&&expression.endsWith(")"))expression=expression.substring(4,expression.length()-1);
        String result=parse(expression,true);
        return result!=null&&result.length()>=2?result:"";
    }
    private static String parse(String expression,boolean lookaheads) {
        String longest="";
        StringBuilder run=new StringBuilder();
        for(int i=0;i<expression.length();i++) {
            char c=expression.charAt(i);
            if(c=='\\') {
                if(++i>=expression.length())return null;
                char escaped=expression.charAt(i);
                if(escaped=='Q') {
                    int end=expression.indexOf("\\E",i+1);
                    if(end<0){run.append(expression,i+1,expression.length());i=expression.length();}
                    else {run.append(expression,i+1,end);i=end+1;}
                } else if("\\.^$|?*+()[]{}".indexOf(escaped)>=0)run.append(escaped);
                else return null;
            } else if(lookaheads&&expression.startsWith("(?=",i)) {
                int end=lookaheadEnd(expression,i+3);
                if(end<0)return null;
                String required=parse(expression.substring(i+3,end),false);
                if(required==null)return null;
                if(run.length()>longest.length())longest=run.toString();
                run.setLength(0);
                if(required.length()>longest.length())longest=required;
                i=end;
            } else if(c=='.'&&i+1<expression.length()&&(expression.charAt(i+1)=='*'||expression.charAt(i+1)=='+')) {
                if(run.length()>longest.length())longest=run.toString();
                run.setLength(0);i++;
            } else if(c=='.') {
                if(run.length()>longest.length())longest=run.toString();
                run.setLength(0);
            } else if(c=='^'&&i==0||c=='$'&&i==expression.length()-1) {
                // Anchors consume no characters.
            } else if(".^$|?*+()[]{}".indexOf(c)>=0)return null;
            else run.append(c);
        }
        if(run.length()>longest.length())longest=run.toString();
        return longest;
    }
    private static int lookaheadEnd(String expression,int from) {
        for(int i=from;i<expression.length();i++) {
            char c=expression.charAt(i);
            if(c=='\\') {
                if(++i>=expression.length())return -1;
                if(expression.charAt(i)=='Q') {
                    int end=expression.indexOf("\\E",i+1);
                    if(end<0)return -1;
                    i=end+1;
                }
            } else if(c=='(')return -1;
            else if(c==')')return i;
        }
        return -1;
    }
}
