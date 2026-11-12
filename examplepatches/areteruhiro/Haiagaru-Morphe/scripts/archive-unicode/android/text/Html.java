package android.text;
/** Host-only entity decoder; Android's actual Html implementation is tested by instrumentation. */
public final class Html {
    public static Spanned fromHtml(String input) {
        String decoded=org.jsoup.parser.Parser.unescapeEntities(input,false);
        return (Spanned)java.lang.reflect.Proxy.newProxyInstance(Html.class.getClassLoader(),new Class[]{Spanned.class},(p,m,a)->{
            if(m.getName().equals("toString"))return decoded;
            if(m.getName().equals("length"))return decoded.length();
            if(m.getName().equals("charAt"))return decoded.charAt((Integer)a[0]);
            if(m.getName().equals("subSequence"))return decoded.subSequence((Integer)a[0],(Integer)a[1]);
            throw new AssertionError(m);
        });
    }
}
