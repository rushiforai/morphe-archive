/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
/** A local renewal hint only. The remote service always verifies token authenticity. */
final class TokenExpiry {
    private static final java.util.regex.Pattern EXP=java.util.regex.Pattern.compile("\"exp\"\\s*:\\s*(\\d+)\\s*[,}]");
    static boolean expired(String token,long nowSeconds){return remaining(token,nowSeconds)<=0;}
    static boolean needsRenewal(String token,long nowSeconds){return remaining(token,nowSeconds)<=3600;}
    private static long remaining(String token,long nowSeconds){
        if(token==null||token.length()>8192)return -1;
        try{
            String[] parts=token.split("\\.");if(parts.length!=3)return -1;
            String payload=new String(java.util.Base64.getUrlDecoder().decode(parts[1]),java.nio.charset.StandardCharsets.UTF_8);
            java.util.regex.Matcher match=EXP.matcher(payload);
            return match.find()?Long.parseLong(match.group(1))-nowSeconds:-1;
        }catch(IllegalArgumentException ignored){return -1;}
    }
}

