package app.zonghome.extension;

/** Dark Material color roles resolved independently of Android views. */
final class MaterialPalette {
    interface Lookup { int color(String name); }
    final int background, surface, raised, track, text, muted, accent, onAccent;
    final boolean dynamic;

    private MaterialPalette(int background, int surface, int raised, int track,
            int text, int muted, int accent, int onAccent, boolean dynamic) {
        this.background=background;this.surface=surface;this.raised=raised;this.track=track;
        this.text=text;this.muted=muted;this.accent=accent;this.onAccent=onAccent;this.dynamic=dynamic;
    }
    static MaterialPalette charcoal() {
        return new MaterialPalette(0xff141414,0xff242424,0xff303030,0xff444444,
            0xffe8e8e8,0xffb7b7b7,0xffacd58e,0xff161616,false);
    }
    static MaterialPalette resolve(int sdk, boolean enabled, Lookup lookup) {
        if(sdk<31 || !enabled)return charcoal();
        try {
            int black=lookup.color("system_neutral1_1000");
            int tone10=lookup.color("system_neutral1_900");
            int tone20=lookup.color("system_neutral1_800");
            return new MaterialPalette(blend(black,tone10,0.6f),blend(tone10,tone20,0.2f),
                blend(tone10,tone20,0.7f),lookup.color("system_neutral2_700"),
                lookup.color("system_neutral1_100"),lookup.color("system_neutral2_200"),
                lookup.color("system_accent1_200"),lookup.color("system_accent1_800"),true);
        } catch(RuntimeException unavailable) {
            return charcoal();
        }
    }
    private static int blend(int a,int b,float amount) {
        int result=0xff000000;
        for(int shift:new int[]{16,8,0}) {
            int first=(a>>>shift)&255,second=(b>>>shift)&255;
            result|=Math.round(first+(second-first)*amount)<<shift;
        }
        return result;
    }
    int remap(int color) {
        int value;
        switch(color&0x00ffffff) {
            case 0x141414:value=background;break;
            case 0x242424:value=surface;break;
            case 0x303030:value=raised;break;
            case 0x444444:value=track;break;
            case 0xe8e8e8:value=text;break;
            case 0xb7b7b7:value=muted;break;
            case 0xacd58e:value=accent;break;
            case 0x161616:value=onAccent;break;
            default:return color;
        }
        return (color&0xff000000)|(value&0x00ffffff);
    }
}
