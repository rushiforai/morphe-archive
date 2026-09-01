package defpackage;

import android.content.Context;
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
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j62 {
    public static final int[] c = {0, 4, 8};
    public static final SparseIntArray d;
    public static final SparseIntArray e;
    public final HashMap a = new HashMap();
    public final HashMap b = new HashMap();

    static {
        SparseIntArray sparseIntArray = new SparseIntArray();
        d = sparseIntArray;
        SparseIntArray sparseIntArray2 = new SparseIntArray();
        e = sparseIntArray2;
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
        sparseIntArray.append(PanasonicMakernoteDirectory.TAG_COUNTRY, 12);
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
        sparseIntArray.append(PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE, 65);
        sparseIntArray.append(35, 66);
        sparseIntArray.append(122, 67);
        sparseIntArray.append(113, 79);
        sparseIntArray.append(1, 38);
        sparseIntArray.append(PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 68);
        sparseIntArray.append(100, 69);
        sparseIntArray.append(77, 70);
        sparseIntArray.append(PanasonicMakernoteDirectory.TAG_LANDMARK, 97);
        sparseIntArray.append(32, 71);
        sparseIntArray.append(30, 72);
        sparseIntArray.append(31, 73);
        sparseIntArray.append(33, 74);
        sparseIntArray.append(29, 75);
        sparseIntArray.append(114, 76);
        sparseIntArray.append(89, 77);
        sparseIntArray.append(123, 78);
        sparseIntArray.append(56, 80);
        sparseIntArray.append(55, 81);
        sparseIntArray.append(116, 82);
        sparseIntArray.append(120, 83);
        sparseIntArray.append(PanasonicMakernoteDirectory.TAG_BURST_SPEED, 84);
        sparseIntArray.append(118, 85);
        sparseIntArray.append(117, 86);
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
        sparseIntArray2.append(PanasonicMakernoteDirectory.TAG_COUNTRY, 65);
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

    public static int[] c(an0 an0Var, String str) {
        int iIntValue;
        String[] strArrSplit = str.split(",");
        Context context = an0Var.getContext();
        int[] iArr = new int[strArrSplit.length];
        int i = 0;
        int i2 = 0;
        while (i < strArrSplit.length) {
            String strTrim = strArrSplit[i].trim();
            Object obj = null;
            try {
                iIntValue = sra.class.getField(strTrim).getInt(null);
            } catch (Exception unused) {
                iIntValue = 0;
            }
            if (iIntValue == 0) {
                iIntValue = context.getResources().getIdentifier(strTrim, "id", context.getPackageName());
            }
            if (iIntValue == 0 && an0Var.isInEditMode() && (an0Var.getParent() instanceof ConstraintLayout)) {
                ConstraintLayout constraintLayout = (ConstraintLayout) an0Var.getParent();
                if (y30.C(strTrim)) {
                    HashMap map = constraintLayout.m;
                    if (map != null && map.containsKey(strTrim)) {
                        obj = constraintLayout.m.get(strTrim);
                    }
                } else {
                    constraintLayout.getClass();
                }
                if (obj != null && (obj instanceof Integer)) {
                    iIntValue = ((Integer) obj).intValue();
                }
            }
            iArr[i2] = iIntValue;
            i++;
            i2++;
        }
        return i2 != strArrSplit.length ? Arrays.copyOf(iArr, i2) : iArr;
    }

    public static e62 d(Context context, AttributeSet attributeSet, boolean z) {
        int i;
        int i2;
        e62 e62Var = new e62();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, z ? xra.c : xra.a);
        String[] strArr = pwd.i;
        h62 h62Var = e62Var.b;
        i62 i62Var = e62Var.e;
        g62 g62Var = e62Var.c;
        f62 f62Var = e62Var.d;
        int[] iArr = c;
        SparseIntArray sparseIntArray = d;
        if (z) {
            d62 d62Var = new d62();
            d62Var.a = new int[10];
            d62Var.b = new int[10];
            d62Var.c = 0;
            d62Var.d = new int[10];
            d62Var.e = new float[10];
            d62Var.f = 0;
            d62Var.g = new int[5];
            d62Var.h = new String[5];
            d62Var.i = 0;
            d62Var.j = new int[4];
            d62Var.k = new boolean[4];
            d62Var.l = 0;
            int i3 = 0;
            for (int indexCount = typedArrayObtainStyledAttributes.getIndexCount(); i3 < indexCount; indexCount = i2) {
                int index = typedArrayObtainStyledAttributes.getIndex(i3);
                int i4 = i3;
                switch (e.get(index)) {
                    case 2:
                        i2 = indexCount;
                        d62Var.b(2, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.I));
                        continue;
                        i3 = i4 + 1;
                        break;
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
                    case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
                    case PanasonicMakernoteDirectory.TAG_TRANSFORM /* 89 */:
                    case ReconyxHyperFire2MakernoteDirectory.TAG_FLASH /* 90 */:
                    case 91:
                    case 92:
                    default:
                        StringBuilder sb = new StringBuilder("Unknown attribute 0x");
                        i2 = indexCount;
                        sb.append(Integer.toHexString(index));
                        sb.append("   ");
                        sb.append(sparseIntArray.get(index));
                        Log.w("ConstraintSet", sb.toString());
                        break;
                    case 5:
                        i2 = indexCount;
                        d62Var.c(5, typedArrayObtainStyledAttributes.getString(index));
                        continue;
                        i3 = i4 + 1;
                        break;
                    case 6:
                        i2 = indexCount;
                        d62Var.b(6, typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, f62Var.C));
                        break;
                    case 7:
                        i2 = indexCount;
                        d62Var.b(7, typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, f62Var.D));
                        break;
                    case 8:
                        i2 = indexCount;
                        d62Var.b(8, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.J));
                        break;
                    case 11:
                        i2 = indexCount;
                        d62Var.b(11, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.P));
                        break;
                    case 12:
                        i2 = indexCount;
                        d62Var.b(12, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.Q));
                        break;
                    case 13:
                        i2 = indexCount;
                        d62Var.b(13, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.M));
                        break;
                    case 14:
                        i2 = indexCount;
                        d62Var.b(14, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.O));
                        break;
                    case 15:
                        i2 = indexCount;
                        d62Var.b(15, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.R));
                        break;
                    case 16:
                        i2 = indexCount;
                        d62Var.b(16, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.N));
                        break;
                    case 17:
                        i2 = indexCount;
                        d62Var.b(17, typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, f62Var.d));
                        break;
                    case 18:
                        i2 = indexCount;
                        d62Var.b(18, typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, f62Var.e));
                        break;
                    case 19:
                        i2 = indexCount;
                        d62Var.a(19, typedArrayObtainStyledAttributes.getFloat(index, f62Var.f));
                        break;
                    case 20:
                        i2 = indexCount;
                        d62Var.a(20, typedArrayObtainStyledAttributes.getFloat(index, f62Var.w));
                        break;
                    case 21:
                        i2 = indexCount;
                        d62Var.b(21, typedArrayObtainStyledAttributes.getLayoutDimension(index, f62Var.c));
                        break;
                    case 22:
                        i2 = indexCount;
                        d62Var.b(22, iArr[typedArrayObtainStyledAttributes.getInt(index, h62Var.a)]);
                        break;
                    case 23:
                        i2 = indexCount;
                        d62Var.b(23, typedArrayObtainStyledAttributes.getLayoutDimension(index, f62Var.b));
                        break;
                    case 24:
                        i2 = indexCount;
                        d62Var.b(24, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.F));
                        break;
                    case 27:
                        i2 = indexCount;
                        d62Var.b(27, typedArrayObtainStyledAttributes.getInt(index, f62Var.E));
                        break;
                    case 28:
                        i2 = indexCount;
                        d62Var.b(28, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.G));
                        break;
                    case 31:
                        i2 = indexCount;
                        d62Var.b(31, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.K));
                        break;
                    case 34:
                        i2 = indexCount;
                        d62Var.b(34, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.H));
                        break;
                    case 37:
                        i2 = indexCount;
                        d62Var.a(37, typedArrayObtainStyledAttributes.getFloat(index, f62Var.x));
                        break;
                    case 38:
                        i2 = indexCount;
                        int resourceId = typedArrayObtainStyledAttributes.getResourceId(index, e62Var.a);
                        e62Var.a = resourceId;
                        d62Var.b(38, resourceId);
                        break;
                    case 39:
                        i2 = indexCount;
                        d62Var.a(39, typedArrayObtainStyledAttributes.getFloat(index, f62Var.U));
                        break;
                    case 40:
                        i2 = indexCount;
                        d62Var.a(40, typedArrayObtainStyledAttributes.getFloat(index, f62Var.T));
                        break;
                    case 41:
                        i2 = indexCount;
                        d62Var.b(41, typedArrayObtainStyledAttributes.getInt(index, f62Var.V));
                        break;
                    case 42:
                        i2 = indexCount;
                        d62Var.b(42, typedArrayObtainStyledAttributes.getInt(index, f62Var.W));
                        break;
                    case 43:
                        i2 = indexCount;
                        d62Var.a(43, typedArrayObtainStyledAttributes.getFloat(index, h62Var.c));
                        break;
                    case 44:
                        i2 = indexCount;
                        d62Var.d(44, true);
                        d62Var.a(44, typedArrayObtainStyledAttributes.getDimension(index, i62Var.m));
                        break;
                    case 45:
                        i2 = indexCount;
                        d62Var.a(45, typedArrayObtainStyledAttributes.getFloat(index, i62Var.b));
                        break;
                    case 46:
                        i2 = indexCount;
                        d62Var.a(46, typedArrayObtainStyledAttributes.getFloat(index, i62Var.c));
                        break;
                    case 47:
                        i2 = indexCount;
                        d62Var.a(47, typedArrayObtainStyledAttributes.getFloat(index, i62Var.d));
                        break;
                    case 48:
                        i2 = indexCount;
                        d62Var.a(48, typedArrayObtainStyledAttributes.getFloat(index, i62Var.e));
                        break;
                    case 49:
                        i2 = indexCount;
                        d62Var.a(49, typedArrayObtainStyledAttributes.getDimension(index, i62Var.f));
                        break;
                    case 50:
                        i2 = indexCount;
                        d62Var.a(50, typedArrayObtainStyledAttributes.getDimension(index, i62Var.g));
                        break;
                    case 51:
                        i2 = indexCount;
                        d62Var.a(51, typedArrayObtainStyledAttributes.getDimension(index, i62Var.i));
                        break;
                    case 52:
                        i2 = indexCount;
                        d62Var.a(52, typedArrayObtainStyledAttributes.getDimension(index, i62Var.j));
                        break;
                    case 53:
                        i2 = indexCount;
                        d62Var.a(53, typedArrayObtainStyledAttributes.getDimension(index, i62Var.k));
                        break;
                    case 54:
                        i2 = indexCount;
                        d62Var.b(54, typedArrayObtainStyledAttributes.getInt(index, f62Var.X));
                        break;
                    case 55:
                        i2 = indexCount;
                        d62Var.b(55, typedArrayObtainStyledAttributes.getInt(index, f62Var.Y));
                        break;
                    case 56:
                        i2 = indexCount;
                        d62Var.b(56, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.Z));
                        break;
                    case 57:
                        i2 = indexCount;
                        d62Var.b(57, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.a0));
                        break;
                    case 58:
                        i2 = indexCount;
                        d62Var.b(58, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.b0));
                        break;
                    case 59:
                        i2 = indexCount;
                        d62Var.b(59, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.c0));
                        break;
                    case PanasonicMakernoteDirectory.TAG_PROGRAM_ISO /* 60 */:
                        i2 = indexCount;
                        d62Var.a(60, typedArrayObtainStyledAttributes.getFloat(index, i62Var.a));
                        break;
                    case 62:
                        i2 = indexCount;
                        d62Var.b(62, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.A));
                        break;
                    case 63:
                        i2 = indexCount;
                        d62Var.a(63, typedArrayObtainStyledAttributes.getFloat(index, f62Var.B));
                        break;
                    case 64:
                        i2 = indexCount;
                        d62Var.b(64, f(typedArrayObtainStyledAttributes, index, g62Var.a));
                        break;
                    case 65:
                        i2 = indexCount;
                        if (typedArrayObtainStyledAttributes.peekValue(index).type == 3) {
                            d62Var.c(65, typedArrayObtainStyledAttributes.getString(index));
                        } else {
                            d62Var.c(65, strArr[typedArrayObtainStyledAttributes.getInteger(index, 0)]);
                        }
                        break;
                    case 66:
                        i2 = indexCount;
                        d62Var.b(66, typedArrayObtainStyledAttributes.getInt(index, 0));
                        break;
                    case 67:
                        i2 = indexCount;
                        d62Var.a(67, typedArrayObtainStyledAttributes.getFloat(index, g62Var.e));
                        break;
                    case 68:
                        i2 = indexCount;
                        d62Var.a(68, typedArrayObtainStyledAttributes.getFloat(index, h62Var.d));
                        break;
                    case PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS /* 69 */:
                        i2 = indexCount;
                        d62Var.a(69, typedArrayObtainStyledAttributes.getFloat(index, 1.0f));
                        break;
                    case 70:
                        i2 = indexCount;
                        d62Var.a(70, typedArrayObtainStyledAttributes.getFloat(index, 1.0f));
                        break;
                    case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
                        i2 = indexCount;
                        Log.e("ConstraintSet", "CURRENTLY UNSUPPORTED");
                        break;
                    case 72:
                        i2 = indexCount;
                        d62Var.b(72, typedArrayObtainStyledAttributes.getInt(index, f62Var.f0));
                        break;
                    case 73:
                        i2 = indexCount;
                        d62Var.b(73, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.g0));
                        break;
                    case 74:
                        i2 = indexCount;
                        d62Var.c(74, typedArrayObtainStyledAttributes.getString(index));
                        break;
                    case 75:
                        i2 = indexCount;
                        d62Var.d(75, typedArrayObtainStyledAttributes.getBoolean(index, f62Var.n0));
                        break;
                    case 76:
                        i2 = indexCount;
                        d62Var.b(76, typedArrayObtainStyledAttributes.getInt(index, g62Var.c));
                        break;
                    case PanasonicMakernoteDirectory.TAG_AF_POINT_POSITION /* 77 */:
                        i2 = indexCount;
                        d62Var.c(77, typedArrayObtainStyledAttributes.getString(index));
                        break;
                    case 78:
                        i2 = indexCount;
                        d62Var.b(78, typedArrayObtainStyledAttributes.getInt(index, h62Var.b));
                        break;
                    case 79:
                        i2 = indexCount;
                        d62Var.a(79, typedArrayObtainStyledAttributes.getFloat(index, g62Var.d));
                        break;
                    case 80:
                        i2 = indexCount;
                        d62Var.d(80, typedArrayObtainStyledAttributes.getBoolean(index, f62Var.l0));
                        break;
                    case PanasonicMakernoteDirectory.TAG_LENS_TYPE /* 81 */:
                        i2 = indexCount;
                        d62Var.d(81, typedArrayObtainStyledAttributes.getBoolean(index, f62Var.m0));
                        break;
                    case 82:
                        i2 = indexCount;
                        d62Var.b(82, typedArrayObtainStyledAttributes.getInteger(index, g62Var.b));
                        break;
                    case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
                        i2 = indexCount;
                        d62Var.b(83, f(typedArrayObtainStyledAttributes, index, i62Var.h));
                        break;
                    case 84:
                        i2 = indexCount;
                        d62Var.b(84, typedArrayObtainStyledAttributes.getInteger(index, g62Var.g));
                        break;
                    case 85:
                        i2 = indexCount;
                        d62Var.a(85, typedArrayObtainStyledAttributes.getFloat(index, g62Var.f));
                        break;
                    case 86:
                        i2 = indexCount;
                        int i5 = typedArrayObtainStyledAttributes.peekValue(index).type;
                        if (i5 == 1) {
                            int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(index, -1);
                            g62Var.i = resourceId2;
                            d62Var.b(89, resourceId2);
                            if (g62Var.i != -1) {
                                d62Var.b(88, -2);
                            }
                        } else if (i5 == 3) {
                            String string = typedArrayObtainStyledAttributes.getString(index);
                            g62Var.h = string;
                            d62Var.c(90, string);
                            if (g62Var.h.indexOf("/") > 0) {
                                int resourceId3 = typedArrayObtainStyledAttributes.getResourceId(index, -1);
                                g62Var.i = resourceId3;
                                d62Var.b(89, resourceId3);
                                d62Var.b(88, -2);
                            } else {
                                d62Var.b(88, -1);
                            }
                        } else {
                            d62Var.b(88, typedArrayObtainStyledAttributes.getInteger(index, g62Var.i));
                        }
                        break;
                    case 87:
                        i2 = indexCount;
                        Log.w("ConstraintSet", "unused attribute 0x" + Integer.toHexString(index) + "   " + sparseIntArray.get(index));
                        break;
                    case 93:
                        i2 = indexCount;
                        d62Var.b(93, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.L));
                        break;
                    case 94:
                        i2 = indexCount;
                        d62Var.b(94, typedArrayObtainStyledAttributes.getDimensionPixelSize(index, f62Var.S));
                        break;
                    case 95:
                        i2 = indexCount;
                        g(d62Var, typedArrayObtainStyledAttributes, index, 0);
                        break;
                    case 96:
                        i2 = indexCount;
                        g(d62Var, typedArrayObtainStyledAttributes, index, 1);
                        break;
                    case PanasonicMakernoteDirectory.TAG_FACE_RECOGNITION_INFO /* 97 */:
                        i2 = indexCount;
                        d62Var.b(97, typedArrayObtainStyledAttributes.getInt(index, f62Var.o0));
                        break;
                    case 98:
                        i2 = indexCount;
                        int i6 = f48.q;
                        if (typedArrayObtainStyledAttributes.peekValue(index).type == 3) {
                            typedArrayObtainStyledAttributes.getString(index);
                        } else {
                            e62Var.a = typedArrayObtainStyledAttributes.getResourceId(index, e62Var.a);
                        }
                        break;
                    case PanasonicMakernoteDirectory.TAG_RECOGNIZED_FACE_FLAGS /* 99 */:
                        i2 = indexCount;
                        d62Var.d(99, typedArrayObtainStyledAttributes.getBoolean(index, f62Var.g));
                        break;
                }
                i3 = i4 + 1;
            }
        } else {
            int i7 = 0;
            for (int indexCount2 = typedArrayObtainStyledAttributes.getIndexCount(); i7 < indexCount2; indexCount2 = i) {
                int index2 = typedArrayObtainStyledAttributes.getIndex(i7);
                switch (sparseIntArray.get(index2)) {
                    case 1:
                        i = indexCount2;
                        f62Var.p = f(typedArrayObtainStyledAttributes, index2, f62Var.p);
                        continue;
                        i7++;
                        break;
                    case 2:
                        i = indexCount2;
                        f62Var.I = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.I);
                        continue;
                        i7++;
                        break;
                    case 3:
                        i = indexCount2;
                        f62Var.o = f(typedArrayObtainStyledAttributes, index2, f62Var.o);
                        continue;
                        i7++;
                        break;
                    case 4:
                        i = indexCount2;
                        f62Var.n = f(typedArrayObtainStyledAttributes, index2, f62Var.n);
                        continue;
                        i7++;
                        break;
                    case 5:
                        i = indexCount2;
                        f62Var.y = typedArrayObtainStyledAttributes.getString(index2);
                        continue;
                        i7++;
                        break;
                    case 6:
                        i = indexCount2;
                        f62Var.C = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index2, f62Var.C);
                        continue;
                        i7++;
                        break;
                    case 7:
                        i = indexCount2;
                        f62Var.D = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index2, f62Var.D);
                        continue;
                        i7++;
                        break;
                    case 8:
                        i = indexCount2;
                        f62Var.J = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.J);
                        continue;
                        i7++;
                        break;
                    case 9:
                        i = indexCount2;
                        f62Var.v = f(typedArrayObtainStyledAttributes, index2, f62Var.v);
                        continue;
                        i7++;
                        break;
                    case 10:
                        i = indexCount2;
                        f62Var.u = f(typedArrayObtainStyledAttributes, index2, f62Var.u);
                        continue;
                        i7++;
                        break;
                    case 11:
                        i = indexCount2;
                        f62Var.P = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.P);
                        continue;
                        i7++;
                        break;
                    case 12:
                        i = indexCount2;
                        f62Var.Q = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.Q);
                        continue;
                        i7++;
                        break;
                    case 13:
                        i = indexCount2;
                        f62Var.M = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.M);
                        continue;
                        i7++;
                        break;
                    case 14:
                        i = indexCount2;
                        f62Var.O = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.O);
                        continue;
                        i7++;
                        break;
                    case 15:
                        i = indexCount2;
                        f62Var.R = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.R);
                        continue;
                        i7++;
                        break;
                    case 16:
                        i = indexCount2;
                        f62Var.N = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.N);
                        continue;
                        i7++;
                        break;
                    case 17:
                        i = indexCount2;
                        f62Var.d = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index2, f62Var.d);
                        continue;
                        i7++;
                        break;
                    case 18:
                        i = indexCount2;
                        f62Var.e = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index2, f62Var.e);
                        continue;
                        i7++;
                        break;
                    case 19:
                        i = indexCount2;
                        f62Var.f = typedArrayObtainStyledAttributes.getFloat(index2, f62Var.f);
                        continue;
                        i7++;
                        break;
                    case 20:
                        i = indexCount2;
                        f62Var.w = typedArrayObtainStyledAttributes.getFloat(index2, f62Var.w);
                        continue;
                        i7++;
                        break;
                    case 21:
                        i = indexCount2;
                        f62Var.c = typedArrayObtainStyledAttributes.getLayoutDimension(index2, f62Var.c);
                        continue;
                        i7++;
                        break;
                    case 22:
                        i = indexCount2;
                        int i8 = typedArrayObtainStyledAttributes.getInt(index2, h62Var.a);
                        h62Var.a = i8;
                        h62Var.a = iArr[i8];
                        continue;
                        i7++;
                        break;
                    case 23:
                        i = indexCount2;
                        f62Var.b = typedArrayObtainStyledAttributes.getLayoutDimension(index2, f62Var.b);
                        continue;
                        i7++;
                        break;
                    case 24:
                        i = indexCount2;
                        f62Var.F = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.F);
                        continue;
                        i7++;
                        break;
                    case 25:
                        i = indexCount2;
                        f62Var.h = f(typedArrayObtainStyledAttributes, index2, f62Var.h);
                        continue;
                        i7++;
                        break;
                    case 26:
                        i = indexCount2;
                        f62Var.i = f(typedArrayObtainStyledAttributes, index2, f62Var.i);
                        continue;
                        i7++;
                        break;
                    case 27:
                        i = indexCount2;
                        f62Var.E = typedArrayObtainStyledAttributes.getInt(index2, f62Var.E);
                        continue;
                        i7++;
                        break;
                    case 28:
                        i = indexCount2;
                        f62Var.G = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.G);
                        continue;
                        i7++;
                        break;
                    case 29:
                        i = indexCount2;
                        f62Var.j = f(typedArrayObtainStyledAttributes, index2, f62Var.j);
                        continue;
                        i7++;
                        break;
                    case 30:
                        i = indexCount2;
                        f62Var.k = f(typedArrayObtainStyledAttributes, index2, f62Var.k);
                        continue;
                        i7++;
                        break;
                    case 31:
                        i = indexCount2;
                        f62Var.K = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.K);
                        continue;
                        i7++;
                        break;
                    case 32:
                        i = indexCount2;
                        f62Var.s = f(typedArrayObtainStyledAttributes, index2, f62Var.s);
                        continue;
                        i7++;
                        break;
                    case 33:
                        i = indexCount2;
                        f62Var.t = f(typedArrayObtainStyledAttributes, index2, f62Var.t);
                        continue;
                        i7++;
                        break;
                    case 34:
                        i = indexCount2;
                        f62Var.H = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.H);
                        continue;
                        i7++;
                        break;
                    case 35:
                        i = indexCount2;
                        f62Var.m = f(typedArrayObtainStyledAttributes, index2, f62Var.m);
                        continue;
                        i7++;
                        break;
                    case 36:
                        i = indexCount2;
                        f62Var.l = f(typedArrayObtainStyledAttributes, index2, f62Var.l);
                        continue;
                        i7++;
                        break;
                    case 37:
                        i = indexCount2;
                        f62Var.x = typedArrayObtainStyledAttributes.getFloat(index2, f62Var.x);
                        continue;
                        i7++;
                        break;
                    case 38:
                        i = indexCount2;
                        e62Var.a = typedArrayObtainStyledAttributes.getResourceId(index2, e62Var.a);
                        continue;
                        i7++;
                        break;
                    case 39:
                        i = indexCount2;
                        f62Var.U = typedArrayObtainStyledAttributes.getFloat(index2, f62Var.U);
                        continue;
                        i7++;
                        break;
                    case 40:
                        i = indexCount2;
                        f62Var.T = typedArrayObtainStyledAttributes.getFloat(index2, f62Var.T);
                        continue;
                        i7++;
                        break;
                    case 41:
                        i = indexCount2;
                        f62Var.V = typedArrayObtainStyledAttributes.getInt(index2, f62Var.V);
                        continue;
                        i7++;
                        break;
                    case 42:
                        i = indexCount2;
                        f62Var.W = typedArrayObtainStyledAttributes.getInt(index2, f62Var.W);
                        continue;
                        i7++;
                        break;
                    case 43:
                        i = indexCount2;
                        h62Var.c = typedArrayObtainStyledAttributes.getFloat(index2, h62Var.c);
                        continue;
                        i7++;
                        break;
                    case 44:
                        i = indexCount2;
                        i62Var.l = true;
                        i62Var.m = typedArrayObtainStyledAttributes.getDimension(index2, i62Var.m);
                        continue;
                        i7++;
                        break;
                    case 45:
                        i = indexCount2;
                        i62Var.b = typedArrayObtainStyledAttributes.getFloat(index2, i62Var.b);
                        continue;
                        i7++;
                        break;
                    case 46:
                        i = indexCount2;
                        i62Var.c = typedArrayObtainStyledAttributes.getFloat(index2, i62Var.c);
                        continue;
                        i7++;
                        break;
                    case 47:
                        i = indexCount2;
                        i62Var.d = typedArrayObtainStyledAttributes.getFloat(index2, i62Var.d);
                        continue;
                        i7++;
                        break;
                    case 48:
                        i = indexCount2;
                        i62Var.e = typedArrayObtainStyledAttributes.getFloat(index2, i62Var.e);
                        continue;
                        i7++;
                        break;
                    case 49:
                        i = indexCount2;
                        i62Var.f = typedArrayObtainStyledAttributes.getDimension(index2, i62Var.f);
                        continue;
                        i7++;
                        break;
                    case 50:
                        i = indexCount2;
                        i62Var.g = typedArrayObtainStyledAttributes.getDimension(index2, i62Var.g);
                        continue;
                        i7++;
                        break;
                    case 51:
                        i = indexCount2;
                        i62Var.i = typedArrayObtainStyledAttributes.getDimension(index2, i62Var.i);
                        continue;
                        i7++;
                        break;
                    case 52:
                        i = indexCount2;
                        i62Var.j = typedArrayObtainStyledAttributes.getDimension(index2, i62Var.j);
                        continue;
                        i7++;
                        break;
                    case 53:
                        i = indexCount2;
                        i62Var.k = typedArrayObtainStyledAttributes.getDimension(index2, i62Var.k);
                        continue;
                        i7++;
                        break;
                    case 54:
                        i = indexCount2;
                        f62Var.X = typedArrayObtainStyledAttributes.getInt(index2, f62Var.X);
                        continue;
                        i7++;
                        break;
                    case 55:
                        i = indexCount2;
                        f62Var.Y = typedArrayObtainStyledAttributes.getInt(index2, f62Var.Y);
                        continue;
                        i7++;
                        break;
                    case 56:
                        i = indexCount2;
                        f62Var.Z = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.Z);
                        continue;
                        i7++;
                        break;
                    case 57:
                        i = indexCount2;
                        f62Var.a0 = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.a0);
                        continue;
                        i7++;
                        break;
                    case 58:
                        i = indexCount2;
                        f62Var.b0 = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.b0);
                        continue;
                        i7++;
                        break;
                    case 59:
                        i = indexCount2;
                        f62Var.c0 = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.c0);
                        continue;
                        i7++;
                        break;
                    case PanasonicMakernoteDirectory.TAG_PROGRAM_ISO /* 60 */:
                        i = indexCount2;
                        i62Var.a = typedArrayObtainStyledAttributes.getFloat(index2, i62Var.a);
                        continue;
                        i7++;
                        break;
                    case 61:
                        i = indexCount2;
                        f62Var.z = f(typedArrayObtainStyledAttributes, index2, f62Var.z);
                        continue;
                        i7++;
                        break;
                    case 62:
                        i = indexCount2;
                        f62Var.A = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.A);
                        continue;
                        i7++;
                        break;
                    case 63:
                        i = indexCount2;
                        f62Var.B = typedArrayObtainStyledAttributes.getFloat(index2, f62Var.B);
                        continue;
                        i7++;
                        break;
                    case 64:
                        i = indexCount2;
                        g62Var.a = f(typedArrayObtainStyledAttributes, index2, g62Var.a);
                        continue;
                        i7++;
                        break;
                    case 65:
                        i = indexCount2;
                        if (typedArrayObtainStyledAttributes.peekValue(index2).type == 3) {
                            typedArrayObtainStyledAttributes.getString(index2);
                        } else {
                            String str = strArr[typedArrayObtainStyledAttributes.getInteger(index2, 0)];
                            i7++;
                        }
                        break;
                    case 66:
                        i = indexCount2;
                        typedArrayObtainStyledAttributes.getInt(index2, 0);
                        continue;
                        i7++;
                        break;
                    case 67:
                        i = indexCount2;
                        g62Var.e = typedArrayObtainStyledAttributes.getFloat(index2, g62Var.e);
                        break;
                    case 68:
                        i = indexCount2;
                        h62Var.d = typedArrayObtainStyledAttributes.getFloat(index2, h62Var.d);
                        break;
                    case PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS /* 69 */:
                        i = indexCount2;
                        f62Var.d0 = typedArrayObtainStyledAttributes.getFloat(index2, 1.0f);
                        break;
                    case 70:
                        i = indexCount2;
                        f62Var.e0 = typedArrayObtainStyledAttributes.getFloat(index2, 1.0f);
                        break;
                    case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
                        i = indexCount2;
                        Log.e("ConstraintSet", "CURRENTLY UNSUPPORTED");
                        break;
                    case 72:
                        i = indexCount2;
                        f62Var.f0 = typedArrayObtainStyledAttributes.getInt(index2, f62Var.f0);
                        break;
                    case 73:
                        i = indexCount2;
                        f62Var.g0 = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.g0);
                        break;
                    case 74:
                        i = indexCount2;
                        f62Var.j0 = typedArrayObtainStyledAttributes.getString(index2);
                        break;
                    case 75:
                        i = indexCount2;
                        f62Var.n0 = typedArrayObtainStyledAttributes.getBoolean(index2, f62Var.n0);
                        break;
                    case 76:
                        i = indexCount2;
                        g62Var.c = typedArrayObtainStyledAttributes.getInt(index2, g62Var.c);
                        break;
                    case PanasonicMakernoteDirectory.TAG_AF_POINT_POSITION /* 77 */:
                        i = indexCount2;
                        f62Var.k0 = typedArrayObtainStyledAttributes.getString(index2);
                        break;
                    case 78:
                        i = indexCount2;
                        h62Var.b = typedArrayObtainStyledAttributes.getInt(index2, h62Var.b);
                        break;
                    case 79:
                        i = indexCount2;
                        g62Var.d = typedArrayObtainStyledAttributes.getFloat(index2, g62Var.d);
                        break;
                    case 80:
                        i = indexCount2;
                        f62Var.l0 = typedArrayObtainStyledAttributes.getBoolean(index2, f62Var.l0);
                        break;
                    case PanasonicMakernoteDirectory.TAG_LENS_TYPE /* 81 */:
                        i = indexCount2;
                        f62Var.m0 = typedArrayObtainStyledAttributes.getBoolean(index2, f62Var.m0);
                        break;
                    case 82:
                        i = indexCount2;
                        g62Var.b = typedArrayObtainStyledAttributes.getInteger(index2, g62Var.b);
                        break;
                    case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
                        i = indexCount2;
                        i62Var.h = f(typedArrayObtainStyledAttributes, index2, i62Var.h);
                        break;
                    case 84:
                        i = indexCount2;
                        g62Var.g = typedArrayObtainStyledAttributes.getInteger(index2, g62Var.g);
                        break;
                    case 85:
                        i = indexCount2;
                        g62Var.f = typedArrayObtainStyledAttributes.getFloat(index2, g62Var.f);
                        break;
                    case 86:
                        i = indexCount2;
                        int i9 = typedArrayObtainStyledAttributes.peekValue(index2).type;
                        if (i9 == 1) {
                            g62Var.i = typedArrayObtainStyledAttributes.getResourceId(index2, -1);
                        } else if (i9 == 3) {
                            String string2 = typedArrayObtainStyledAttributes.getString(index2);
                            g62Var.h = string2;
                            if (string2.indexOf("/") > 0) {
                                g62Var.i = typedArrayObtainStyledAttributes.getResourceId(index2, -1);
                            }
                        } else {
                            typedArrayObtainStyledAttributes.getInteger(index2, g62Var.i);
                        }
                        break;
                    case 87:
                        i = indexCount2;
                        Log.w("ConstraintSet", "unused attribute 0x" + Integer.toHexString(index2) + "   " + sparseIntArray.get(index2));
                        break;
                    case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
                    case PanasonicMakernoteDirectory.TAG_TRANSFORM /* 89 */:
                    case ReconyxHyperFire2MakernoteDirectory.TAG_FLASH /* 90 */:
                    default:
                        StringBuilder sb2 = new StringBuilder("Unknown attribute 0x");
                        i = indexCount2;
                        sb2.append(Integer.toHexString(index2));
                        sb2.append("   ");
                        sb2.append(sparseIntArray.get(index2));
                        Log.w("ConstraintSet", sb2.toString());
                        break;
                    case 91:
                        i = indexCount2;
                        f62Var.q = f(typedArrayObtainStyledAttributes, index2, f62Var.q);
                        break;
                    case 92:
                        i = indexCount2;
                        f62Var.r = f(typedArrayObtainStyledAttributes, index2, f62Var.r);
                        break;
                    case 93:
                        i = indexCount2;
                        f62Var.L = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.L);
                        break;
                    case 94:
                        i = indexCount2;
                        f62Var.S = typedArrayObtainStyledAttributes.getDimensionPixelSize(index2, f62Var.S);
                        break;
                    case 95:
                        i = indexCount2;
                        g(f62Var, typedArrayObtainStyledAttributes, index2, 0);
                        continue;
                        i7++;
                        break;
                    case 96:
                        i = indexCount2;
                        g(f62Var, typedArrayObtainStyledAttributes, index2, 1);
                        break;
                    case PanasonicMakernoteDirectory.TAG_FACE_RECOGNITION_INFO /* 97 */:
                        i = indexCount2;
                        f62Var.o0 = typedArrayObtainStyledAttributes.getInt(index2, f62Var.o0);
                        break;
                }
                i7++;
            }
            if (f62Var.j0 != null) {
                f62Var.i0 = null;
            }
        }
        typedArrayObtainStyledAttributes.recycle();
        return e62Var;
    }

    public static int f(TypedArray typedArray, int i, int i2) {
        int resourceId = typedArray.getResourceId(i, i2);
        return resourceId == -1 ? typedArray.getInt(i, -1) : resourceId;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0040  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void g(java.lang.Object r7, android.content.res.TypedArray r8, int r9, int r10) {
        /*
            Method dump skipped, instruction units count: 366
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.j62.g(java.lang.Object, android.content.res.TypedArray, int, int):void");
    }

    public static void h(t52 t52Var, String str) {
        if (str != null) {
            int length = str.length();
            int iIndexOf = str.indexOf(44);
            int i = -1;
            if (iIndexOf > 0 && iIndexOf < length - 1) {
                String strSubstring = str.substring(0, iIndexOf);
                i = strSubstring.equalsIgnoreCase("W") ? 0 : strSubstring.equalsIgnoreCase("H") ? 1 : -1;
                i = iIndexOf + 1;
            }
            int iIndexOf2 = str.indexOf(58);
            try {
                if (iIndexOf2 < 0 || iIndexOf2 >= length - 1) {
                    String strSubstring2 = str.substring(i);
                    if (strSubstring2.length() > 0) {
                        Float.parseFloat(strSubstring2);
                    }
                } else {
                    String strSubstring3 = str.substring(i, iIndexOf2);
                    String strSubstring4 = str.substring(iIndexOf2 + 1);
                    if (strSubstring3.length() > 0 && strSubstring4.length() > 0) {
                        float f = Float.parseFloat(strSubstring3);
                        float f2 = Float.parseFloat(strSubstring4);
                        if (f > 0.0f && f2 > 0.0f) {
                            if (i == 1) {
                                Math.abs(f2 / f);
                            } else {
                                Math.abs(f / f2);
                            }
                        }
                    }
                }
            } catch (NumberFormatException unused) {
            }
        }
        t52Var.G = str;
    }

    public final void a(ConstraintLayout constraintLayout) {
        HashSet hashSet;
        int i;
        HashMap map;
        String resourceEntryName;
        int childCount = constraintLayout.getChildCount();
        HashMap map2 = this.b;
        HashSet<Integer> hashSet2 = new HashSet(map2.keySet());
        int i2 = 0;
        while (i2 < childCount) {
            View childAt = constraintLayout.getChildAt(i2);
            int id = childAt.getId();
            if (!map2.containsKey(Integer.valueOf(id))) {
                StringBuilder sb = new StringBuilder("id unknown ");
                try {
                    resourceEntryName = childAt.getContext().getResources().getResourceEntryName(childAt.getId());
                } catch (Exception unused) {
                    resourceEntryName = "UNKNOWN";
                }
                sb.append(resourceEntryName);
                Log.w("ConstraintSet", sb.toString());
            } else {
                if (id == -1) {
                    ygf.i("All children of ConstraintLayout must have ids to use ConstraintSet");
                    return;
                }
                if (id != -1) {
                    if (map2.containsKey(Integer.valueOf(id))) {
                        hashSet2.remove(Integer.valueOf(id));
                        e62 e62Var = (e62) map2.get(Integer.valueOf(id));
                        if (e62Var != null) {
                            h62 h62Var = e62Var.b;
                            f62 f62Var = e62Var.d;
                            i62 i62Var = e62Var.e;
                            if (childAt instanceof an0) {
                                f62Var.h0 = 1;
                                an0 an0Var = (an0) childAt;
                                an0Var.setId(id);
                                an0Var.setType(f62Var.f0);
                                an0Var.setMargin(f62Var.g0);
                                an0Var.setAllowsGoneWidget(f62Var.n0);
                                int[] iArr = f62Var.i0;
                                if (iArr != null) {
                                    an0Var.setReferencedIds(iArr);
                                } else {
                                    String str = f62Var.j0;
                                    if (str != null) {
                                        int[] iArrC = c(an0Var, str);
                                        f62Var.i0 = iArrC;
                                        an0Var.setReferencedIds(iArrC);
                                    }
                                }
                            }
                            t52 t52Var = (t52) childAt.getLayoutParams();
                            t52Var.a();
                            e62Var.a(t52Var);
                            HashMap map3 = e62Var.f;
                            Class<?> cls = childAt.getClass();
                            for (String str2 : map3.keySet()) {
                                n52 n52Var = (n52) map3.get(str2);
                                HashSet hashSet3 = hashSet2;
                                String strR = !n52Var.a ? ka1.r("set", str2) : str2;
                                int i3 = i2;
                                try {
                                    int iOrdinal = n52Var.b.ordinal();
                                    Class<?> cls2 = Float.TYPE;
                                    Class<?> cls3 = Integer.TYPE;
                                    switch (iOrdinal) {
                                        case 0:
                                            map = map3;
                                            cls.getMethod(strR, cls3).invoke(childAt, Integer.valueOf(n52Var.c));
                                            break;
                                        case 1:
                                            map = map3;
                                            cls.getMethod(strR, cls2).invoke(childAt, Float.valueOf(n52Var.d));
                                            break;
                                        case 2:
                                            map = map3;
                                            cls.getMethod(strR, cls3).invoke(childAt, Integer.valueOf(n52Var.g));
                                            break;
                                        case 3:
                                            map = map3;
                                            Method method = cls.getMethod(strR, Drawable.class);
                                            ColorDrawable colorDrawable = new ColorDrawable();
                                            colorDrawable.setColor(n52Var.g);
                                            method.invoke(childAt, colorDrawable);
                                            break;
                                        case 4:
                                            map = map3;
                                            cls.getMethod(strR, CharSequence.class).invoke(childAt, n52Var.e);
                                            break;
                                        case 5:
                                            map = map3;
                                            cls.getMethod(strR, Boolean.TYPE).invoke(childAt, Boolean.valueOf(n52Var.f));
                                            break;
                                        case 6:
                                            map = map3;
                                            cls.getMethod(strR, cls2).invoke(childAt, Float.valueOf(n52Var.d));
                                            break;
                                        case 7:
                                            map = map3;
                                            try {
                                                cls.getMethod(strR, cls3).invoke(childAt, Integer.valueOf(n52Var.c));
                                            } catch (IllegalAccessException e2) {
                                                e = e2;
                                                StringBuilder sbU = lv8.u(" Custom Attribute \"", str2, "\" not found on ");
                                                sbU.append(cls.getName());
                                                Log.e("TransitionLayout", sbU.toString(), e);
                                            } catch (NoSuchMethodException e3) {
                                                e = e3;
                                                Log.e("TransitionLayout", cls.getName() + " must have a method " + strR, e);
                                            } catch (InvocationTargetException e4) {
                                                e = e4;
                                                StringBuilder sbU2 = lv8.u(" Custom Attribute \"", str2, "\" not found on ");
                                                sbU2.append(cls.getName());
                                                Log.e("TransitionLayout", sbU2.toString(), e);
                                            }
                                            break;
                                        default:
                                            map = map3;
                                            break;
                                    }
                                } catch (IllegalAccessException e5) {
                                    e = e5;
                                    map = map3;
                                } catch (NoSuchMethodException e6) {
                                    e = e6;
                                    map = map3;
                                } catch (InvocationTargetException e7) {
                                    e = e7;
                                    map = map3;
                                }
                                hashSet2 = hashSet3;
                                i2 = i3;
                                map3 = map;
                            }
                            hashSet = hashSet2;
                            i = i2;
                            childAt.setLayoutParams(t52Var);
                            if (h62Var.b == 0) {
                                childAt.setVisibility(h62Var.a);
                            }
                            childAt.setAlpha(h62Var.c);
                            childAt.setRotation(i62Var.a);
                            childAt.setRotationX(i62Var.b);
                            childAt.setRotationY(i62Var.c);
                            childAt.setScaleX(i62Var.d);
                            childAt.setScaleY(i62Var.e);
                            if (i62Var.h != -1) {
                                if (((View) childAt.getParent()).findViewById(i62Var.h) != null) {
                                    float bottom = (r0.getBottom() + r0.getTop()) / 2.0f;
                                    float right = (r0.getRight() + r0.getLeft()) / 2.0f;
                                    if (childAt.getRight() - childAt.getLeft() > 0 && childAt.getBottom() - childAt.getTop() > 0) {
                                        childAt.setPivotX(right - childAt.getLeft());
                                        childAt.setPivotY(bottom - childAt.getTop());
                                    }
                                }
                            } else {
                                if (!Float.isNaN(i62Var.f)) {
                                    childAt.setPivotX(i62Var.f);
                                }
                                if (!Float.isNaN(i62Var.g)) {
                                    childAt.setPivotY(i62Var.g);
                                }
                            }
                            childAt.setTranslationX(i62Var.i);
                            childAt.setTranslationY(i62Var.j);
                            childAt.setTranslationZ(i62Var.k);
                            if (i62Var.l) {
                                childAt.setElevation(i62Var.m);
                            }
                        }
                    } else {
                        hashSet = hashSet2;
                        i = i2;
                        Log.v("ConstraintSet", "WARNING NO CONSTRAINTS for view " + id);
                    }
                }
                i2 = i + 1;
                hashSet2 = hashSet;
            }
            hashSet = hashSet2;
            i = i2;
            i2 = i + 1;
            hashSet2 = hashSet;
        }
        for (Integer num : hashSet2) {
            e62 e62Var2 = (e62) map2.get(num);
            if (e62Var2 != null) {
                f62 f62Var2 = e62Var2.d;
                if (f62Var2.h0 == 1) {
                    an0 an0Var2 = new an0(constraintLayout.getContext());
                    an0Var2.setVisibility(8);
                    an0Var2.setId(num.intValue());
                    int[] iArr2 = f62Var2.i0;
                    if (iArr2 != null) {
                        an0Var2.setReferencedIds(iArr2);
                    } else {
                        String str3 = f62Var2.j0;
                        if (str3 != null) {
                            int[] iArrC2 = c(an0Var2, str3);
                            f62Var2.i0 = iArrC2;
                            an0Var2.setReferencedIds(iArrC2);
                        }
                    }
                    an0Var2.setType(f62Var2.f0);
                    an0Var2.setMargin(f62Var2.g0);
                    t52 t52VarA = ConstraintLayout.a();
                    an0Var2.j();
                    e62Var2.a(t52VarA);
                    constraintLayout.addView(an0Var2, t52VarA);
                }
                if (f62Var2.a) {
                    View rh5Var = new rh5(constraintLayout.getContext());
                    rh5Var.setId(num.intValue());
                    t52 t52VarA2 = ConstraintLayout.a();
                    e62Var2.a(t52VarA2);
                    constraintLayout.addView(rh5Var, t52VarA2);
                }
            }
        }
        for (int i4 = 0; i4 < childCount; i4++) {
            View childAt2 = constraintLayout.getChildAt(i4);
            if (childAt2 instanceof p52) {
                ((p52) childAt2).e(constraintLayout);
            }
        }
    }

    public final void b(ConstraintLayout constraintLayout) {
        int i;
        HashMap map;
        int i2;
        j62 j62Var = this;
        int childCount = constraintLayout.getChildCount();
        HashMap map2 = j62Var.b;
        map2.clear();
        int i3 = 0;
        while (i3 < childCount) {
            View childAt = constraintLayout.getChildAt(i3);
            t52 t52Var = (t52) childAt.getLayoutParams();
            int id = childAt.getId();
            if (id == -1) {
                ygf.i("All children of ConstraintLayout must have ids to use ConstraintSet");
                return;
            }
            if (!map2.containsKey(Integer.valueOf(id))) {
                map2.put(Integer.valueOf(id), new e62());
            }
            e62 e62Var = (e62) map2.get(Integer.valueOf(id));
            if (e62Var == null) {
                i = childCount;
                map = map2;
                i2 = i3;
            } else {
                h62 h62Var = e62Var.b;
                f62 f62Var = e62Var.d;
                i62 i62Var = e62Var.e;
                i = childCount;
                HashMap map3 = new HashMap();
                map = map2;
                Class<?> cls = childAt.getClass();
                i2 = i3;
                HashMap map4 = j62Var.a;
                for (String str : map4.keySet()) {
                    n52 n52Var = (n52) map4.get(str);
                    HashMap map5 = map4;
                    try {
                        if (str.equals("BackgroundColor")) {
                            map3.put(str, new n52(n52Var, Integer.valueOf(((ColorDrawable) childAt.getBackground()).getColor())));
                        } else {
                            map3.put(str, new n52(n52Var, cls.getMethod("getMap" + str, null).invoke(childAt, null)));
                        }
                    } catch (IllegalAccessException e2) {
                        StringBuilder sbU = lv8.u(" Custom Attribute \"", str, "\" not found on ");
                        sbU.append(cls.getName());
                        Log.e("TransitionLayout", sbU.toString(), e2);
                    } catch (NoSuchMethodException e3) {
                        Log.e("TransitionLayout", cls.getName() + " must have a method " + str, e3);
                    } catch (InvocationTargetException e4) {
                        StringBuilder sbU2 = lv8.u(" Custom Attribute \"", str, "\" not found on ");
                        sbU2.append(cls.getName());
                        Log.e("TransitionLayout", sbU2.toString(), e4);
                    }
                    map4 = map5;
                }
                e62Var.f = map3;
                e62Var.a = id;
                f62Var.h = t52Var.e;
                f62Var.i = t52Var.f;
                f62Var.j = t52Var.g;
                f62Var.k = t52Var.h;
                f62Var.l = t52Var.i;
                f62Var.m = t52Var.j;
                f62Var.n = t52Var.k;
                f62Var.o = t52Var.l;
                f62Var.p = t52Var.m;
                f62Var.q = t52Var.n;
                f62Var.r = t52Var.o;
                f62Var.s = t52Var.s;
                f62Var.t = t52Var.t;
                f62Var.u = t52Var.u;
                f62Var.v = t52Var.v;
                f62Var.w = t52Var.E;
                f62Var.x = t52Var.F;
                f62Var.y = t52Var.G;
                f62Var.z = t52Var.p;
                f62Var.A = t52Var.q;
                f62Var.B = t52Var.r;
                f62Var.C = t52Var.T;
                f62Var.D = t52Var.U;
                f62Var.E = t52Var.V;
                f62Var.f = t52Var.c;
                f62Var.d = t52Var.a;
                f62Var.e = t52Var.b;
                f62Var.b = ((ViewGroup.MarginLayoutParams) t52Var).width;
                f62Var.c = ((ViewGroup.MarginLayoutParams) t52Var).height;
                f62Var.F = ((ViewGroup.MarginLayoutParams) t52Var).leftMargin;
                f62Var.G = ((ViewGroup.MarginLayoutParams) t52Var).rightMargin;
                f62Var.H = ((ViewGroup.MarginLayoutParams) t52Var).topMargin;
                f62Var.I = ((ViewGroup.MarginLayoutParams) t52Var).bottomMargin;
                f62Var.L = t52Var.D;
                f62Var.T = t52Var.I;
                f62Var.U = t52Var.H;
                f62Var.W = t52Var.K;
                f62Var.V = t52Var.J;
                f62Var.l0 = t52Var.W;
                f62Var.m0 = t52Var.X;
                f62Var.X = t52Var.L;
                f62Var.Y = t52Var.M;
                f62Var.Z = t52Var.P;
                f62Var.a0 = t52Var.Q;
                f62Var.b0 = t52Var.N;
                f62Var.c0 = t52Var.O;
                f62Var.d0 = t52Var.R;
                f62Var.e0 = t52Var.S;
                f62Var.k0 = t52Var.Y;
                f62Var.N = t52Var.x;
                f62Var.P = t52Var.z;
                f62Var.M = t52Var.w;
                f62Var.O = t52Var.y;
                f62Var.R = t52Var.A;
                f62Var.Q = t52Var.B;
                f62Var.S = t52Var.C;
                f62Var.o0 = t52Var.Z;
                f62Var.J = t52Var.getMarginEnd();
                f62Var.K = t52Var.getMarginStart();
                h62Var.a = childAt.getVisibility();
                h62Var.c = childAt.getAlpha();
                i62Var.a = childAt.getRotation();
                i62Var.b = childAt.getRotationX();
                i62Var.c = childAt.getRotationY();
                i62Var.d = childAt.getScaleX();
                i62Var.e = childAt.getScaleY();
                float pivotX = childAt.getPivotX();
                float pivotY = childAt.getPivotY();
                if (pivotX != 0.0d || pivotY != 0.0d) {
                    i62Var.f = pivotX;
                    i62Var.g = pivotY;
                }
                i62Var.i = childAt.getTranslationX();
                i62Var.j = childAt.getTranslationY();
                i62Var.k = childAt.getTranslationZ();
                if (i62Var.l) {
                    i62Var.m = childAt.getElevation();
                }
                if (childAt instanceof an0) {
                    an0 an0Var = (an0) childAt;
                    f62Var.n0 = an0Var.getAllowsGoneWidget();
                    f62Var.i0 = an0Var.getReferencedIds();
                    f62Var.f0 = an0Var.getType();
                    f62Var.g0 = an0Var.getMargin();
                }
            }
            i3 = i2 + 1;
            j62Var = this;
            childCount = i;
            map2 = map;
        }
    }

    public final void e(Context context, int i) {
        XmlResourceParser xml = context.getResources().getXml(i);
        try {
            for (int eventType = xml.getEventType(); eventType != 1; eventType = xml.next()) {
                if (eventType == 2) {
                    String name = xml.getName();
                    e62 e62VarD = d(context, Xml.asAttributeSet(xml), false);
                    if (name.equalsIgnoreCase("Guideline")) {
                        e62VarD.d.a = true;
                    }
                    this.b.put(Integer.valueOf(e62VarD.a), e62VarD);
                }
            }
        } catch (IOException e2) {
            Log.e("ConstraintSet", "Error parsing resource: " + i, e2);
        } catch (XmlPullParserException e3) {
            Log.e("ConstraintSet", "Error parsing resource: " + i, e3);
        }
    }
}
