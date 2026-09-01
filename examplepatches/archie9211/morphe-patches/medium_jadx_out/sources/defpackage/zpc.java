package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.util.AttributeSet;
import android.util.StateSet;
import android.view.ContextThemeWrapper;
import com.medium.reader.R;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zpc implements n3c {
    public final int a;
    public final p3c b;
    public final int[][] c;
    public final p3c[] d;

    public zpc(nvg nvgVar) {
        this.a = nvgVar.a;
        this.b = (p3c) nvgVar.b;
        this.c = (int[][]) nvgVar.c;
        this.d = (p3c[]) nvgVar.d;
    }

    public static void e(nvg nvgVar, Context context, XmlResourceParser xmlResourceParser, AttributeSet attributeSet, Resources.Theme theme) throws XmlPullParserException, IOException {
        int depth = xmlResourceParser.getDepth() + 1;
        while (true) {
            int next = xmlResourceParser.next();
            if (next == 1) {
                return;
            }
            int depth2 = xmlResourceParser.getDepth();
            if (depth2 < depth && next == 3) {
                return;
            }
            if (next == 2 && depth2 <= depth && xmlResourceParser.getName().equals("item")) {
                Resources resources = context.getResources();
                int[] iArr = ura.j;
                TypedArray typedArrayObtainAttributes = theme == null ? resources.obtainAttributes(attributeSet, iArr) : theme.obtainStyledAttributes(attributeSet, iArr, 0, 0);
                int resourceId = typedArrayObtainAttributes.getResourceId(0, 0);
                int resourceId2 = typedArrayObtainAttributes.getResourceId(1, 0);
                x xVar = new x(0.0f);
                ContextThemeWrapper contextThemeWrapper = new ContextThemeWrapper(context, resourceId);
                if (resourceId2 != 0) {
                    contextThemeWrapper.getTheme().applyStyle(resourceId2, true);
                }
                p3c p3cVarA = p3c.f(contextThemeWrapper.obtainStyledAttributes(ura.o), xVar).a();
                typedArrayObtainAttributes.recycle();
                int attributeCount = attributeSet.getAttributeCount();
                int[] iArr2 = new int[attributeCount];
                int i = 0;
                for (int i2 = 0; i2 < attributeCount; i2++) {
                    int attributeNameResource = attributeSet.getAttributeNameResource(i2);
                    if (attributeNameResource != R.attr.shapeAppearance && attributeNameResource != R.attr.shapeAppearanceOverlay) {
                        int i3 = i + 1;
                        if (!attributeSet.getAttributeBooleanValue(i2, false)) {
                            attributeNameResource = -attributeNameResource;
                        }
                        iArr2[i] = attributeNameResource;
                        i = i3;
                    }
                }
                int[] iArrTrimStateSet = StateSet.trimStateSet(iArr2, i);
                int i4 = nvgVar.a;
                if (i4 == 0 || iArrTrimStateSet.length == 0) {
                    nvgVar.b = p3cVarA;
                }
                int[][] iArr3 = (int[][]) nvgVar.c;
                if (i4 >= iArr3.length) {
                    int i5 = i4 + 10;
                    int[][] iArr4 = new int[i5][];
                    System.arraycopy(iArr3, 0, iArr4, 0, i4);
                    nvgVar.c = iArr4;
                    p3c[] p3cVarArr = new p3c[i5];
                    System.arraycopy((p3c[]) nvgVar.d, 0, p3cVarArr, 0, i4);
                    nvgVar.d = p3cVarArr;
                }
                int[][] iArr5 = (int[][]) nvgVar.c;
                int i6 = nvgVar.a;
                iArr5[i6] = iArrTrimStateSet;
                ((p3c[]) nvgVar.d)[i6] = p3cVarA;
                nvgVar.a = i6 + 1;
            }
        }
    }

    @Override // defpackage.n3c
    public final p3c a(float f) {
        return this.b.a(f);
    }

    @Override // defpackage.n3c
    public final p3c b(int[] iArr) {
        int i;
        int i2;
        int[][] iArr2;
        int i3 = 0;
        int i4 = 0;
        while (true) {
            i = -1;
            i2 = this.a;
            iArr2 = this.c;
            if (i4 >= i2) {
                i4 = -1;
                break;
            }
            if (StateSet.stateSetMatches(iArr2[i4], iArr)) {
                break;
            }
            i4++;
        }
        if (i4 < 0) {
            int[] iArr3 = StateSet.WILD_CARD;
            while (true) {
                if (i3 >= i2) {
                    break;
                }
                if (StateSet.stateSetMatches(iArr2[i3], iArr3)) {
                    i = i3;
                    break;
                }
                i3++;
            }
            i4 = i;
        }
        return this.d[i4];
    }

    @Override // defpackage.n3c
    public final p3c c() {
        return this.b;
    }

    @Override // defpackage.n3c
    public final boolean d() {
        return this.a > 1;
    }
}
