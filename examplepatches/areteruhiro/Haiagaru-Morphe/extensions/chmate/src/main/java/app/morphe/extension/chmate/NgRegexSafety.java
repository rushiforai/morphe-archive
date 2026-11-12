package app.morphe.extension.chmate;

import java.util.regex.*;
import java.util.*;
import java.text.Normalizer;

/** Conservative checks for shared rules; never rewrites downloaded or local expressions. */
final class NgRegexSafety {
    private static final Pattern SCATTER=Pattern.compile(
            "(?:\\.\\*)?\\((?:\\?:)?\\[([^\\]\\\\]{1,64})\\]\\.\\*[?+]?\\)\\s*\\{([0-9]{1,4})(?:,([0-9]{0,4}))?\\}(?:\\.\\*)?");
    static boolean overbroadKeyword(String expression) {
        if(expression==null)return false;
        if(expression.startsWith("(?s:")&&expression.endsWith(")"))expression=expression.substring(4,expression.length()-1);
        if(expression.startsWith("(?s)"))expression=expression.substring(4);
        List<String> alternatives=alternatives(expression);
        for(String branch:alternatives) {
            String literal=literal(branch);
            if(literal!=null&&(!SharedNgRules.shareableKeyword(literal)||!identityContent(literal)))return true;
            Matcher match=SCATTER.matcher(unanchor(branch));
            if(match.matches()&&!match.group(1).startsWith("^")&&Integer.parseInt(match.group(2))>=2)return true;
        }
        return false;
    }
    private static List<String> alternatives(String expression) {
        List<String> out=new ArrayList<>();int start=0,depth=0;boolean bracket=false,escaped=false,quoted=false;
        for(int i=0;i<=expression.length();i++) {
            char c=i==expression.length()?'|':expression.charAt(i);
            if(quoted){if(c=='\\'&&i+1<expression.length()&&expression.charAt(i+1)=='E'){quoted=false;i++;}continue;}
            if(escaped){escaped=false;continue;}
            if(c=='\\'&&i+1<expression.length()&&expression.charAt(i+1)=='Q'){quoted=true;i++;continue;}
            if(c=='\\'){escaped=true;continue;}
            if(c=='['&&!bracket){bracket=true;continue;}
            if(c==']'&&bracket){bracket=false;continue;}
            if(bracket)continue;
            if(c=='(')depth++;else if(c==')')depth--;
            if(c=='|'&&depth==0) {
                out.add(expression.substring(start,i));
                start=i+1;
            }
        }
        // A Java \\Q quote may legally run to the end of the expression.
        if(start<=expression.length()&&(quoted||escaped||depth!=0||bracket))out.add(expression.substring(start));
        return out;
    }
    private static String unanchor(String branch){
        if(branch.startsWith("^"))branch=branch.substring(1);
        if(branch.endsWith("$")&&!branch.endsWith("\\$"))branch=branch.substring(0,branch.length()-1);
        return branch;
    }
    /** Only known plain literals; quantifiers, classes and lookarounds stay unknown. */
    private static String literal(String branch){
        branch=unanchor(branch);StringBuilder out=new StringBuilder();
        for(int i=0;i<branch.length();i++){
            char c=branch.charAt(i);
            if(c=='\\'){
                if(++i==branch.length())return null;char next=branch.charAt(i);
                if(next=='Q'){int end=branch.indexOf("\\E",i+1);if(end<0){out.append(branch.substring(i+1));break;}out.append(branch,i+1,end);i=end+1;}
                else if("\\.^$|?*+()[]{}-".indexOf(next)>=0)out.append(next);
                else return null;
            }else if(".^$|?*+()[]{}".indexOf(c)>=0)return null;
            else out.append(c);
        }
        return out.toString();
    }
    /** Delimiters and the fixed Wacchoi/IP label are not evidence of a poster identity. */
    static boolean identityContent(String match){
        String value=withoutLabels(match);
        for(int i=0;i<value.length();){int cp=value.codePointAt(i);i+=Character.charCount(cp);if(Character.isLetterOrDigit(cp))return true;}
        return false;
    }
    static boolean keywordContent(String match){
        String value=withoutLabels(match);
        for(int i=0;i<value.length();){int cp=value.codePointAt(i);i+=Character.charCount(cp);int type=Character.getType(cp);
            if(!Character.isWhitespace(cp)&&type!=Character.SPACE_SEPARATOR&&type!=Character.CONNECTOR_PUNCTUATION&&type!=Character.DASH_PUNCTUATION&&type!=Character.START_PUNCTUATION&&type!=Character.END_PUNCTUATION&&type!=Character.OTHER_PUNCTUATION&&type!=Character.INITIAL_QUOTE_PUNCTUATION&&type!=Character.FINAL_QUOTE_PUNCTUATION)return true;
        }return false;
    }
    private static String withoutLabels(String value){return Normalizer.normalize(value,Normalizer.Form.NFKC).replace("ワッチョイ","").replace("ﾜｯﾁｮｲ","").replace("IP","").replace("ip","");}
    private NgRegexSafety(){}
}
