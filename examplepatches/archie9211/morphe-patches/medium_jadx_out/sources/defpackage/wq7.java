package defpackage;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.fonts.Font;
import android.graphics.fonts.FontFamily;
import android.graphics.fonts.FontStyle;
import android.os.Build;
import com.medium.reader.R;
import j$.util.Map;
import java.io.IOException;
import java.util.HashMap;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wq7 extends HashMap implements Map {
    /* JADX WARN: Multi-variable type inference failed */
    public wq7(Context context) throws IOException {
        nq7 nq7Var = nq7.MONO;
        Typeface typeface = Typeface.MONOSPACE;
        put(nq7Var, typeface);
        put(nq7.MONO_BOLD, Typeface.create(typeface, 1));
        put(nq7.MONO_ITALIC, Typeface.create(typeface, 2));
        put(nq7.MONO_BOLD_ITALIC, Typeface.create(typeface, 3));
        put(nq7.SOURCE_SERIF_PRO, wcb.b(context, R.font.source_serif_pro_regular));
        put(nq7.SOURCE_SERIF_PRO_ITALIC, wcb.b(context, R.font.source_serif_pro_regular_italic));
        put(nq7.SOHNE_REGULAR, wcb.b(context, R.font.sohne_regular));
        put(nq7.SOHNE_REGULAR_ITALIC, wcb.b(context, R.font.sohne_regular_italic));
        put(nq7.FELL_REGULAR, wcb.b(context, R.font.fell_regular));
        if (Build.VERSION.SDK_INT >= 29) {
            cs0.g();
            Font fontBuild = new Font.Builder(context.getResources(), R.font.source_serif_pro_semi_bold).build();
            fontBuild.getClass();
            cs0.g();
            Font fontBuild2 = new Font.Builder(context.getResources(), R.font.source_serif_pro_semi_bold_italic).build();
            fontBuild2.getClass();
            cs0.g();
            Font fontBuild3 = new Font.Builder(context.getResources(), R.font.sohne_medium).build();
            fontBuild3.getClass();
            cs0.g();
            Font fontBuild4 = new Font.Builder(context.getResources(), R.font.sohne_medium_italic).build();
            fontBuild4.getClass();
            FontStyle fontStyle = new FontStyle(700, 0);
            FontStyle fontStyle2 = new FontStyle(700, 1);
            FontFamily fontFamilyBuild = new FontFamily.Builder(fontBuild).build();
            fontFamilyBuild.getClass();
            Typeface typefaceBuild = new Typeface.CustomFallbackBuilder(fontFamilyBuild).setSystemFallback("serif").setStyle(fontStyle).build();
            typefaceBuild.getClass();
            FontFamily fontFamilyBuild2 = new FontFamily.Builder(fontBuild2).build();
            fontFamilyBuild2.getClass();
            Typeface typefaceBuild2 = new Typeface.CustomFallbackBuilder(fontFamilyBuild2).setSystemFallback("serif").setStyle(fontStyle2).build();
            typefaceBuild2.getClass();
            FontFamily fontFamilyBuild3 = new FontFamily.Builder(fontBuild3).build();
            fontFamilyBuild3.getClass();
            Typeface typefaceBuild3 = new Typeface.CustomFallbackBuilder(fontFamilyBuild3).setSystemFallback("serif").setStyle(fontStyle).build();
            typefaceBuild3.getClass();
            FontFamily fontFamilyBuild4 = new FontFamily.Builder(fontBuild4).build();
            fontFamilyBuild4.getClass();
            Typeface typefaceBuild4 = new Typeface.CustomFallbackBuilder(fontFamilyBuild4).setSystemFallback("serif").setStyle(fontStyle2).build();
            typefaceBuild4.getClass();
            put(nq7.SOURCE_SERIF_PRO_BOLD, typefaceBuild);
            put(nq7.SOURCE_SERIF_PRO_BOLD_ITALIC, typefaceBuild2);
            put(nq7.SOHNE_MEDIUM, typefaceBuild3);
        } else {
            put(nq7.SOURCE_SERIF_PRO_BOLD, wcb.b(context, R.font.source_serif_pro_semi_bold));
            put(nq7.SOURCE_SERIF_PRO_BOLD_ITALIC, wcb.b(context, R.font.source_serif_pro_semi_bold_italic));
            put(nq7.SOHNE_MEDIUM, wcb.b(context, R.font.sohne_medium));
        }
        put(nq7.OPEN_DYSLEXIC, wcb.b(context, R.font.open_dyslexic));
        put(nq7.OPEN_DYSLEXIC_BOLD, wcb.b(context, R.font.open_dyslexic_bold));
        put(nq7.OPEN_DYSLEXIC_ITALIC, wcb.b(context, R.font.open_dyslexic_italic));
        put(nq7.OPEN_DYSLEXIC_BOLD_ITALIC, wcb.b(context, R.font.open_dyslexic_bold_italic));
        put(nq7.OPEN_DYSLEXIC_MONO, wcb.b(context, R.font.open_dyslexic_mono));
    }

    @Override // java.util.HashMap, java.util.Map, j$.util.Map
    public /* synthetic */ Object compute(Object obj, BiFunction biFunction) {
        return Map.CC.$default$compute(this, obj, biFunction);
    }

    @Override // java.util.HashMap, java.util.Map, j$.util.Map
    public /* synthetic */ Object computeIfAbsent(Object obj, Function function) {
        return Map.CC.$default$computeIfAbsent(this, obj, function);
    }

    @Override // java.util.HashMap, java.util.Map, j$.util.Map
    public /* synthetic */ Object computeIfPresent(Object obj, BiFunction biFunction) {
        return Map.CC.$default$computeIfPresent(this, obj, biFunction);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsKey(Object obj) {
        if (obj instanceof nq7) {
            return super.containsKey((nq7) obj);
        }
        return false;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsValue(Object obj) {
        if (obj == null ? true : obj instanceof Typeface) {
            return super.containsValue((Typeface) obj);
        }
        return false;
    }

    @Override // java.util.HashMap, java.util.Map, j$.util.Map
    public /* synthetic */ void forEach(BiConsumer biConsumer) {
        Map.CC.$default$forEach(this, biConsumer);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ Object get(Object obj) {
        if (obj instanceof nq7) {
            return (Typeface) super.get((nq7) obj);
        }
        return null;
    }

    @Override // java.util.HashMap, java.util.Map, j$.util.Map
    public final /* bridge */ Object getOrDefault(Object obj, Object obj2) {
        return !(obj instanceof nq7) ? obj2 : (Typeface) Map.CC.$default$getOrDefault(this, (nq7) obj, (Typeface) obj2);
    }

    @Override // java.util.HashMap, java.util.Map, j$.util.Map
    public /* synthetic */ Object merge(Object obj, Object obj2, BiFunction biFunction) {
        return Map.CC.$default$merge(this, obj, obj2, biFunction);
    }

    @Override // java.util.HashMap, java.util.Map, j$.util.Map
    public /* synthetic */ Object putIfAbsent(Object obj, Object obj2) {
        return Map.CC.$default$putIfAbsent(this, obj, obj2);
    }

    @Override // java.util.HashMap, java.util.Map, j$.util.Map
    public final /* bridge */ boolean remove(Object obj, Object obj2) {
        if (!(obj instanceof nq7)) {
            return false;
        }
        if (obj2 == null ? true : obj2 instanceof Typeface) {
            return Map.CC.$default$remove(this, (nq7) obj, (Typeface) obj2);
        }
        return false;
    }

    @Override // java.util.HashMap, java.util.Map, j$.util.Map
    public /* synthetic */ Object replace(Object obj, Object obj2) {
        return Map.CC.$default$replace(this, obj, obj2);
    }

    @Override // java.util.HashMap, java.util.Map, j$.util.Map
    public /* synthetic */ void replaceAll(BiFunction biFunction) {
        Map.CC.$default$replaceAll(this, biFunction);
    }

    @Override // java.util.HashMap, java.util.Map, j$.util.Map
    public /* synthetic */ boolean replace(Object obj, Object obj2, Object obj3) {
        return Map.CC.$default$replace(this, obj, obj2, obj3);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ Object remove(Object obj) {
        if (obj instanceof nq7) {
            return (Typeface) super.remove((nq7) obj);
        }
        return null;
    }
}
