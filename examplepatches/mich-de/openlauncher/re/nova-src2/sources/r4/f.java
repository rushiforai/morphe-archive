package r4;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.graphics.fonts.Font;
import android.graphics.fonts.FontFamily;
import android.graphics.fonts.FontStyle;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.List;
import p50.i;
import x4.h;

/* loaded from: classes2.dex */
public final class f extends i {
    public static int A(FontStyle fontStyle, FontStyle fontStyle2) {
        return (Math.abs(fontStyle.getWeight() - fontStyle2.getWeight()) / 100) + (fontStyle.getSlant() == fontStyle2.getSlant() ? 0 : 2);
    }

    public static Font y(FontFamily fontFamily, int i5) {
        FontStyle fontStyle = new FontStyle((i5 & 1) != 0 ? Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE : Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, (i5 & 2) != 0 ? 1 : 0);
        Font font = fontFamily.getFont(0);
        int iA = A(fontStyle, font.getStyle());
        for (int i11 = 1; i11 < fontFamily.getSize(); i11++) {
            Font font2 = fontFamily.getFont(i11);
            int iA2 = A(fontStyle, font2.getStyle());
            if (iA2 < iA) {
                font = font2;
                iA = iA2;
            }
        }
        return font;
    }

    public static FontFamily z(h[] hVarArr, ContentResolver contentResolver) throws IOException {
        ParcelFileDescriptor parcelFileDescriptorOpenFileDescriptor;
        FontFamily.Builder builder = null;
        for (h hVar : hVarArr) {
            try {
                parcelFileDescriptorOpenFileDescriptor = contentResolver.openFileDescriptor(hVar.f95085a, "r", null);
            } catch (IOException e3) {
                Log.w("TypefaceCompatApi29Impl", "Font load failed", e3);
            }
            if (parcelFileDescriptorOpenFileDescriptor == null) {
                if (parcelFileDescriptorOpenFileDescriptor != null) {
                }
            } else {
                try {
                    Font fontBuild = new Font.Builder(parcelFileDescriptorOpenFileDescriptor).setWeight(hVar.f95087c).setSlant(hVar.f95088d ? 1 : 0).setTtcIndex(hVar.f95086b).build();
                    if (builder == null) {
                        builder = new FontFamily.Builder(fontBuild);
                    } else {
                        builder.addFont(fontBuild);
                    }
                } catch (Throwable th2) {
                    try {
                        parcelFileDescriptorOpenFileDescriptor.close();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                    throw th2;
                }
            }
            parcelFileDescriptorOpenFileDescriptor.close();
        }
        if (builder == null) {
            return null;
        }
        return builder.build();
    }

    @Override // p50.i
    public final Typeface k(Context context, q4.e eVar, Resources resources, int i5) throws IOException {
        try {
            FontFamily.Builder builder = null;
            for (q4.f fVar : eVar.f83621a) {
                try {
                    Font fontBuild = new Font.Builder(resources, fVar.f83627f).setWeight(fVar.f83623b).setSlant(fVar.f83624c ? 1 : 0).setTtcIndex(fVar.f83626e).setFontVariationSettings(fVar.f83625d).build();
                    if (builder == null) {
                        builder = new FontFamily.Builder(fontBuild);
                    } else {
                        builder.addFont(fontBuild);
                    }
                } catch (IOException unused) {
                }
            }
            if (builder == null) {
                return null;
            }
            FontFamily fontFamilyBuild = builder.build();
            return new Typeface.CustomFallbackBuilder(fontFamilyBuild).setStyle(y(fontFamilyBuild, i5).getStyle()).build();
        } catch (Exception e3) {
            Log.w("TypefaceCompatApi29Impl", "Font load failed", e3);
            return null;
        }
    }

    @Override // p50.i
    public final Typeface l(Context context, h[] hVarArr, int i5) {
        try {
            FontFamily fontFamilyZ = z(hVarArr, context.getContentResolver());
            if (fontFamilyZ == null) {
                return null;
            }
            return new Typeface.CustomFallbackBuilder(fontFamilyZ).setStyle(y(fontFamilyZ, i5).getStyle()).build();
        } catch (Exception e3) {
            Log.w("TypefaceCompatApi29Impl", "Font load failed", e3);
            return null;
        }
    }

    @Override // p50.i
    public final Typeface m(Context context, List list, int i5) {
        ContentResolver contentResolver = context.getContentResolver();
        try {
            FontFamily fontFamilyZ = z((h[]) list.get(0), contentResolver);
            if (fontFamilyZ == null) {
                return null;
            }
            Typeface.CustomFallbackBuilder customFallbackBuilder = new Typeface.CustomFallbackBuilder(fontFamilyZ);
            for (int i11 = 1; i11 < list.size(); i11++) {
                FontFamily fontFamilyZ2 = z((h[]) list.get(i11), contentResolver);
                if (fontFamilyZ2 != null) {
                    customFallbackBuilder.addCustomFallback(fontFamilyZ2);
                }
            }
            return customFallbackBuilder.setStyle(y(fontFamilyZ, i5).getStyle()).build();
        } catch (Exception e3) {
            Log.w("TypefaceCompatApi29Impl", "Font load failed", e3);
            return null;
        }
    }

    @Override // p50.i
    public final Typeface n(Context context, Resources resources, int i5, String str, int i11) throws IOException {
        try {
            Font fontBuild = new Font.Builder(resources, i5).build();
            return new Typeface.CustomFallbackBuilder(new FontFamily.Builder(fontBuild).build()).setStyle(fontBuild.getStyle()).build();
        } catch (Exception e3) {
            Log.w("TypefaceCompatApi29Impl", "Font load failed", e3);
            return null;
        }
    }

    @Override // p50.i
    public final h o(h[] hVarArr, int i5) {
        throw new RuntimeException("Do not use this function in API 29 or later.");
    }
}
