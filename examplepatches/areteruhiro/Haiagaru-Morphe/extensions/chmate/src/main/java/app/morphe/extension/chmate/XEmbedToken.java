package app.morphe.extension.chmate;

/** Public syndication embed token: the web embed's Number(id)/1e15*PI in radix 36. Not an account credential. */
public final class XEmbedToken {
    public static String forPost(String id){
        if(id==null||!id.matches("[0-9]{1,25}"))throw new IllegalArgumentException("Invalid post ID");
        double value=Double.parseDouble(id)/1e15*Math.PI;
        long whole=(long)Math.floor(value);double fraction=value-whole,delta=Math.ulp(value)*.5;
        StringBuilder digits=new StringBuilder();
        while(fraction>delta&&digits.length()<64){
            fraction*=36;delta*=36;int digit=(int)fraction;fraction-=digit;
            digits.append(Character.forDigit(digit,36));
            if(fraction>.5&&fraction+delta>=1){
                int i=digits.length()-1;
                while(i>=0&&digits.charAt(i)=='z'){digits.setCharAt(i--,'0');}
                if(i<0)whole++;else digits.setCharAt(i,Character.forDigit(Character.digit(digits.charAt(i),36)+1,36));
                break;
            }
        }
        return (Long.toString(whole,36)+digits).replace("0","");
    }
    public static void main(String[] ids){for(String id:ids)System.out.println(forPost(id));}
    private XEmbedToken(){}
}
