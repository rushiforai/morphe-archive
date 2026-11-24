package app.zonghome.extension;

import java.util.Map;

public final class MaterialPaletteTest {
    static void check(boolean condition,String message) {
        if(!condition)throw new AssertionError(message);
    }
    static double luminance(int color) {
        double result=0;double[] weights={0.2126,0.7152,0.0722};int i=0;
        for(int shift:new int[]{16,8,0}) {
            double channel=((color>>>shift)&255)/255.0;
            result+=weights[i++]*(channel<=0.04045?channel/12.92:Math.pow((channel+0.055)/1.055,2.4));
        }
        return result;
    }
    static double contrast(int first,int second) {
        double a=luminance(first),b=luminance(second);
        return (Math.max(a,b)+0.05)/(Math.min(a,b)+0.05);
    }
    public static void main(String[] args) {
        MaterialPalette.Lookup never=name->{throw new AssertionError("Unsupported Android queried system palette");};
        MaterialPalette old=MaterialPalette.resolve(30,true,never);
        check(!old.dynamic && old.background==0xff141414,"Pre-12 fallback");
        check(!MaterialPalette.resolve(34,false,never).dynamic,"Explicit charcoal mode");
        check(!MaterialPalette.resolve(34,true,name->{throw new IllegalArgumentException(name);}).dynamic,
            "Missing OEM palette must fall back as a whole");
        Map<String,Integer> colors=Map.of("system_neutral1_1000",0xff000000,"system_neutral1_900",0xff1a1c20,
            "system_neutral1_800",0xff2f3038,"system_neutral2_700",0xff45464f,"system_neutral1_100",0xffe2e2ea,
            "system_neutral2_200",0xffc5c6d0,"system_accent1_200",0xffadc7ff,"system_accent1_800",0xff102f60);
        MaterialPalette dynamic=MaterialPalette.resolve(31,true,colors::get);
        check(dynamic.dynamic,"Android 12 dynamic roles");
        check(dynamic.background!=old.background && dynamic.surface!=old.surface,"Surfaces must be dynamic too");
        check(luminance(dynamic.background)<luminance(dynamic.surface) && luminance(dynamic.surface)<luminance(dynamic.raised),
            "Dark surface hierarchy");
        check(contrast(dynamic.text,dynamic.surface)>7 && contrast(dynamic.muted,dynamic.raised)>4.5,
            "Readable text roles");
        check(contrast(dynamic.accent,dynamic.onAccent)>4.5,"Readable selected controls");
        check(dynamic.remap(0x99242424)==((0x99000000)|(dynamic.surface&0x00ffffff)),"Preserve translucent resource alpha");
        check(dynamic.remap(0xff12ab45)==0xff12ab45,"Do not recolor unrelated custom colors");
        System.out.println("PASS: Material dark roles, surface/text contrast, alpha preservation, Android/OEM/explicit fallbacks");
    }
}
