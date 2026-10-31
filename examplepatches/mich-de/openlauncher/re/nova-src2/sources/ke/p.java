package ke;

import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.exoplayer2.metadata.id3.CommentFrame;
import com.google.android.exoplayer2.metadata.id3.InternalFrame;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class p {

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f71423c = Pattern.compile("^ [0-9a-fA-F]{8} ([0-9a-fA-F]{8}) ([0-9a-fA-F]{8})");

    /* renamed from: a, reason: collision with root package name */
    public int f71424a = -1;

    /* renamed from: b, reason: collision with root package name */
    public int f71425b = -1;

    public final boolean a(String str) throws NumberFormatException {
        Matcher matcher = f71423c.matcher(str);
        if (!matcher.find()) {
            return false;
        }
        try {
            String strGroup = matcher.group(1);
            int i5 = wf.v.f94376a;
            int i11 = Integer.parseInt(strGroup, 16);
            int i12 = Integer.parseInt(matcher.group(2), 16);
            if (i11 <= 0 && i12 <= 0) {
                return false;
            }
            this.f71424a = i11;
            this.f71425b = i12;
            return true;
        } catch (NumberFormatException unused) {
            return false;
        }
    }

    public final void b(Metadata metadata) {
        int i5 = 0;
        while (true) {
            Metadata.Entry[] entryArr = metadata.f31467a;
            if (i5 >= entryArr.length) {
                return;
            }
            Metadata.Entry entry = entryArr[i5];
            if (entry instanceof CommentFrame) {
                CommentFrame commentFrame = (CommentFrame) entry;
                if ("iTunSMPB".equals(commentFrame.f31523c) && a(commentFrame.f31524d)) {
                    return;
                }
            } else if (entry instanceof InternalFrame) {
                InternalFrame internalFrame = (InternalFrame) entry;
                if ("com.apple.iTunes".equals(internalFrame.f31530b) && "iTunSMPB".equals(internalFrame.f31531c) && a(internalFrame.f31532d)) {
                    return;
                }
            } else {
                continue;
            }
            i5++;
        }
    }
}
