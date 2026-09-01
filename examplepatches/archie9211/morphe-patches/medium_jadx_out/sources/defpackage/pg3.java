package defpackage;

import com.squareup.wire.Message;
import gen.model.DismissOption;
import gen.model.SignalReason;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class pg3 extends Message.Builder {
    public SignalReason a;
    public String b;
    public List c;

    @Override // com.squareup.wire.Message.Builder
    public final Message build() {
        return new DismissOption(this.a, this.b, this.c, buildUnknownFields());
    }
}
