package gen.model;

import com.squareup.wire.EnumAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.wg6;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000*\u0001\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001J\u0012\u0010\u0003\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u0004\u001a\u00020\u0005H\u0014¨\u0006\u0006"}, d2 = {"gen/model/SequencePostLabelMode$Companion$ADAPTER$1", "Lcom/squareup/wire/EnumAdapter;", "Lgen/model/SequencePostLabelMode;", "fromValue", "value", "", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SequencePostLabelMode$Companion$ADAPTER$1 extends EnumAdapter<SequencePostLabelMode> {
    public SequencePostLabelMode$Companion$ADAPTER$1(wg6 wg6Var, Syntax syntax, SequencePostLabelMode sequencePostLabelMode) {
        super(wg6Var, syntax, sequencePostLabelMode);
    }

    @Override // com.squareup.wire.EnumAdapter
    public final WireEnum fromValue(int i) {
        SequencePostLabelMode.Companion.getClass();
        if (i == 0) {
            return SequencePostLabelMode.LABEL_SEQUENTIALLY;
        }
        if (i != 1) {
            return null;
        }
        return SequencePostLabelMode.LABEL_BY_DATE;
    }

    @Override // com.squareup.wire.EnumAdapter
    public final SequencePostLabelMode fromValue(int value) {
        SequencePostLabelMode.Companion.getClass();
        if (value == 0) {
            return SequencePostLabelMode.LABEL_SEQUENTIALLY;
        }
        if (value != 1) {
            return null;
        }
        return SequencePostLabelMode.LABEL_BY_DATE;
    }
}
