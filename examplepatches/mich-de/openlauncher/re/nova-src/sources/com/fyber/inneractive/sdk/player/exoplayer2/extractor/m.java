package com.fyber.inneractive.sdk.player.exoplayer2.extractor;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class m {

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f29368c = Pattern.compile("^ [0-9a-fA-F]{8} ([0-9a-fA-F]{8}) ([0-9a-fA-F]{8})");

    /* renamed from: a, reason: collision with root package name */
    public int f29369a = -1;

    /* renamed from: b, reason: collision with root package name */
    public int f29370b = -1;

    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.metadata.b bVar) throws NumberFormatException {
        int i5 = 0;
        while (true) {
            com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.o[] oVarArr = bVar.f30087a;
            if (i5 >= oVarArr.length) {
                return;
            }
            com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.o oVar = oVarArr[i5];
            if (oVar instanceof com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.j) {
                com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.j jVar = (com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.j) oVar;
                String str = jVar.f30105c;
                String str2 = jVar.f30106d;
                if ("iTunSMPB".equals(str)) {
                    Matcher matcher = f29368c.matcher(str2);
                    if (matcher.find()) {
                        try {
                            int i11 = Integer.parseInt(matcher.group(1), 16);
                            int i12 = Integer.parseInt(matcher.group(2), 16);
                            if (i11 > 0 || i12 > 0) {
                                this.f29369a = i11;
                                this.f29370b = i12;
                                return;
                            }
                        } catch (NumberFormatException unused) {
                            continue;
                        }
                    } else {
                        continue;
                    }
                } else {
                    continue;
                }
            }
            i5++;
        }
    }
}
