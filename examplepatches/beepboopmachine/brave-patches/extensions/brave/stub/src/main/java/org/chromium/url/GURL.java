package org.chromium.url;

public class GURL {
    public String a;
    public boolean b;

    public GURL() {
        this.a = "";
    }

    public GURL(String uri) {
        this.a = uri != null ? uri : "";
        this.b = uri != null && !uri.isEmpty();
    }

    public static GURL emptyGURL() {
        return new GURL("");
    }

    public String k() { return a; }
    public String l() { return a; }
    public String i() { return ""; }
    public String getSpec() { return a != null ? a : ""; }
    public boolean isEmpty() { return a == null || a.isEmpty(); }
    public boolean isValid() { return b; }
}
