package j4;

import ads_mobile_sdk.pd;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseIntArray;
import android.util.Xml;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.widget.ConstraintLayout;
import b.c0;
import b.u4;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public final class m {

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f69043d = {0, 4, 8};

    /* renamed from: e, reason: collision with root package name */
    public static final SparseIntArray f69044e;

    /* renamed from: f, reason: collision with root package name */
    public static final SparseIntArray f69045f;

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f69046a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final boolean f69047b = true;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f69048c = new HashMap();

    static {
        SparseIntArray sparseIntArray = new SparseIntArray();
        f69044e = sparseIntArray;
        SparseIntArray sparseIntArray2 = new SparseIntArray();
        f69045f = sparseIntArray2;
        sparseIntArray.append(82, 25);
        sparseIntArray.append(83, 26);
        sparseIntArray.append(85, 29);
        sparseIntArray.append(86, 30);
        sparseIntArray.append(92, 36);
        sparseIntArray.append(91, 35);
        sparseIntArray.append(63, 4);
        sparseIntArray.append(62, 3);
        sparseIntArray.append(58, 1);
        sparseIntArray.append(60, 91);
        sparseIntArray.append(59, 92);
        sparseIntArray.append(101, 6);
        sparseIntArray.append(102, 7);
        sparseIntArray.append(70, 17);
        sparseIntArray.append(71, 18);
        sparseIntArray.append(72, 19);
        sparseIntArray.append(54, 99);
        sparseIntArray.append(0, 27);
        sparseIntArray.append(87, 32);
        sparseIntArray.append(88, 33);
        sparseIntArray.append(69, 10);
        sparseIntArray.append(68, 9);
        sparseIntArray.append(106, 13);
        sparseIntArray.append(109, 16);
        sparseIntArray.append(107, 14);
        sparseIntArray.append(104, 11);
        sparseIntArray.append(108, 15);
        sparseIntArray.append(105, 12);
        sparseIntArray.append(95, 40);
        sparseIntArray.append(80, 39);
        sparseIntArray.append(79, 41);
        sparseIntArray.append(94, 42);
        sparseIntArray.append(78, 20);
        sparseIntArray.append(93, 37);
        sparseIntArray.append(67, 5);
        sparseIntArray.append(81, 87);
        sparseIntArray.append(90, 87);
        sparseIntArray.append(84, 87);
        sparseIntArray.append(61, 87);
        sparseIntArray.append(57, 87);
        sparseIntArray.append(5, 24);
        sparseIntArray.append(7, 28);
        sparseIntArray.append(23, 31);
        sparseIntArray.append(24, 8);
        sparseIntArray.append(6, 34);
        sparseIntArray.append(8, 2);
        sparseIntArray.append(3, 23);
        sparseIntArray.append(4, 21);
        sparseIntArray.append(96, 95);
        sparseIntArray.append(73, 96);
        sparseIntArray.append(2, 22);
        sparseIntArray.append(13, 43);
        sparseIntArray.append(26, 44);
        sparseIntArray.append(21, 45);
        sparseIntArray.append(22, 46);
        sparseIntArray.append(20, 60);
        sparseIntArray.append(18, 47);
        sparseIntArray.append(19, 48);
        sparseIntArray.append(14, 49);
        sparseIntArray.append(15, 50);
        sparseIntArray.append(16, 51);
        sparseIntArray.append(17, 52);
        sparseIntArray.append(25, 53);
        sparseIntArray.append(97, 54);
        sparseIntArray.append(74, 55);
        sparseIntArray.append(98, 56);
        sparseIntArray.append(75, 57);
        sparseIntArray.append(99, 58);
        sparseIntArray.append(76, 59);
        sparseIntArray.append(64, 61);
        sparseIntArray.append(66, 62);
        sparseIntArray.append(65, 63);
        sparseIntArray.append(28, 64);
        sparseIntArray.append(Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 65);
        sparseIntArray.append(35, 66);
        sparseIntArray.append(Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, 67);
        sparseIntArray.append(113, 79);
        sparseIntArray.append(1, 38);
        sparseIntArray.append(112, 68);
        sparseIntArray.append(100, 69);
        sparseIntArray.append(77, 70);
        sparseIntArray.append(111, 97);
        sparseIntArray.append(32, 71);
        sparseIntArray.append(30, 72);
        sparseIntArray.append(31, 73);
        sparseIntArray.append(33, 74);
        sparseIntArray.append(29, 75);
        sparseIntArray.append(114, 76);
        sparseIntArray.append(89, 77);
        sparseIntArray.append(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, 78);
        sparseIntArray.append(56, 80);
        sparseIntArray.append(55, 81);
        sparseIntArray.append(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, 82);
        sparseIntArray.append(120, 83);
        sparseIntArray.append(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 84);
        sparseIntArray.append(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 85);
        sparseIntArray.append(Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, 86);
        sparseIntArray2.append(85, 6);
        sparseIntArray2.append(85, 7);
        sparseIntArray2.append(0, 27);
        sparseIntArray2.append(89, 13);
        sparseIntArray2.append(92, 16);
        sparseIntArray2.append(90, 14);
        sparseIntArray2.append(87, 11);
        sparseIntArray2.append(91, 15);
        sparseIntArray2.append(88, 12);
        sparseIntArray2.append(78, 40);
        sparseIntArray2.append(71, 39);
        sparseIntArray2.append(70, 41);
        sparseIntArray2.append(77, 42);
        sparseIntArray2.append(69, 20);
        sparseIntArray2.append(76, 37);
        sparseIntArray2.append(60, 5);
        sparseIntArray2.append(72, 87);
        sparseIntArray2.append(75, 87);
        sparseIntArray2.append(73, 87);
        sparseIntArray2.append(57, 87);
        sparseIntArray2.append(56, 87);
        sparseIntArray2.append(5, 24);
        sparseIntArray2.append(7, 28);
        sparseIntArray2.append(23, 31);
        sparseIntArray2.append(24, 8);
        sparseIntArray2.append(6, 34);
        sparseIntArray2.append(8, 2);
        sparseIntArray2.append(3, 23);
        sparseIntArray2.append(4, 21);
        sparseIntArray2.append(79, 95);
        sparseIntArray2.append(64, 96);
        sparseIntArray2.append(2, 22);
        sparseIntArray2.append(13, 43);
        sparseIntArray2.append(26, 44);
        sparseIntArray2.append(21, 45);
        sparseIntArray2.append(22, 46);
        sparseIntArray2.append(20, 60);
        sparseIntArray2.append(18, 47);
        sparseIntArray2.append(19, 48);
        sparseIntArray2.append(14, 49);
        sparseIntArray2.append(15, 50);
        sparseIntArray2.append(16, 51);
        sparseIntArray2.append(17, 52);
        sparseIntArray2.append(25, 53);
        sparseIntArray2.append(80, 54);
        sparseIntArray2.append(65, 55);
        sparseIntArray2.append(81, 56);
        sparseIntArray2.append(66, 57);
        sparseIntArray2.append(82, 58);
        sparseIntArray2.append(67, 59);
        sparseIntArray2.append(59, 62);
        sparseIntArray2.append(58, 63);
        sparseIntArray2.append(28, 64);
        sparseIntArray2.append(105, 65);
        sparseIntArray2.append(34, 66);
        sparseIntArray2.append(106, 67);
        sparseIntArray2.append(96, 79);
        sparseIntArray2.append(1, 38);
        sparseIntArray2.append(97, 98);
        sparseIntArray2.append(95, 68);
        sparseIntArray2.append(83, 69);
        sparseIntArray2.append(68, 70);
        sparseIntArray2.append(32, 71);
        sparseIntArray2.append(30, 72);
        sparseIntArray2.append(31, 73);
        sparseIntArray2.append(33, 74);
        sparseIntArray2.append(29, 75);
        sparseIntArray2.append(98, 76);
        sparseIntArray2.append(74, 77);
        sparseIntArray2.append(107, 78);
        sparseIntArray2.append(55, 80);
        sparseIntArray2.append(54, 81);
        sparseIntArray2.append(100, 82);
        sparseIntArray2.append(104, 83);
        sparseIntArray2.append(103, 84);
        sparseIntArray2.append(102, 85);
        sparseIntArray2.append(101, 86);
        sparseIntArray2.append(94, 97);
    }

    public static int[] c(a aVar, String str) throws IllegalAccessException, IllegalArgumentException {
        int iIntValue;
        String[] strArrSplit = str.split(",");
        Context context = aVar.getContext();
        int[] iArr = new int[strArrSplit.length];
        int i5 = 0;
        int i11 = 0;
        while (i5 < strArrSplit.length) {
            String strTrim = strArrSplit[i5].trim();
            Object obj = null;
            try {
                iIntValue = o.class.getField(strTrim).getInt(null);
            } catch (Exception unused) {
                iIntValue = 0;
            }
            if (iIntValue == 0) {
                iIntValue = context.getResources().getIdentifier(strTrim, "id", context.getPackageName());
            }
            if (iIntValue == 0 && aVar.isInEditMode() && (aVar.getParent() instanceof ConstraintLayout)) {
                ConstraintLayout constraintLayout = (ConstraintLayout) aVar.getParent();
                if (strTrim != null) {
                    HashMap map = constraintLayout.f14192l;
                    if (map != null && map.containsKey(strTrim)) {
                        obj = constraintLayout.f14192l.get(strTrim);
                    }
                } else {
                    constraintLayout.getClass();
                }
                if (obj != null && (obj instanceof Integer)) {
                    iIntValue = ((Integer) obj).intValue();
                }
            }
            iArr[i11] = iIntValue;
            i5++;
            i11++;
        }
        return i11 != strArrSplit.length ? Arrays.copyOf(iArr, i11) : iArr;
    }

    public static h d(Context context, AttributeSet attributeSet, boolean z11) {
        int i5;
        int i11;
        h hVar = new h();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, z11 ? p.f69051c : p.f69049a);
        k kVar = hVar.f68971b;
        l lVar = hVar.f68974e;
        j jVar = hVar.f68972c;
        i iVar = hVar.f68973d;
        int[] iArr = f69043d;
        String[] strArr = f4.a.f54305a;
        SparseIntArray sparseIntArray = f69044e;
        if (z11) {
            g gVar = new g();
            gVar.f68958a = new int[10];
            gVar.f68959b = new int[10];
            gVar.f68960c = 0;
            gVar.f68961d = new int[10];
            gVar.f68962e = new float[10];
            gVar.f68963f = 0;
            gVar.f68964g = new int[5];
            gVar.f68965h = new String[5];
            gVar.f68966i = 0;
            gVar.f68967j = new int[4];
            gVar.f68968k = new boolean[4];
            gVar.f68969l = 0;
            jVar.getClass();
            iVar.getClass();
            lVar.getClass();
            int i12 = 0;
            for (int indexCount = typedArrayObtainStyledAttributes.getIndexCount(); i12 < indexCount; indexCount = i11) {
                int index = typedArrayObtainStyledAttributes.getIndex(i12);
                int i13 = i12;
                switch (f69045f.get(index)) {
                    case 2:
                        i11 = indexCount;
                        gVar.b(2, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.I));
                        continue;
                        i12 = i13 + 1;
                    case 3:
                    case 4:
                    case 9:
                    case 10:
                    case 25:
                    case 26:
                    case 29:
                    case 30:
                    case 32:
                    case 33:
                    case 35:
                    case 36:
                    case 61:
                    case 88:
                    case 89:
                    case 90:
                    case 91:
                    case pd.N0 /* 92 */:
                    default:
                        StringBuilder sb2 = new StringBuilder("Unknown attribute 0x");
                        i11 = indexCount;
                        sb2.append(Integer.toHexString(index));
                        sb2.append("   ");
                        sb2.append(sparseIntArray.get(index));
                        Log.w("ConstraintSet", sb2.toString());
                        break;
                    case 5:
                        i11 = indexCount;
                        gVar.c(5, typedArrayObtainStyledAttributes.getString(index));
                        continue;
                        i12 = i13 + 1;
                    case 6:
                        i11 = indexCount;
                        gVar.b(6, typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, iVar.C));
                        break;
                    case 7:
                        i11 = indexCount;
                        gVar.b(7, typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, iVar.D));
                        break;
                    case 8:
                        i11 = indexCount;
                        gVar.b(8, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.J));
                        break;
                    case 11:
                        i11 = indexCount;
                        gVar.b(11, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.P));
                        break;
                    case 12:
                        i11 = indexCount;
                        gVar.b(12, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.Q));
                        break;
                    case 13:
                        i11 = indexCount;
                        gVar.b(13, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.M));
                        break;
                    case 14:
                        i11 = indexCount;
                        gVar.b(14, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.O));
                        break;
                    case 15:
                        i11 = indexCount;
                        gVar.b(15, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.R));
                        break;
                    case 16:
                        i11 = indexCount;
                        gVar.b(16, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.N));
                        break;
                    case 17:
                        i11 = indexCount;
                        gVar.b(17, typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, iVar.f68983d));
                        break;
                    case 18:
                        i11 = indexCount;
                        gVar.b(18, typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, iVar.f68985e));
                        break;
                    case 19:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, iVar.f68987f), 19);
                        break;
                    case 20:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, iVar.f69012w), 20);
                        break;
                    case 21:
                        i11 = indexCount;
                        gVar.b(21, typedArrayObtainStyledAttributes.getLayoutDimension(index, iVar.f68981c));
                        break;
                    case 22:
                        i11 = indexCount;
                        gVar.b(22, iArr[typedArrayObtainStyledAttributes.getInt(index, kVar.f69026a)]);
                        break;
                    case 23:
                        i11 = indexCount;
                        gVar.b(23, typedArrayObtainStyledAttributes.getLayoutDimension(index, iVar.f68979b));
                        break;
                    case 24:
                        i11 = indexCount;
                        gVar.b(24, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.F));
                        break;
                    case 27:
                        i11 = indexCount;
                        gVar.b(27, typedArrayObtainStyledAttributes.getInt(index, iVar.E));
                        break;
                    case 28:
                        i11 = indexCount;
                        gVar.b(28, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.G));
                        break;
                    case 31:
                        i11 = indexCount;
                        gVar.b(31, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.K));
                        break;
                    case 34:
                        i11 = indexCount;
                        gVar.b(34, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.H));
                        break;
                    case 37:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, iVar.f69013x), 37);
                        break;
                    case 38:
                        i11 = indexCount;
                        int resourceId = typedArrayObtainStyledAttributes.getResourceId(index, hVar.f68970a);
                        hVar.f68970a = resourceId;
                        gVar.b(38, resourceId);
                        break;
                    case 39:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, iVar.U), 39);
                        break;
                    case 40:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, iVar.T), 40);
                        break;
                    case 41:
                        i11 = indexCount;
                        gVar.b(41, typedArrayObtainStyledAttributes.getInt(index, iVar.V));
                        break;
                    case 42:
                        i11 = indexCount;
                        gVar.b(42, typedArrayObtainStyledAttributes.getInt(index, iVar.W));
                        break;
                    case 43:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, kVar.f69028c), 43);
                        break;
                    case 44:
                        i11 = indexCount;
                        gVar.d(44, true);
                        gVar.a(typedArrayObtainStyledAttributes.getDimension(index, lVar.f69042m), 44);
                        break;
                    case 45:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, lVar.f69031b), 45);
                        break;
                    case 46:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, lVar.f69032c), 46);
                        break;
                    case 47:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, lVar.f69033d), 47);
                        break;
                    case 48:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, lVar.f69034e), 48);
                        break;
                    case 49:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getDimension(index, lVar.f69035f), 49);
                        break;
                    case 50:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getDimension(index, lVar.f69036g), 50);
                        break;
                    case 51:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getDimension(index, lVar.f69038i), 51);
                        break;
                    case 52:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getDimension(index, lVar.f69039j), 52);
                        break;
                    case 53:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getDimension(index, lVar.f69040k), 53);
                        break;
                    case 54:
                        i11 = indexCount;
                        gVar.b(54, typedArrayObtainStyledAttributes.getInt(index, iVar.X));
                        break;
                    case 55:
                        i11 = indexCount;
                        gVar.b(55, typedArrayObtainStyledAttributes.getInt(index, iVar.Y));
                        break;
                    case 56:
                        i11 = indexCount;
                        gVar.b(56, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.Z));
                        break;
                    case 57:
                        i11 = indexCount;
                        gVar.b(57, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.f68978a0));
                        break;
                    case 58:
                        i11 = indexCount;
                        gVar.b(58, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.f68980b0));
                        break;
                    case 59:
                        i11 = indexCount;
                        gVar.b(59, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.f68982c0));
                        break;
                    case 60:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, lVar.f69030a), 60);
                        break;
                    case 62:
                        i11 = indexCount;
                        gVar.b(62, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.A));
                        break;
                    case 63:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, iVar.B), 63);
                        break;
                    case 64:
                        i11 = indexCount;
                        gVar.b(64, f(typedArrayObtainStyledAttributes, index, jVar.f69017a));
                        break;
                    case 65:
                        i11 = indexCount;
                        if (typedArrayObtainStyledAttributes.peekValue(index).type == 3) {
                            gVar.c(65, typedArrayObtainStyledAttributes.getString(index));
                            break;
                        } else {
                            gVar.c(65, strArr[typedArrayObtainStyledAttributes.getInteger(index, 0)]);
                            break;
                        }
                    case 66:
                        i11 = indexCount;
                        gVar.b(66, typedArrayObtainStyledAttributes.getInt(index, 0));
                        break;
                    case 67:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, jVar.f69021e), 67);
                        break;
                    case 68:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, kVar.f69029d), 68);
                        break;
                    case 69:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, 1.0f), 69);
                        break;
                    case 70:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, 1.0f), 70);
                        break;
                    case 71:
                        i11 = indexCount;
                        Log.e("ConstraintSet", "CURRENTLY UNSUPPORTED");
                        break;
                    case 72:
                        i11 = indexCount;
                        gVar.b(72, typedArrayObtainStyledAttributes.getInt(index, iVar.f68988f0));
                        break;
                    case 73:
                        i11 = indexCount;
                        gVar.b(73, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.f68990g0));
                        break;
                    case 74:
                        i11 = indexCount;
                        gVar.c(74, typedArrayObtainStyledAttributes.getString(index));
                        break;
                    case 75:
                        i11 = indexCount;
                        gVar.d(75, typedArrayObtainStyledAttributes.getBoolean(index, iVar.f69003n0));
                        break;
                    case 76:
                        i11 = indexCount;
                        gVar.b(76, typedArrayObtainStyledAttributes.getInt(index, jVar.f69019c));
                        break;
                    case 77:
                        i11 = indexCount;
                        gVar.c(77, typedArrayObtainStyledAttributes.getString(index));
                        break;
                    case 78:
                        i11 = indexCount;
                        gVar.b(78, typedArrayObtainStyledAttributes.getInt(index, kVar.f69027b));
                        break;
                    case 79:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, jVar.f69020d), 79);
                        break;
                    case 80:
                        i11 = indexCount;
                        gVar.d(80, typedArrayObtainStyledAttributes.getBoolean(index, iVar.f69000l0));
                        break;
                    case 81:
                        i11 = indexCount;
                        gVar.d(81, typedArrayObtainStyledAttributes.getBoolean(index, iVar.f69002m0));
                        break;
                    case 82:
                        i11 = indexCount;
                        gVar.b(82, typedArrayObtainStyledAttributes.getInteger(index, jVar.f69018b));
                        break;
                    case 83:
                        i11 = indexCount;
                        gVar.b(83, f(typedArrayObtainStyledAttributes, index, lVar.f69037h));
                        break;
                    case 84:
                        i11 = indexCount;
                        gVar.b(84, typedArrayObtainStyledAttributes.getInteger(index, jVar.f69023g));
                        break;
                    case 85:
                        i11 = indexCount;
                        gVar.a(typedArrayObtainStyledAttributes.getFloat(index, jVar.f69022f), 85);
                        break;
                    case 86:
                        i11 = indexCount;
                        int i14 = typedArrayObtainStyledAttributes.peekValue(index).type;
                        if (i14 == 1) {
                            int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(index, -1);
                            jVar.f69025i = resourceId2;
                            gVar.b(89, resourceId2);
                            if (jVar.f69025i != -1) {
                                gVar.b(88, -2);
                                break;
                            }
                        } else if (i14 == 3) {
                            String string = typedArrayObtainStyledAttributes.getString(index);
                            jVar.f69024h = string;
                            gVar.c(90, string);
                            if (jVar.f69024h.indexOf("/") > 0) {
                                int resourceId3 = typedArrayObtainStyledAttributes.getResourceId(index, -1);
                                jVar.f69025i = resourceId3;
                                gVar.b(89, resourceId3);
                                gVar.b(88, -2);
                                break;
                            } else {
                                gVar.b(88, -1);
                                break;
                            }
                        } else {
                            gVar.b(88, typedArrayObtainStyledAttributes.getInteger(index, jVar.f69025i));
                            break;
                        }
                        break;
                    case 87:
                        i11 = indexCount;
                        Log.w("ConstraintSet", "unused attribute 0x" + Integer.toHexString(index) + "   " + sparseIntArray.get(index));
                        break;
                    case pd.O0 /* 93 */:
                        i11 = indexCount;
                        gVar.b(93, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.L));
                        break;
                    case pd.P0 /* 94 */:
                        i11 = indexCount;
                        gVar.b(94, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, iVar.S));
                        break;
                    case pd.f8203p0 /* 95 */:
                        i11 = indexCount;
                        g(gVar, typedArrayObtainStyledAttributes, index, 0);
                        break;
                    case pd.A0 /* 96 */:
                        i11 = indexCount;
                        g(gVar, typedArrayObtainStyledAttributes, index, 1);
                        break;
                    case pd.H0 /* 97 */:
                        i11 = indexCount;
                        gVar.b(97, typedArrayObtainStyledAttributes.getInt(index, iVar.f69004o0));
                        break;
                    case pd.Q0 /* 98 */:
                        i11 = indexCount;
                        int i15 = i4.a.f61372p;
                        if (typedArrayObtainStyledAttributes.peekValue(index).type == 3) {
                            typedArrayObtainStyledAttributes.getString(index);
                            break;
                        } else {
                            hVar.f68970a = typedArrayObtainStyledAttributes.getResourceId(index, hVar.f68970a);
                            break;
                        }
                    case pd.R0 /* 99 */:
                        i11 = indexCount;
                        gVar.d(99, typedArrayObtainStyledAttributes.getBoolean(index, iVar.f68989g));
                        break;
                }
                i12 = i13 + 1;
            }
        } else {
            int i16 = 0;
            for (int indexCount2 = typedArrayObtainStyledAttributes.getIndexCount(); i16 < indexCount2; indexCount2 = i5) {
                int index2 = typedArrayObtainStyledAttributes.getIndex(i16);
                if (index2 != 1 && 23 != index2) {
                    if (24 != index2) {
                        jVar.getClass();
                        iVar.getClass();
                        lVar.getClass();
                    }
                }
                switch (sparseIntArray.get(index2)) {
                    case 1:
                        i5 = indexCount2;
                        iVar.f69005p = f(typedArrayObtainStyledAttributes, index2, iVar.f69005p);
                        continue;
                        i16++;
                    case 2:
                        i5 = indexCount2;
                        iVar.I = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.I);
                        continue;
                        i16++;
                    case 3:
                        i5 = indexCount2;
                        iVar.o = f(typedArrayObtainStyledAttributes, index2, iVar.o);
                        continue;
                        i16++;
                    case 4:
                        i5 = indexCount2;
                        iVar.n = f(typedArrayObtainStyledAttributes, index2, iVar.n);
                        continue;
                        i16++;
                    case 5:
                        i5 = indexCount2;
                        iVar.f69014y = typedArrayObtainStyledAttributes.getString(index2);
                        continue;
                        i16++;
                    case 6:
                        i5 = indexCount2;
                        iVar.C = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index2, iVar.C);
                        continue;
                        i16++;
                    case 7:
                        i5 = indexCount2;
                        iVar.D = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index2, iVar.D);
                        continue;
                        i16++;
                    case 8:
                        i5 = indexCount2;
                        iVar.J = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.J);
                        continue;
                        i16++;
                    case 9:
                        i5 = indexCount2;
                        iVar.f69011v = f(typedArrayObtainStyledAttributes, index2, iVar.f69011v);
                        continue;
                        i16++;
                    case 10:
                        i5 = indexCount2;
                        iVar.f69010u = f(typedArrayObtainStyledAttributes, index2, iVar.f69010u);
                        continue;
                        i16++;
                    case 11:
                        i5 = indexCount2;
                        iVar.P = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.P);
                        continue;
                        i16++;
                    case 12:
                        i5 = indexCount2;
                        iVar.Q = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.Q);
                        continue;
                        i16++;
                    case 13:
                        i5 = indexCount2;
                        iVar.M = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.M);
                        continue;
                        i16++;
                    case 14:
                        i5 = indexCount2;
                        iVar.O = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.O);
                        continue;
                        i16++;
                    case 15:
                        i5 = indexCount2;
                        iVar.R = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.R);
                        continue;
                        i16++;
                    case 16:
                        i5 = indexCount2;
                        iVar.N = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.N);
                        continue;
                        i16++;
                    case 17:
                        i5 = indexCount2;
                        iVar.f68983d = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index2, iVar.f68983d);
                        continue;
                        i16++;
                    case 18:
                        i5 = indexCount2;
                        iVar.f68985e = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index2, iVar.f68985e);
                        continue;
                        i16++;
                    case 19:
                        i5 = indexCount2;
                        iVar.f68987f = typedArrayObtainStyledAttributes.getFloat(index2, iVar.f68987f);
                        continue;
                        i16++;
                    case 20:
                        i5 = indexCount2;
                        iVar.f69012w = typedArrayObtainStyledAttributes.getFloat(index2, iVar.f69012w);
                        continue;
                        i16++;
                    case 21:
                        i5 = indexCount2;
                        iVar.f68981c = typedArrayObtainStyledAttributes.getLayoutDimension(index2, iVar.f68981c);
                        continue;
                        i16++;
                    case 22:
                        i5 = indexCount2;
                        int i17 = typedArrayObtainStyledAttributes.getInt(index2, kVar.f69026a);
                        kVar.f69026a = i17;
                        kVar.f69026a = iArr[i17];
                        continue;
                        i16++;
                    case 23:
                        i5 = indexCount2;
                        iVar.f68979b = typedArrayObtainStyledAttributes.getLayoutDimension(index2, iVar.f68979b);
                        continue;
                        i16++;
                    case 24:
                        i5 = indexCount2;
                        iVar.F = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.F);
                        continue;
                        i16++;
                    case 25:
                        i5 = indexCount2;
                        iVar.f68991h = f(typedArrayObtainStyledAttributes, index2, iVar.f68991h);
                        continue;
                        i16++;
                    case 26:
                        i5 = indexCount2;
                        iVar.f68993i = f(typedArrayObtainStyledAttributes, index2, iVar.f68993i);
                        continue;
                        i16++;
                    case 27:
                        i5 = indexCount2;
                        iVar.E = typedArrayObtainStyledAttributes.getInt(index2, iVar.E);
                        continue;
                        i16++;
                    case 28:
                        i5 = indexCount2;
                        iVar.G = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.G);
                        continue;
                        i16++;
                    case 29:
                        i5 = indexCount2;
                        iVar.f68995j = f(typedArrayObtainStyledAttributes, index2, iVar.f68995j);
                        continue;
                        i16++;
                    case 30:
                        i5 = indexCount2;
                        iVar.f68997k = f(typedArrayObtainStyledAttributes, index2, iVar.f68997k);
                        continue;
                        i16++;
                    case 31:
                        i5 = indexCount2;
                        iVar.K = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.K);
                        continue;
                        i16++;
                    case 32:
                        i5 = indexCount2;
                        iVar.f69008s = f(typedArrayObtainStyledAttributes, index2, iVar.f69008s);
                        continue;
                        i16++;
                    case 33:
                        i5 = indexCount2;
                        iVar.f69009t = f(typedArrayObtainStyledAttributes, index2, iVar.f69009t);
                        continue;
                        i16++;
                    case 34:
                        i5 = indexCount2;
                        iVar.H = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.H);
                        continue;
                        i16++;
                    case 35:
                        i5 = indexCount2;
                        iVar.f69001m = f(typedArrayObtainStyledAttributes, index2, iVar.f69001m);
                        continue;
                        i16++;
                    case 36:
                        i5 = indexCount2;
                        iVar.f68999l = f(typedArrayObtainStyledAttributes, index2, iVar.f68999l);
                        continue;
                        i16++;
                    case 37:
                        i5 = indexCount2;
                        iVar.f69013x = typedArrayObtainStyledAttributes.getFloat(index2, iVar.f69013x);
                        continue;
                        i16++;
                    case 38:
                        i5 = indexCount2;
                        hVar.f68970a = typedArrayObtainStyledAttributes.getResourceId(index2, hVar.f68970a);
                        continue;
                        i16++;
                    case 39:
                        i5 = indexCount2;
                        iVar.U = typedArrayObtainStyledAttributes.getFloat(index2, iVar.U);
                        continue;
                        i16++;
                    case 40:
                        i5 = indexCount2;
                        iVar.T = typedArrayObtainStyledAttributes.getFloat(index2, iVar.T);
                        continue;
                        i16++;
                    case 41:
                        i5 = indexCount2;
                        iVar.V = typedArrayObtainStyledAttributes.getInt(index2, iVar.V);
                        continue;
                        i16++;
                    case 42:
                        i5 = indexCount2;
                        iVar.W = typedArrayObtainStyledAttributes.getInt(index2, iVar.W);
                        continue;
                        i16++;
                    case 43:
                        i5 = indexCount2;
                        kVar.f69028c = typedArrayObtainStyledAttributes.getFloat(index2, kVar.f69028c);
                        continue;
                        i16++;
                    case 44:
                        i5 = indexCount2;
                        lVar.f69041l = true;
                        lVar.f69042m = typedArrayObtainStyledAttributes.getDimension(index2, lVar.f69042m);
                        continue;
                        i16++;
                    case 45:
                        i5 = indexCount2;
                        lVar.f69031b = typedArrayObtainStyledAttributes.getFloat(index2, lVar.f69031b);
                        continue;
                        i16++;
                    case 46:
                        i5 = indexCount2;
                        lVar.f69032c = typedArrayObtainStyledAttributes.getFloat(index2, lVar.f69032c);
                        continue;
                        i16++;
                    case 47:
                        i5 = indexCount2;
                        lVar.f69033d = typedArrayObtainStyledAttributes.getFloat(index2, lVar.f69033d);
                        continue;
                        i16++;
                    case 48:
                        i5 = indexCount2;
                        lVar.f69034e = typedArrayObtainStyledAttributes.getFloat(index2, lVar.f69034e);
                        continue;
                        i16++;
                    case 49:
                        i5 = indexCount2;
                        lVar.f69035f = typedArrayObtainStyledAttributes.getDimension(index2, lVar.f69035f);
                        continue;
                        i16++;
                    case 50:
                        i5 = indexCount2;
                        lVar.f69036g = typedArrayObtainStyledAttributes.getDimension(index2, lVar.f69036g);
                        continue;
                        i16++;
                    case 51:
                        i5 = indexCount2;
                        lVar.f69038i = typedArrayObtainStyledAttributes.getDimension(index2, lVar.f69038i);
                        continue;
                        i16++;
                    case 52:
                        i5 = indexCount2;
                        lVar.f69039j = typedArrayObtainStyledAttributes.getDimension(index2, lVar.f69039j);
                        continue;
                        i16++;
                    case 53:
                        i5 = indexCount2;
                        lVar.f69040k = typedArrayObtainStyledAttributes.getDimension(index2, lVar.f69040k);
                        continue;
                        i16++;
                    case 54:
                        i5 = indexCount2;
                        iVar.X = typedArrayObtainStyledAttributes.getInt(index2, iVar.X);
                        continue;
                        i16++;
                    case 55:
                        i5 = indexCount2;
                        iVar.Y = typedArrayObtainStyledAttributes.getInt(index2, iVar.Y);
                        continue;
                        i16++;
                    case 56:
                        i5 = indexCount2;
                        iVar.Z = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.Z);
                        continue;
                        i16++;
                    case 57:
                        i5 = indexCount2;
                        iVar.f68978a0 = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.f68978a0);
                        continue;
                        i16++;
                    case 58:
                        i5 = indexCount2;
                        iVar.f68980b0 = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.f68980b0);
                        continue;
                        i16++;
                    case 59:
                        i5 = indexCount2;
                        iVar.f68982c0 = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.f68982c0);
                        continue;
                        i16++;
                    case 60:
                        i5 = indexCount2;
                        lVar.f69030a = typedArrayObtainStyledAttributes.getFloat(index2, lVar.f69030a);
                        continue;
                        i16++;
                    case 61:
                        i5 = indexCount2;
                        iVar.f69015z = f(typedArrayObtainStyledAttributes, index2, iVar.f69015z);
                        continue;
                        i16++;
                    case 62:
                        i5 = indexCount2;
                        iVar.A = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.A);
                        continue;
                        i16++;
                    case 63:
                        i5 = indexCount2;
                        iVar.B = typedArrayObtainStyledAttributes.getFloat(index2, iVar.B);
                        continue;
                        i16++;
                    case 64:
                        i5 = indexCount2;
                        jVar.f69017a = f(typedArrayObtainStyledAttributes, index2, jVar.f69017a);
                        continue;
                        i16++;
                    case 65:
                        i5 = indexCount2;
                        if (typedArrayObtainStyledAttributes.peekValue(index2).type == 3) {
                            typedArrayObtainStyledAttributes.getString(index2);
                            jVar.getClass();
                            break;
                        } else {
                            String str = strArr[typedArrayObtainStyledAttributes.getInteger(index2, 0)];
                            jVar.getClass();
                            i16++;
                        }
                    case 66:
                        i5 = indexCount2;
                        typedArrayObtainStyledAttributes.getInt(index2, 0);
                        jVar.getClass();
                        continue;
                        i16++;
                    case 67:
                        i5 = indexCount2;
                        jVar.f69021e = typedArrayObtainStyledAttributes.getFloat(index2, jVar.f69021e);
                        break;
                    case 68:
                        i5 = indexCount2;
                        kVar.f69029d = typedArrayObtainStyledAttributes.getFloat(index2, kVar.f69029d);
                        break;
                    case 69:
                        i5 = indexCount2;
                        iVar.f68984d0 = typedArrayObtainStyledAttributes.getFloat(index2, 1.0f);
                        break;
                    case 70:
                        i5 = indexCount2;
                        iVar.f68986e0 = typedArrayObtainStyledAttributes.getFloat(index2, 1.0f);
                        break;
                    case 71:
                        i5 = indexCount2;
                        Log.e("ConstraintSet", "CURRENTLY UNSUPPORTED");
                        break;
                    case 72:
                        i5 = indexCount2;
                        iVar.f68988f0 = typedArrayObtainStyledAttributes.getInt(index2, iVar.f68988f0);
                        break;
                    case 73:
                        i5 = indexCount2;
                        iVar.f68990g0 = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.f68990g0);
                        break;
                    case 74:
                        i5 = indexCount2;
                        iVar.f68996j0 = typedArrayObtainStyledAttributes.getString(index2);
                        break;
                    case 75:
                        i5 = indexCount2;
                        iVar.f69003n0 = typedArrayObtainStyledAttributes.getBoolean(index2, iVar.f69003n0);
                        break;
                    case 76:
                        i5 = indexCount2;
                        jVar.f69019c = typedArrayObtainStyledAttributes.getInt(index2, jVar.f69019c);
                        break;
                    case 77:
                        i5 = indexCount2;
                        iVar.f68998k0 = typedArrayObtainStyledAttributes.getString(index2);
                        break;
                    case 78:
                        i5 = indexCount2;
                        kVar.f69027b = typedArrayObtainStyledAttributes.getInt(index2, kVar.f69027b);
                        break;
                    case 79:
                        i5 = indexCount2;
                        jVar.f69020d = typedArrayObtainStyledAttributes.getFloat(index2, jVar.f69020d);
                        break;
                    case 80:
                        i5 = indexCount2;
                        iVar.f69000l0 = typedArrayObtainStyledAttributes.getBoolean(index2, iVar.f69000l0);
                        break;
                    case 81:
                        i5 = indexCount2;
                        iVar.f69002m0 = typedArrayObtainStyledAttributes.getBoolean(index2, iVar.f69002m0);
                        break;
                    case 82:
                        i5 = indexCount2;
                        jVar.f69018b = typedArrayObtainStyledAttributes.getInteger(index2, jVar.f69018b);
                        break;
                    case 83:
                        i5 = indexCount2;
                        lVar.f69037h = f(typedArrayObtainStyledAttributes, index2, lVar.f69037h);
                        break;
                    case 84:
                        i5 = indexCount2;
                        jVar.f69023g = typedArrayObtainStyledAttributes.getInteger(index2, jVar.f69023g);
                        break;
                    case 85:
                        i5 = indexCount2;
                        jVar.f69022f = typedArrayObtainStyledAttributes.getFloat(index2, jVar.f69022f);
                        break;
                    case 86:
                        i5 = indexCount2;
                        int i18 = typedArrayObtainStyledAttributes.peekValue(index2).type;
                        if (i18 == 1) {
                            jVar.f69025i = typedArrayObtainStyledAttributes.getResourceId(index2, -1);
                            break;
                        } else if (i18 == 3) {
                            String string2 = typedArrayObtainStyledAttributes.getString(index2);
                            jVar.f69024h = string2;
                            if (string2.indexOf("/") > 0) {
                                jVar.f69025i = typedArrayObtainStyledAttributes.getResourceId(index2, -1);
                                break;
                            }
                        } else {
                            typedArrayObtainStyledAttributes.getInteger(index2, jVar.f69025i);
                            break;
                        }
                        break;
                    case 87:
                        i5 = indexCount2;
                        Log.w("ConstraintSet", "unused attribute 0x" + Integer.toHexString(index2) + "   " + sparseIntArray.get(index2));
                        break;
                    case 88:
                    case 89:
                    case 90:
                    default:
                        StringBuilder sb3 = new StringBuilder("Unknown attribute 0x");
                        i5 = indexCount2;
                        sb3.append(Integer.toHexString(index2));
                        sb3.append("   ");
                        sb3.append(sparseIntArray.get(index2));
                        Log.w("ConstraintSet", sb3.toString());
                        break;
                    case 91:
                        i5 = indexCount2;
                        iVar.f69006q = f(typedArrayObtainStyledAttributes, index2, iVar.f69006q);
                        break;
                    case pd.N0 /* 92 */:
                        i5 = indexCount2;
                        iVar.f69007r = f(typedArrayObtainStyledAttributes, index2, iVar.f69007r);
                        break;
                    case pd.O0 /* 93 */:
                        i5 = indexCount2;
                        iVar.L = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.L);
                        break;
                    case pd.P0 /* 94 */:
                        i5 = indexCount2;
                        iVar.S = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, iVar.S);
                        break;
                    case pd.f8203p0 /* 95 */:
                        i5 = indexCount2;
                        g(iVar, typedArrayObtainStyledAttributes, index2, 0);
                        continue;
                        i16++;
                    case pd.A0 /* 96 */:
                        i5 = indexCount2;
                        g(iVar, typedArrayObtainStyledAttributes, index2, 1);
                        break;
                    case pd.H0 /* 97 */:
                        i5 = indexCount2;
                        iVar.f69004o0 = typedArrayObtainStyledAttributes.getInt(index2, iVar.f69004o0);
                        break;
                }
                i16++;
            }
            if (iVar.f68996j0 != null) {
                iVar.f68994i0 = null;
            }
        }
        typedArrayObtainStyledAttributes.recycle();
        return hVar;
    }

    public static int f(TypedArray typedArray, int i5, int i11) {
        int resourceId = typedArray.getResourceId(i5, i11);
        return resourceId == -1 ? typedArray.getInt(i5, -1) : resourceId;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0036  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0044  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void g(Object obj, TypedArray typedArray, int i5, int i11) throws NumberFormatException {
        int dimensionPixelSize;
        if (obj == null) {
            return;
        }
        int i12 = typedArray.peekValue(i5).type;
        boolean z11 = true;
        int i13 = 0;
        if (i12 == 3) {
            String string = typedArray.getString(i5);
            if (string == null) {
                return;
            }
            int iIndexOf = string.indexOf(61);
            int length = string.length();
            if (iIndexOf <= 0 || iIndexOf >= length - 1) {
                return;
            }
            String strSubstring = string.substring(0, iIndexOf);
            String strSubstring2 = string.substring(iIndexOf + 1);
            if (strSubstring2.length() > 0) {
                String strTrim = strSubstring.trim();
                String strTrim2 = strSubstring2.trim();
                if ("ratio".equalsIgnoreCase(strTrim)) {
                    if (obj instanceof e) {
                        e eVar = (e) obj;
                        if (i11 == 0) {
                            ((ViewGroup.MarginLayoutParams) eVar).width = 0;
                        } else {
                            ((ViewGroup.MarginLayoutParams) eVar).height = 0;
                        }
                        h(eVar, strTrim2);
                        return;
                    }
                    if (obj instanceof i) {
                        ((i) obj).f69014y = strTrim2;
                        return;
                    } else {
                        if (obj instanceof g) {
                            ((g) obj).c(5, strTrim2);
                            return;
                        }
                        return;
                    }
                }
                try {
                    if ("weight".equalsIgnoreCase(strTrim)) {
                        float f11 = Float.parseFloat(strTrim2);
                        if (obj instanceof e) {
                            e eVar2 = (e) obj;
                            if (i11 == 0) {
                                ((ViewGroup.MarginLayoutParams) eVar2).width = 0;
                                eVar2.H = f11;
                                return;
                            } else {
                                ((ViewGroup.MarginLayoutParams) eVar2).height = 0;
                                eVar2.I = f11;
                                return;
                            }
                        }
                        if (obj instanceof i) {
                            i iVar = (i) obj;
                            if (i11 == 0) {
                                iVar.f68979b = 0;
                                iVar.U = f11;
                                return;
                            } else {
                                iVar.f68981c = 0;
                                iVar.T = f11;
                                return;
                            }
                        }
                        if (obj instanceof g) {
                            g gVar = (g) obj;
                            if (i11 == 0) {
                                gVar.b(23, 0);
                                gVar.a(f11, 39);
                                return;
                            } else {
                                gVar.b(21, 0);
                                gVar.a(f11, 40);
                                return;
                            }
                        }
                        return;
                    }
                    if ("parent".equalsIgnoreCase(strTrim)) {
                        float fMax = Math.max(0.0f, Math.min(1.0f, Float.parseFloat(strTrim2)));
                        if (obj instanceof e) {
                            e eVar3 = (e) obj;
                            if (i11 == 0) {
                                ((ViewGroup.MarginLayoutParams) eVar3).width = 0;
                                eVar3.R = fMax;
                                eVar3.L = 2;
                                return;
                            } else {
                                ((ViewGroup.MarginLayoutParams) eVar3).height = 0;
                                eVar3.S = fMax;
                                eVar3.M = 2;
                                return;
                            }
                        }
                        if (obj instanceof i) {
                            i iVar2 = (i) obj;
                            if (i11 == 0) {
                                iVar2.f68979b = 0;
                                iVar2.f68984d0 = fMax;
                                iVar2.X = 2;
                                return;
                            } else {
                                iVar2.f68981c = 0;
                                iVar2.f68986e0 = fMax;
                                iVar2.Y = 2;
                                return;
                            }
                        }
                        if (obj instanceof g) {
                            g gVar2 = (g) obj;
                            if (i11 == 0) {
                                gVar2.b(23, 0);
                                gVar2.b(54, 2);
                                return;
                            } else {
                                gVar2.b(21, 0);
                                gVar2.b(55, 2);
                                return;
                            }
                        }
                        return;
                    }
                    return;
                } catch (NumberFormatException unused) {
                    return;
                }
            }
            return;
        }
        if (i12 != 5) {
            dimensionPixelSize = typedArray.getInt(i5, 0);
            if (dimensionPixelSize == -4) {
                i13 = -2;
            } else if (dimensionPixelSize == -3 || (dimensionPixelSize != -2 && dimensionPixelSize != -1)) {
                z11 = false;
            }
            if (!(obj instanceof e)) {
                e eVar4 = (e) obj;
                if (i11 == 0) {
                    ((ViewGroup.MarginLayoutParams) eVar4).width = i13;
                    eVar4.W = z11;
                    return;
                } else {
                    ((ViewGroup.MarginLayoutParams) eVar4).height = i13;
                    eVar4.X = z11;
                    return;
                }
            }
            if (obj instanceof i) {
                i iVar3 = (i) obj;
                if (i11 == 0) {
                    iVar3.f68979b = i13;
                    iVar3.f69000l0 = z11;
                    return;
                } else {
                    iVar3.f68981c = i13;
                    iVar3.f69002m0 = z11;
                    return;
                }
            }
            if (obj instanceof g) {
                g gVar3 = (g) obj;
                if (i11 == 0) {
                    gVar3.b(23, i13);
                    gVar3.d(80, z11);
                    return;
                } else {
                    gVar3.b(21, i13);
                    gVar3.d(81, z11);
                    return;
                }
            }
            return;
        }
        dimensionPixelSize = typedArray.getDimensionPixelSize(i5, 0);
        z11 = false;
        i13 = dimensionPixelSize;
        if (!(obj instanceof e)) {
        }
    }

    public static void h(e eVar, String str) throws NumberFormatException {
        if (str != null) {
            int length = str.length();
            int iIndexOf = str.indexOf(44);
            int i5 = 0;
            if (iIndexOf > 0 && iIndexOf < length - 1) {
                str.substring(0, iIndexOf).equalsIgnoreCase("W");
                i5 = iIndexOf + 1;
            }
            int iIndexOf2 = str.indexOf(58);
            try {
                if (iIndexOf2 < 0 || iIndexOf2 >= length - 1) {
                    String strSubstring = str.substring(i5);
                    if (strSubstring.length() > 0) {
                        Float.parseFloat(strSubstring);
                    }
                } else {
                    String strSubstring2 = str.substring(i5, iIndexOf2);
                    String strSubstring3 = str.substring(iIndexOf2 + 1);
                    if (strSubstring2.length() > 0 && strSubstring3.length() > 0) {
                        Float.parseFloat(strSubstring2);
                        Float.parseFloat(strSubstring3);
                    }
                }
            } catch (NumberFormatException unused) {
            }
        }
        eVar.G = str;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public final void a(ConstraintLayout constraintLayout) {
        HashSet hashSet;
        int i5;
        HashMap map;
        String resourceEntryName;
        m mVar = this;
        int childCount = constraintLayout.getChildCount();
        HashMap map2 = mVar.f69048c;
        HashSet hashSet2 = new HashSet(map2.keySet());
        int i11 = 0;
        while (i11 < childCount) {
            View childAt = constraintLayout.getChildAt(i11);
            int id2 = childAt.getId();
            if (!map2.containsKey(Integer.valueOf(id2))) {
                StringBuilder sb2 = new StringBuilder("id unknown ");
                try {
                    resourceEntryName = childAt.getContext().getResources().getResourceEntryName(childAt.getId());
                } catch (Exception unused) {
                    resourceEntryName = "UNKNOWN";
                }
                sb2.append(resourceEntryName);
                Log.w("ConstraintSet", sb2.toString());
            } else {
                if (mVar.f69047b && id2 == -1) {
                    throw new RuntimeException("All children of ConstraintLayout must have ids to use ConstraintSet");
                }
                if (id2 != -1 && map2.containsKey(Integer.valueOf(id2))) {
                    hashSet2.remove(Integer.valueOf(id2));
                    h hVar = (h) map2.get(Integer.valueOf(id2));
                    if (hVar != null) {
                        k kVar = hVar.f68971b;
                        i iVar = hVar.f68973d;
                        l lVar = hVar.f68974e;
                        if (childAt instanceof a) {
                            iVar.f68992h0 = 1;
                            a aVar = (a) childAt;
                            aVar.setId(id2);
                            aVar.f68895h = iVar.f68988f0;
                            int i12 = iVar.f68990g0;
                            g4.a aVar2 = aVar.f68897j;
                            aVar2.f57056t0 = i12;
                            aVar2.f57055s0 = iVar.f69003n0;
                            int[] iArr = iVar.f68994i0;
                            if (iArr != null) {
                                aVar.j(iArr);
                            } else {
                                String str = iVar.f68996j0;
                                if (str != null) {
                                    int[] iArrC = c(aVar, str);
                                    iVar.f68994i0 = iArrC;
                                    aVar.j(iArrC);
                                }
                            }
                        }
                        e eVar = (e) childAt.getLayoutParams();
                        eVar.a();
                        hVar.a(eVar);
                        HashMap map3 = hVar.f68975f;
                        Class<?> cls = childAt.getClass();
                        for (String str2 : map3.keySet()) {
                            b bVar = (b) map3.get(str2);
                            HashSet hashSet3 = hashSet2;
                            String strK = !bVar.f68898a ? c0.k("set", str2) : str2;
                            int i13 = i11;
                            try {
                                int iF = c0.F(bVar.f68899b);
                                Class cls2 = Float.TYPE;
                                Class cls3 = Integer.TYPE;
                                switch (iF) {
                                    case 0:
                                        map = map3;
                                        cls.getMethod(strK, cls3).invoke(childAt, Integer.valueOf(bVar.f68900c));
                                        break;
                                    case 1:
                                        map = map3;
                                        cls.getMethod(strK, cls2).invoke(childAt, Float.valueOf(bVar.f68901d));
                                        break;
                                    case 2:
                                        map = map3;
                                        cls.getMethod(strK, cls3).invoke(childAt, Integer.valueOf(bVar.f68904g));
                                        break;
                                    case 3:
                                        Method method = cls.getMethod(strK, Drawable.class);
                                        map = map3;
                                        try {
                                            ColorDrawable colorDrawable = new ColorDrawable();
                                            colorDrawable.setColor(bVar.f68904g);
                                            method.invoke(childAt, colorDrawable);
                                        } catch (IllegalAccessException e3) {
                                            e = e3;
                                            StringBuilder sbK = u4.k(" Custom Attribute \"", str2, "\" not found on ");
                                            sbK.append(cls.getName());
                                            Log.e("TransitionLayout", sbK.toString(), e);
                                            hashSet2 = hashSet3;
                                            i11 = i13;
                                            map3 = map;
                                        } catch (NoSuchMethodException e11) {
                                            e = e11;
                                            Log.e("TransitionLayout", cls.getName() + " must have a method " + strK, e);
                                            hashSet2 = hashSet3;
                                            i11 = i13;
                                            map3 = map;
                                        } catch (InvocationTargetException e12) {
                                            e = e12;
                                            StringBuilder sbK2 = u4.k(" Custom Attribute \"", str2, "\" not found on ");
                                            sbK2.append(cls.getName());
                                            Log.e("TransitionLayout", sbK2.toString(), e);
                                            hashSet2 = hashSet3;
                                            i11 = i13;
                                            map3 = map;
                                        }
                                    case 4:
                                        cls.getMethod(strK, CharSequence.class).invoke(childAt, bVar.f68902e);
                                        map = map3;
                                        break;
                                    case 5:
                                        cls.getMethod(strK, Boolean.TYPE).invoke(childAt, Boolean.valueOf(bVar.f68903f));
                                        map = map3;
                                        break;
                                    case 6:
                                        cls.getMethod(strK, cls2).invoke(childAt, Float.valueOf(bVar.f68901d));
                                        map = map3;
                                        break;
                                    case 7:
                                        cls.getMethod(strK, cls3).invoke(childAt, Integer.valueOf(bVar.f68900c));
                                        map = map3;
                                        break;
                                    default:
                                        map = map3;
                                        break;
                                }
                            } catch (IllegalAccessException e13) {
                                e = e13;
                                map = map3;
                            } catch (NoSuchMethodException e14) {
                                e = e14;
                                map = map3;
                            } catch (InvocationTargetException e15) {
                                e = e15;
                                map = map3;
                            }
                            hashSet2 = hashSet3;
                            i11 = i13;
                            map3 = map;
                        }
                        hashSet = hashSet2;
                        i5 = i11;
                        childAt.setLayoutParams(eVar);
                        if (kVar.f69027b == 0) {
                            childAt.setVisibility(kVar.f69026a);
                        }
                        childAt.setAlpha(kVar.f69028c);
                        childAt.setRotation(lVar.f69030a);
                        childAt.setRotationX(lVar.f69031b);
                        childAt.setRotationY(lVar.f69032c);
                        childAt.setScaleX(lVar.f69033d);
                        childAt.setScaleY(lVar.f69034e);
                        if (lVar.f69037h != -1) {
                            if (((View) childAt.getParent()).findViewById(lVar.f69037h) != null) {
                                float bottom = (r0.getBottom() + r0.getTop()) / 2.0f;
                                float right = (r0.getRight() + r0.getLeft()) / 2.0f;
                                if (childAt.getRight() - childAt.getLeft() > 0 && childAt.getBottom() - childAt.getTop() > 0) {
                                    childAt.setPivotX(right - childAt.getLeft());
                                    childAt.setPivotY(bottom - childAt.getTop());
                                }
                            }
                        } else {
                            if (!Float.isNaN(lVar.f69035f)) {
                                childAt.setPivotX(lVar.f69035f);
                            }
                            if (!Float.isNaN(lVar.f69036g)) {
                                childAt.setPivotY(lVar.f69036g);
                            }
                        }
                        childAt.setTranslationX(lVar.f69038i);
                        childAt.setTranslationY(lVar.f69039j);
                        childAt.setTranslationZ(lVar.f69040k);
                        if (lVar.f69041l) {
                            childAt.setElevation(lVar.f69042m);
                        }
                    }
                }
                i11 = i5 + 1;
                mVar = this;
                hashSet2 = hashSet;
            }
            hashSet = hashSet2;
            i5 = i11;
            i11 = i5 + 1;
            mVar = this;
            hashSet2 = hashSet;
        }
        Iterator it = hashSet2.iterator();
        while (it.hasNext()) {
            Integer num = (Integer) it.next();
            h hVar2 = (h) map2.get(num);
            if (hVar2 != null) {
                i iVar2 = hVar2.f68973d;
                if (iVar2.f68992h0 == 1) {
                    Context context = constraintLayout.getContext();
                    a aVar3 = new a(context);
                    aVar3.f68905a = new int[32];
                    aVar3.f68911g = new HashMap();
                    aVar3.f68907c = context;
                    g4.a aVar4 = new g4.a();
                    aVar4.f57054r0 = 0;
                    aVar4.f57055s0 = true;
                    aVar4.f57056t0 = 0;
                    aVar4.f57057u0 = false;
                    aVar3.f68897j = aVar4;
                    aVar3.f68908d = aVar4;
                    aVar3.k();
                    aVar3.setVisibility(8);
                    aVar3.setId(num.intValue());
                    int[] iArr2 = iVar2.f68994i0;
                    if (iArr2 != null) {
                        aVar3.j(iArr2);
                    } else {
                        String str3 = iVar2.f68996j0;
                        if (str3 != null) {
                            int[] iArrC2 = c(aVar3, str3);
                            iVar2.f68994i0 = iArrC2;
                            aVar3.j(iArrC2);
                        }
                    }
                    aVar3.f68895h = iVar2.f68988f0;
                    aVar3.f68897j.f57056t0 = iVar2.f68990g0;
                    int i14 = ConstraintLayout.o;
                    e eVar2 = new e(-2, -2);
                    aVar3.k();
                    hVar2.a(eVar2);
                    constraintLayout.addView(aVar3, eVar2);
                }
                if (iVar2.f68977a) {
                    View nVar = new n(constraintLayout.getContext());
                    nVar.setId(num.intValue());
                    int i15 = ConstraintLayout.o;
                    e eVar3 = new e(-2, -2);
                    hVar2.a(eVar3);
                    constraintLayout.addView(nVar, eVar3);
                }
            }
        }
        for (int i16 = 0; i16 < childCount; i16++) {
            View childAt2 = constraintLayout.getChildAt(i16);
            if (childAt2 instanceof c) {
                ((c) childAt2).e(constraintLayout);
            }
        }
    }

    public final void b(ConstraintLayout constraintLayout) {
        int i5;
        HashMap map;
        int i11;
        m mVar = this;
        int childCount = constraintLayout.getChildCount();
        HashMap map2 = mVar.f69048c;
        map2.clear();
        int i12 = 0;
        while (i12 < childCount) {
            View childAt = constraintLayout.getChildAt(i12);
            e eVar = (e) childAt.getLayoutParams();
            int id2 = childAt.getId();
            if (mVar.f69047b && id2 == -1) {
                throw new RuntimeException("All children of ConstraintLayout must have ids to use ConstraintSet");
            }
            if (!map2.containsKey(Integer.valueOf(id2))) {
                map2.put(Integer.valueOf(id2), new h());
            }
            h hVar = (h) map2.get(Integer.valueOf(id2));
            if (hVar == null) {
                i5 = childCount;
                map = map2;
                i11 = i12;
            } else {
                k kVar = hVar.f68971b;
                i iVar = hVar.f68973d;
                l lVar = hVar.f68974e;
                i5 = childCount;
                HashMap map3 = new HashMap();
                map = map2;
                Class<?> cls = childAt.getClass();
                i11 = i12;
                HashMap map4 = mVar.f69046a;
                for (String str : map4.keySet()) {
                    b bVar = (b) map4.get(str);
                    HashMap map5 = map4;
                    try {
                        if (str.equals("BackgroundColor")) {
                            map3.put(str, new b(bVar, Integer.valueOf(((ColorDrawable) childAt.getBackground()).getColor())));
                        } else {
                            map3.put(str, new b(bVar, cls.getMethod("getMap" + str, null).invoke(childAt, null)));
                        }
                    } catch (IllegalAccessException e3) {
                        StringBuilder sbK = u4.k(" Custom Attribute \"", str, "\" not found on ");
                        sbK.append(cls.getName());
                        Log.e("TransitionLayout", sbK.toString(), e3);
                    } catch (NoSuchMethodException e11) {
                        Log.e("TransitionLayout", cls.getName() + " must have a method " + str, e11);
                    } catch (InvocationTargetException e12) {
                        StringBuilder sbK2 = u4.k(" Custom Attribute \"", str, "\" not found on ");
                        sbK2.append(cls.getName());
                        Log.e("TransitionLayout", sbK2.toString(), e12);
                    }
                    map4 = map5;
                }
                hVar.f68975f = map3;
                hVar.f68970a = id2;
                iVar.f68991h = eVar.f68921e;
                iVar.f68993i = eVar.f68923f;
                iVar.f68995j = eVar.f68925g;
                iVar.f68997k = eVar.f68927h;
                iVar.f68999l = eVar.f68929i;
                iVar.f69001m = eVar.f68931j;
                iVar.n = eVar.f68933k;
                iVar.o = eVar.f68935l;
                iVar.f69005p = eVar.f68937m;
                iVar.f69006q = eVar.n;
                iVar.f69007r = eVar.o;
                iVar.f69008s = eVar.f68945s;
                iVar.f69009t = eVar.f68946t;
                iVar.f69010u = eVar.f68947u;
                iVar.f69011v = eVar.f68948v;
                iVar.f69012w = eVar.E;
                iVar.f69013x = eVar.F;
                iVar.f69014y = eVar.G;
                iVar.f69015z = eVar.f68941p;
                iVar.A = eVar.f68943q;
                iVar.B = eVar.f68944r;
                iVar.C = eVar.T;
                iVar.D = eVar.U;
                iVar.E = eVar.V;
                iVar.f68987f = eVar.f68917c;
                iVar.f68983d = eVar.f68913a;
                iVar.f68985e = eVar.f68915b;
                iVar.f68979b = ((ViewGroup.MarginLayoutParams) eVar).width;
                iVar.f68981c = ((ViewGroup.MarginLayoutParams) eVar).height;
                iVar.F = ((ViewGroup.MarginLayoutParams) eVar).leftMargin;
                iVar.G = ((ViewGroup.MarginLayoutParams) eVar).rightMargin;
                iVar.H = ((ViewGroup.MarginLayoutParams) eVar).topMargin;
                iVar.I = ((ViewGroup.MarginLayoutParams) eVar).bottomMargin;
                iVar.L = eVar.D;
                iVar.T = eVar.I;
                iVar.U = eVar.H;
                iVar.W = eVar.K;
                iVar.V = eVar.J;
                iVar.f69000l0 = eVar.W;
                iVar.f69002m0 = eVar.X;
                iVar.X = eVar.L;
                iVar.Y = eVar.M;
                iVar.Z = eVar.P;
                iVar.f68978a0 = eVar.Q;
                iVar.f68980b0 = eVar.N;
                iVar.f68982c0 = eVar.O;
                iVar.f68984d0 = eVar.R;
                iVar.f68986e0 = eVar.S;
                iVar.f68998k0 = eVar.Y;
                iVar.N = eVar.f68950x;
                iVar.P = eVar.f68952z;
                iVar.M = eVar.f68949w;
                iVar.O = eVar.f68951y;
                iVar.R = eVar.A;
                iVar.Q = eVar.B;
                iVar.S = eVar.C;
                iVar.f69004o0 = eVar.Z;
                iVar.J = eVar.getMarginEnd();
                iVar.K = eVar.getMarginStart();
                kVar.f69026a = childAt.getVisibility();
                kVar.f69028c = childAt.getAlpha();
                lVar.f69030a = childAt.getRotation();
                lVar.f69031b = childAt.getRotationX();
                lVar.f69032c = childAt.getRotationY();
                lVar.f69033d = childAt.getScaleX();
                lVar.f69034e = childAt.getScaleY();
                float pivotX = childAt.getPivotX();
                float pivotY = childAt.getPivotY();
                if (pivotX != 0.0d || pivotY != 0.0d) {
                    lVar.f69035f = pivotX;
                    lVar.f69036g = pivotY;
                }
                lVar.f69038i = childAt.getTranslationX();
                lVar.f69039j = childAt.getTranslationY();
                lVar.f69040k = childAt.getTranslationZ();
                if (lVar.f69041l) {
                    lVar.f69042m = childAt.getElevation();
                }
                if (childAt instanceof a) {
                    a aVar = (a) childAt;
                    iVar.f69003n0 = aVar.f68897j.f57055s0;
                    iVar.f68994i0 = Arrays.copyOf(aVar.f68905a, aVar.f68906b);
                    iVar.f68988f0 = aVar.f68895h;
                    iVar.f68990g0 = aVar.f68897j.f57056t0;
                }
            }
            i12 = i11 + 1;
            mVar = this;
            childCount = i5;
            map2 = map;
        }
    }

    public final void e(Context context, int i5) throws XmlPullParserException, Resources.NotFoundException, IOException {
        XmlResourceParser xml = context.getResources().getXml(i5);
        try {
            for (int eventType = xml.getEventType(); eventType != 1; eventType = xml.next()) {
                if (eventType == 2) {
                    String name = xml.getName();
                    h hVarD = d(context, Xml.asAttributeSet(xml), false);
                    if (name.equalsIgnoreCase("Guideline")) {
                        hVarD.f68973d.f68977a = true;
                    }
                    this.f69048c.put(Integer.valueOf(hVarD.f68970a), hVarD);
                }
            }
        } catch (IOException e3) {
            Log.e("ConstraintSet", "Error parsing resource: " + i5, e3);
        } catch (XmlPullParserException e11) {
            Log.e("ConstraintSet", "Error parsing resource: " + i5, e11);
        }
    }
}
