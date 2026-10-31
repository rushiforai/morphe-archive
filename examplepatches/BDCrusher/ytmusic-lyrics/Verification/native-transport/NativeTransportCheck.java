package app.bdcrusher.ytmusic.lyrics;
public final class NativeTransportCheck {
    static void check(boolean valid,String message){if(!valid)throw new AssertionError(message);}
    static String token(String payload){return "eyJhbGciOiJIUzI1NiJ9."+java.util.Base64.getUrlEncoder().withoutPadding().encodeToString(payload.getBytes(java.nio.charset.StandardCharsets.UTF_8))+".signature";}
    public static void main(String[] args)throws Exception{
        long now=1800000000L;
        check(TokenExpiry.expired(token("{\"exp\":1799999999}"),now),"Expired token");
        check(TokenExpiry.expired(token("{\"exp\":1800000059}"),now),"Renewal grace");
        check(!TokenExpiry.expired(token("{\"exp\":1800000600}"),now),"Valid future token");
        check(!TokenExpiry.expired("malformed",now),"Malformed token falls through to server verification");
        check(!TokenExpiry.expired(token("{\"iat\":10}"),now),"No expiry falls through to server verification");
        LyricsNetwork network=new LyricsNetwork();
        String body=network.request("https://api.betterlyrics.org/getLyrics?s=Wake%20Up&a=Imagine%20Dragons&al=LOOM&d=167","GET",null,null);
        check(body.contains("\"ttml\"")&&body.length()>10000,"Exact native transport public TTML lookup");
        boolean notFound=false;try{network.request("https://unison.betterlyrics.org/lyrics?v=sN_tJ8d3c0I","GET",null,null);}catch(LyricsNetwork.HttpFailure ex){notFound=ex.status==404;}
        check(notFound,"Unison not found is a typed outcome");
        boolean blocked=false;try{network.open("https://example.com/","GET",null,null);}catch(java.io.IOException expected){blocked=true;}
        check(blocked,"Origin restriction");network.close();
        boolean canceled=false;try{network.open("https://api.betterlyrics.org/","GET",null,null);}catch(java.io.IOException expected){canceled=true;}
        check(canceled,"Canceled transport");
        java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),"{\"passed\":true,\"jvmTransport\":true,\"androidTlsVerified\":false,\"expiryScenarios\":5,\"publicTtmlResponseChars\":"+body.length()+",\"unisonStatus\":404,\"originRestriction\":true,\"cancellation\":true}");
        System.out.println("PASS: exact native Java transport, typed 404, cancellation, origin restriction and five expiry hints");
    }
}

