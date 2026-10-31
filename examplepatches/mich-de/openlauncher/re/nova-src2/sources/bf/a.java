package bf;

import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.exoplayer2.metadata.icy.IcyInfo;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CharsetDecoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import p6.u;
import vk.b0;
import vk.e;
import xe.c;

/* loaded from: classes3.dex */
public final class a extends u {

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f17858c = Pattern.compile("(.+?)='(.*?)';", 32);

    /* renamed from: a, reason: collision with root package name */
    public final CharsetDecoder f17859a = e.f92809c.newDecoder();

    /* renamed from: b, reason: collision with root package name */
    public final CharsetDecoder f17860b = e.f92808b.newDecoder();

    @Override // p6.u
    public final Metadata m(c cVar, ByteBuffer byteBuffer) {
        String string;
        CharsetDecoder charsetDecoder = this.f17860b;
        CharsetDecoder charsetDecoder2 = this.f17859a;
        String str = null;
        try {
            string = charsetDecoder2.decode(byteBuffer).toString();
        } catch (CharacterCodingException unused) {
            try {
                String string2 = charsetDecoder.decode(byteBuffer).toString();
                charsetDecoder.reset();
                byteBuffer.rewind();
                string = string2;
            } catch (CharacterCodingException unused2) {
                charsetDecoder.reset();
                byteBuffer.rewind();
                string = null;
            } catch (Throwable th2) {
                charsetDecoder.reset();
                byteBuffer.rewind();
                throw th2;
            }
        } finally {
            charsetDecoder2.reset();
            byteBuffer.rewind();
        }
        byte[] bArr = new byte[byteBuffer.limit()];
        byteBuffer.get(bArr);
        if (string == null) {
            return new Metadata(new IcyInfo(null, null, bArr));
        }
        Matcher matcher = f17858c.matcher(string);
        String str2 = null;
        for (int iEnd = 0; matcher.find(iEnd); iEnd = matcher.end()) {
            String strGroup = matcher.group(1);
            String strGroup2 = matcher.group(2);
            if (strGroup != null) {
                String strS = b0.s(strGroup);
                strS.getClass();
                if (strS.equals("streamurl")) {
                    str2 = strGroup2;
                } else if (strS.equals("streamtitle")) {
                    str = strGroup2;
                }
            }
        }
        return new Metadata(new IcyInfo(str, str2, bArr));
    }
}
