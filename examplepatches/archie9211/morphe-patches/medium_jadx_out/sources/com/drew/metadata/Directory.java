package com.drew.metadata;

import com.drew.lang.Rational;
import defpackage.ev6;
import defpackage.z72;
import j$.util.DesugarCollections;
import j$.util.DesugarTimeZone;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class Directory {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final String _floatFormatPattern = "0.###";
    protected TagDescriptor<?> _descriptor;
    private Directory _parent;
    protected final Map<Integer, Object> _tagMap = new HashMap();
    protected final Collection<Tag> _definedTagList = new ArrayList();
    private final Collection<String> _errorList = new ArrayList(4);

    public final void addError(String str) {
        this._errorList.add(str);
    }

    public final boolean containsTag(int i) {
        return this._tagMap.containsKey(Integer.valueOf(i));
    }

    public final boolean getBoolean(int i) throws MetadataException {
        Boolean booleanObject = getBooleanObject(i);
        if (booleanObject != null) {
            return booleanObject.booleanValue();
        }
        Object object = getObject(i);
        if (object != null) {
            StringBuilder sbC = ev6.C("Tag '", i, "' cannot be converted to a boolean.  It is of type '");
            sbC.append(object.getClass());
            sbC.append("'.");
            throw new MetadataException(sbC.toString(), null);
        }
        throw new MetadataException("Tag '" + getTagName(i) + "' has not been set -- check using containsTag() first", null);
    }

    public final Boolean getBooleanObject(int i) {
        Object object = getObject(i);
        if (object == null) {
            return null;
        }
        if (object instanceof Boolean) {
            return (Boolean) object;
        }
        if ((object instanceof String) || (object instanceof StringValue)) {
            try {
                return Boolean.valueOf(Boolean.getBoolean(object.toString()));
            } catch (NumberFormatException unused) {
                return null;
            }
        }
        if (object instanceof Number) {
            return Boolean.valueOf(((Number) object).doubleValue() != 0.0d);
        }
        return null;
    }

    public final byte[] getByteArray(int i) {
        Object object = getObject(i);
        if (object == null) {
            return null;
        }
        if (object instanceof StringValue) {
            return ((StringValue) object).getBytes();
        }
        int i2 = 0;
        if (object instanceof Rational[]) {
            int length = ((Rational[]) object).length;
            byte[] bArr = new byte[length];
            while (i2 < length) {
                bArr[i2] = (byte) r4[i2].doubleValue();
                i2++;
            }
            return bArr;
        }
        if (object instanceof byte[]) {
            return (byte[]) object;
        }
        if (object instanceof int[]) {
            int[] iArr = (int[]) object;
            byte[] bArr2 = new byte[iArr.length];
            while (i2 < iArr.length) {
                bArr2[i2] = (byte) iArr[i2];
                i2++;
            }
            return bArr2;
        }
        if (object instanceof short[]) {
            short[] sArr = (short[]) object;
            byte[] bArr3 = new byte[sArr.length];
            while (i2 < sArr.length) {
                bArr3[i2] = (byte) sArr[i2];
                i2++;
            }
            return bArr3;
        }
        if (!(object instanceof CharSequence)) {
            if (object instanceof Integer) {
                return new byte[]{((Integer) object).byteValue()};
            }
            return null;
        }
        CharSequence charSequence = (CharSequence) object;
        byte[] bArr4 = new byte[charSequence.length()];
        while (i2 < charSequence.length()) {
            bArr4[i2] = (byte) charSequence.charAt(i2);
            i2++;
        }
        return bArr4;
    }

    public final Date getDate(int i, String str, TimeZone timeZone) {
        String str2;
        TimeZone timeZone2;
        Date date;
        Object object = getObject(i);
        if (object instanceof Date) {
            return (Date) object;
        }
        if ((object instanceof String) || (object instanceof StringValue)) {
            String[] strArr = {"yyyy:MM:dd HH:mm:ss", "yyyy:MM:dd HH:mm", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy-MM-dd'T'HH:mm:ss", "yyyy-MM-dd'T'HH:mm", "yyyy-MM-dd", "yyyy-MM", "yyyyMMdd", "yyyy"};
            String string = object.toString();
            if (string.equals("0000:00:00 00:00:00")) {
                return null;
            }
            Matcher matcher = Pattern.compile("(\\d\\d:\\d\\d:\\d\\d)(\\.\\d+)").matcher(string);
            if (matcher.find()) {
                String strSubstring = matcher.group(2).substring(1);
                String strReplaceAll = matcher.replaceAll("$1");
                str2 = strSubstring;
                string = strReplaceAll;
            } else {
                str2 = str;
            }
            Matcher matcher2 = Pattern.compile("(Z|[+-]\\d\\d:\\d\\d|[+-]\\d\\d\\d\\d)$").matcher(string);
            if (matcher2.find()) {
                TimeZone timeZone3 = DesugarTimeZone.getTimeZone("GMT" + matcher2.group().replaceAll("Z", ""));
                String strReplaceAll2 = matcher2.replaceAll("");
                timeZone2 = timeZone3;
                string = strReplaceAll2;
            } else {
                timeZone2 = timeZone;
            }
            for (int i2 = 0; i2 < 12; i2++) {
                try {
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(strArr[i2]);
                    simpleDateFormat.setLenient(false);
                    if (timeZone2 != null) {
                        simpleDateFormat.setTimeZone(timeZone2);
                    } else {
                        simpleDateFormat.setTimeZone(TimeZone.getDefault());
                    }
                    date = simpleDateFormat.parse(string);
                    break;
                } catch (ParseException unused) {
                }
            }
        } else {
            str2 = str;
        }
        date = null;
        if (date == null) {
            return null;
        }
        if (str2 == null) {
            return date;
        }
        try {
            int i3 = (int) (Double.parseDouble("." + str2) * 1000.0d);
            if (i3 < 0 || i3 >= 1000) {
                return date;
            }
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.set(14, i3);
            return calendar.getTime();
        } catch (NumberFormatException unused2) {
            return date;
        }
    }

    public final String getDescription(int i) {
        return this._descriptor.getDescription(i);
    }

    public final double getDouble(int i) throws MetadataException {
        Double doubleObject = getDoubleObject(i);
        if (doubleObject != null) {
            return doubleObject.doubleValue();
        }
        Object object = getObject(i);
        if (object != null) {
            StringBuilder sbC = ev6.C("Tag '", i, "' cannot be converted to a double.  It is of type '");
            sbC.append(object.getClass());
            sbC.append("'.");
            throw new MetadataException(sbC.toString(), null);
        }
        throw new MetadataException("Tag '" + getTagName(i) + "' has not been set -- check using containsTag() first", null);
    }

    public final Double getDoubleObject(int i) {
        Object object = getObject(i);
        if (object == null) {
            return null;
        }
        if ((object instanceof String) || (object instanceof StringValue)) {
            try {
                return Double.valueOf(Double.parseDouble(object.toString()));
            } catch (NumberFormatException unused) {
                return null;
            }
        }
        if (object instanceof Number) {
            return Double.valueOf(((Number) object).doubleValue());
        }
        return null;
    }

    public final int getErrorCount() {
        return this._errorList.size();
    }

    public final Iterable<String> getErrors() {
        return DesugarCollections.unmodifiableCollection(this._errorList);
    }

    public final float getFloat(int i) throws MetadataException {
        Float floatObject = getFloatObject(i);
        if (floatObject != null) {
            return floatObject.floatValue();
        }
        Object object = getObject(i);
        if (object != null) {
            StringBuilder sbC = ev6.C("Tag '", i, "' cannot be converted to a float.  It is of type '");
            sbC.append(object.getClass());
            sbC.append("'.");
            throw new MetadataException(sbC.toString(), null);
        }
        throw new MetadataException("Tag '" + getTagName(i) + "' has not been set -- check using containsTag() first", null);
    }

    public final Float getFloatObject(int i) {
        Object object = getObject(i);
        if (object == null) {
            return null;
        }
        if ((object instanceof String) || (object instanceof StringValue)) {
            try {
                return Float.valueOf(Float.parseFloat(object.toString()));
            } catch (NumberFormatException unused) {
                return null;
            }
        }
        if (object instanceof Number) {
            return Float.valueOf(((Number) object).floatValue());
        }
        return null;
    }

    public final int getInt(int i) throws MetadataException {
        Integer integer = getInteger(i);
        if (integer != null) {
            return integer.intValue();
        }
        Object object = getObject(i);
        if (object != null) {
            StringBuilder sbC = ev6.C("Tag '", i, "' cannot be converted to int.  It is of type '");
            sbC.append(object.getClass());
            sbC.append("'.");
            throw new MetadataException(sbC.toString(), null);
        }
        throw new MetadataException("Tag '" + getTagName(i) + "' has not been set -- check using containsTag() first", null);
    }

    public final int[] getIntArray(int i) {
        Object object = getObject(i);
        if (object == null) {
            return null;
        }
        if (object instanceof int[]) {
            return (int[]) object;
        }
        int i2 = 0;
        if (object instanceof Rational[]) {
            Rational[] rationalArr = (Rational[]) object;
            int length = rationalArr.length;
            int[] iArr = new int[length];
            while (i2 < length) {
                iArr[i2] = (int) rationalArr[i2].doubleValue();
                i2++;
            }
            return iArr;
        }
        if (object instanceof short[]) {
            short[] sArr = (short[]) object;
            int[] iArr2 = new int[sArr.length];
            while (i2 < sArr.length) {
                iArr2[i2] = sArr[i2];
                i2++;
            }
            return iArr2;
        }
        if (object instanceof byte[]) {
            byte[] bArr = (byte[]) object;
            int[] iArr3 = new int[bArr.length];
            while (i2 < bArr.length) {
                iArr3[i2] = bArr[i2];
                i2++;
            }
            return iArr3;
        }
        if (!(object instanceof CharSequence)) {
            if (object instanceof Integer) {
                return new int[]{((Integer) object).intValue()};
            }
            return null;
        }
        CharSequence charSequence = (CharSequence) object;
        int[] iArr4 = new int[charSequence.length()];
        while (i2 < charSequence.length()) {
            iArr4[i2] = charSequence.charAt(i2);
            i2++;
        }
        return iArr4;
    }

    public final Integer getInteger(int i) {
        Object object = getObject(i);
        if (object == null) {
            return null;
        }
        if (object instanceof Number) {
            return Integer.valueOf(((Number) object).intValue());
        }
        if ((object instanceof String) || (object instanceof StringValue)) {
            try {
                return Integer.valueOf(Integer.parseInt(object.toString()));
            } catch (NumberFormatException unused) {
                long j = 0;
                for (byte b : object.toString().getBytes()) {
                    j = (j << 8) + ((long) (b & 255));
                }
                return Integer.valueOf((int) j);
            }
        }
        if (object instanceof Rational[]) {
            Rational[] rationalArr = (Rational[]) object;
            if (rationalArr.length == 1) {
                return Integer.valueOf((int) rationalArr[0].doubleValue());
            }
        } else if (object instanceof byte[]) {
            byte[] bArr = (byte[]) object;
            if (bArr.length == 1) {
                return Integer.valueOf(bArr[0]);
            }
        } else if (object instanceof int[]) {
            int[] iArr = (int[]) object;
            if (iArr.length == 1) {
                return Integer.valueOf(iArr[0]);
            }
        } else if (object instanceof short[]) {
            short[] sArr = (short[]) object;
            if (sArr.length == 1) {
                return Integer.valueOf(sArr[0]);
            }
        }
        return null;
    }

    public final long getLong(int i) throws MetadataException {
        Long longObject = getLongObject(i);
        if (longObject != null) {
            return longObject.longValue();
        }
        Object object = getObject(i);
        if (object != null) {
            StringBuilder sbC = ev6.C("Tag '", i, "' cannot be converted to a long.  It is of type '");
            sbC.append(object.getClass());
            sbC.append("'.");
            throw new MetadataException(sbC.toString(), null);
        }
        throw new MetadataException("Tag '" + getTagName(i) + "' has not been set -- check using containsTag() first", null);
    }

    public final Long getLongObject(int i) {
        Object object = getObject(i);
        if (object == null) {
            return null;
        }
        if (object instanceof Number) {
            return Long.valueOf(((Number) object).longValue());
        }
        if ((object instanceof String) || (object instanceof StringValue)) {
            try {
                return Long.valueOf(Long.parseLong(object.toString()));
            } catch (NumberFormatException unused) {
                long j = 0;
                for (byte b : object.toString().getBytes()) {
                    j = (j << 8) + ((long) (b & 255));
                }
                return Long.valueOf(j);
            }
        }
        if (object instanceof Rational[]) {
            Rational[] rationalArr = (Rational[]) object;
            if (rationalArr.length == 1) {
                return Long.valueOf((long) rationalArr[0].doubleValue());
            }
        } else if (object instanceof byte[]) {
            if (((byte[]) object).length == 1) {
                return Long.valueOf(r6[0]);
            }
        } else if (object instanceof int[]) {
            if (((int[]) object).length == 1) {
                return Long.valueOf(r6[0]);
            }
        } else if (object instanceof short[]) {
            if (((short[]) object).length == 1) {
                return Long.valueOf(r6[0]);
            }
        }
        return null;
    }

    public abstract String getName();

    public final Object getObject(int i) {
        return this._tagMap.get(Integer.valueOf(i));
    }

    public final Directory getParent() {
        return this._parent;
    }

    public final Rational getRational(int i) {
        Object object = getObject(i);
        if (object == null) {
            return null;
        }
        if (object instanceof Rational) {
            return (Rational) object;
        }
        if (object instanceof Integer) {
            return new Rational(((Integer) object).intValue(), 1L);
        }
        if (object instanceof Long) {
            return new Rational(((Long) object).longValue(), 1L);
        }
        return null;
    }

    public final Rational[] getRationalArray(int i) {
        Object object = getObject(i);
        if (object != null && (object instanceof Rational[])) {
            return (Rational[]) object;
        }
        return null;
    }

    public final String getString(int i) {
        Object object = getObject(i);
        if (object == null) {
            return null;
        }
        if (object instanceof Rational) {
            return ((Rational) object).toSimpleString(true);
        }
        if (!object.getClass().isArray()) {
            return object instanceof Double ? new DecimalFormat(_floatFormatPattern).format(((Double) object).doubleValue()) : object instanceof Float ? new DecimalFormat(_floatFormatPattern).format(((Float) object).floatValue()) : object.toString();
        }
        int length = Array.getLength(object);
        Class<?> componentType = object.getClass().getComponentType();
        StringBuilder sb = new StringBuilder();
        int i2 = 0;
        if (Object.class.isAssignableFrom(componentType)) {
            while (i2 < length) {
                if (i2 != 0) {
                    sb.append(' ');
                }
                sb.append(Array.get(object, i2).toString());
                i2++;
            }
        } else if (componentType.getName().equals("int")) {
            while (i2 < length) {
                if (i2 != 0) {
                    sb.append(' ');
                }
                sb.append(Array.getInt(object, i2));
                i2++;
            }
        } else if (componentType.getName().equals("short")) {
            while (i2 < length) {
                if (i2 != 0) {
                    sb.append(' ');
                }
                sb.append((int) Array.getShort(object, i2));
                i2++;
            }
        } else if (componentType.getName().equals("long")) {
            while (i2 < length) {
                if (i2 != 0) {
                    sb.append(' ');
                }
                sb.append(Array.getLong(object, i2));
                i2++;
            }
        } else if (componentType.getName().equals("float")) {
            DecimalFormat decimalFormat = new DecimalFormat(_floatFormatPattern);
            while (i2 < length) {
                if (i2 != 0) {
                    sb.append(' ');
                }
                String str = decimalFormat.format(Array.getFloat(object, i2));
                if (str.equals("-0")) {
                    str = "0";
                }
                sb.append(str);
                i2++;
            }
        } else if (componentType.getName().equals("double")) {
            DecimalFormat decimalFormat2 = new DecimalFormat(_floatFormatPattern);
            while (i2 < length) {
                if (i2 != 0) {
                    sb.append(' ');
                }
                String str2 = decimalFormat2.format(Array.getDouble(object, i2));
                if (str2.equals("-0")) {
                    str2 = "0";
                }
                sb.append(str2);
                i2++;
            }
        } else if (componentType.getName().equals("byte")) {
            while (i2 < length) {
                if (i2 != 0) {
                    sb.append(' ');
                }
                sb.append(Array.getByte(object, i2) & 255);
                i2++;
            }
        } else {
            addError("Unexpected array component type: ".concat(componentType.getName()));
        }
        return sb.toString();
    }

    public final String[] getStringArray(int i) {
        Object object = getObject(i);
        if (object == null) {
            return null;
        }
        if (object instanceof String[]) {
            return (String[]) object;
        }
        if (object instanceof String) {
            return new String[]{(String) object};
        }
        if (object instanceof StringValue) {
            return new String[]{object.toString()};
        }
        int i2 = 0;
        if (object instanceof StringValue[]) {
            StringValue[] stringValueArr = (StringValue[]) object;
            int length = stringValueArr.length;
            String[] strArr = new String[length];
            while (i2 < length) {
                strArr[i2] = stringValueArr[i2].toString();
                i2++;
            }
            return strArr;
        }
        if (object instanceof int[]) {
            int[] iArr = (int[]) object;
            int length2 = iArr.length;
            String[] strArr2 = new String[length2];
            while (i2 < length2) {
                strArr2[i2] = Integer.toString(iArr[i2]);
                i2++;
            }
            return strArr2;
        }
        if (object instanceof byte[]) {
            byte[] bArr = (byte[]) object;
            int length3 = bArr.length;
            String[] strArr3 = new String[length3];
            while (i2 < length3) {
                strArr3[i2] = Byte.toString(bArr[i2]);
                i2++;
            }
            return strArr3;
        }
        if (!(object instanceof Rational[])) {
            return null;
        }
        Rational[] rationalArr = (Rational[]) object;
        int length4 = rationalArr.length;
        String[] strArr4 = new String[length4];
        for (int i3 = 0; i3 < length4; i3++) {
            strArr4[i3] = rationalArr[i3].toSimpleString(false);
        }
        return strArr4;
    }

    public final StringValue getStringValue(int i) {
        Object object = getObject(i);
        if (object instanceof StringValue) {
            return (StringValue) object;
        }
        return null;
    }

    public final StringValue[] getStringValueArray(int i) {
        Object object = getObject(i);
        if (object == null) {
            return null;
        }
        if (object instanceof StringValue[]) {
            return (StringValue[]) object;
        }
        if (object instanceof StringValue) {
            return new StringValue[]{(StringValue) object};
        }
        return null;
    }

    public final int getTagCount() {
        return this._definedTagList.size();
    }

    public String getTagName(int i) {
        HashMap<Integer, String> tagNameMap = getTagNameMap();
        if (tagNameMap.containsKey(Integer.valueOf(i))) {
            return tagNameMap.get(Integer.valueOf(i));
        }
        String hexString = Integer.toHexString(i);
        while (hexString.length() < 4) {
            hexString = "0".concat(hexString);
        }
        return ev6.x("Unknown tag (0x", hexString, ")");
    }

    public abstract HashMap<Integer, String> getTagNameMap();

    public final Collection<Tag> getTags() {
        return DesugarCollections.unmodifiableCollection(this._definedTagList);
    }

    public final boolean hasErrors() {
        return this._errorList.size() > 0;
    }

    public boolean hasTagName(int i) {
        return getTagNameMap().containsKey(Integer.valueOf(i));
    }

    public final boolean isEmpty() {
        return this._errorList.isEmpty() && this._definedTagList.isEmpty();
    }

    public final void setBoolean(int i, boolean z) {
        setObject(i, Boolean.valueOf(z));
    }

    public void setByteArray(int i, byte[] bArr) {
        setObjectArray(i, bArr);
    }

    public final void setDate(int i, Date date) {
        setObject(i, date);
    }

    public final void setDescriptor(TagDescriptor<?> tagDescriptor) {
        if (tagDescriptor != null) {
            this._descriptor = tagDescriptor;
        } else {
            z72.c("cannot set a null descriptor");
        }
    }

    public final void setDouble(int i, double d) {
        setObject(i, Double.valueOf(d));
    }

    public final void setDoubleArray(int i, double[] dArr) {
        setObjectArray(i, dArr);
    }

    public final void setFloat(int i, float f) {
        setObject(i, Float.valueOf(f));
    }

    public final void setFloatArray(int i, float[] fArr) {
        setObjectArray(i, fArr);
    }

    public final void setInt(int i, int i2) {
        setObject(i, Integer.valueOf(i2));
    }

    public final void setIntArray(int i, int[] iArr) {
        setObjectArray(i, iArr);
    }

    public final void setLong(int i, long j) {
        setObject(i, Long.valueOf(j));
    }

    public void setObject(int i, Object obj) {
        if (obj == null) {
            z72.c("cannot set a null object");
            return;
        }
        if (!this._tagMap.containsKey(Integer.valueOf(i))) {
            this._definedTagList.add(new Tag(i, this));
        }
        this._tagMap.put(Integer.valueOf(i), obj);
    }

    public void setObjectArray(int i, Object obj) {
        setObject(i, obj);
    }

    public final void setParent(Directory directory) {
        this._parent = directory;
    }

    public final void setRational(int i, Rational rational) {
        setObject(i, rational);
    }

    public final void setRationalArray(int i, Rational[] rationalArr) {
        setObjectArray(i, rationalArr);
    }

    public final void setString(int i, String str) {
        if (str != null) {
            setObject(i, str);
        } else {
            z72.c("cannot set a null String");
        }
    }

    public final void setStringArray(int i, String[] strArr) {
        setObjectArray(i, strArr);
    }

    public final void setStringValue(int i, StringValue stringValue) {
        if (stringValue != null) {
            setObject(i, stringValue);
        } else {
            z72.c("cannot set a null StringValue");
        }
    }

    public final void setStringValueArray(int i, StringValue[] stringValueArr) {
        setObjectArray(i, stringValueArr);
    }

    public final String toString() {
        return String.format("%s Directory (%d %s)", getName(), Integer.valueOf(this._tagMap.size()), this._tagMap.size() == 1 ? "tag" : "tags");
    }

    public final Date getDate(int i, TimeZone timeZone) {
        return getDate(i, null, timeZone);
    }

    public final Date getDate(int i) {
        return getDate(i, null, null);
    }

    public final String getString(int i, String str) {
        byte[] byteArray = getByteArray(i);
        if (byteArray == null) {
            return null;
        }
        try {
            return new String(byteArray, str);
        } catch (UnsupportedEncodingException unused) {
            return null;
        }
    }
}
