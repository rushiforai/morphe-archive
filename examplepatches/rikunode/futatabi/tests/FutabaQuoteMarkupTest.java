package dev.rikunode.futatabi.bridge;
public final class FutabaQuoteMarkupTest {
    public static void main(String[] args) {
        String[] in = {"", "plain", "&gt;No.123456789", "<br>&gt;No.123<br><br>tail", "&lt;script&gt;", "&gt;quote&lt;script&gt;"};
        String[] expected = {"", "plain", "<font color=\"#789922\">&gt;No.123456789</font>", "<br><font color=\"#789922\">&gt;No.123</font><br><br>tail", "&lt;script&gt;", "<font color=\"#789922\">&gt;quote&lt;script&gt;</font>"};
        for (int i=0;i<in.length;i++) if (!expected[i].equals(FutabaQuoteMarkup.render(in[i]))) throw new AssertionError(i);
        System.out.println("Futaba quote markup: " + in.length + " cases PASS");
    }
}
