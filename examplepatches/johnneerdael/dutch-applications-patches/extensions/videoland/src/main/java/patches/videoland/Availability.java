package patches.videoland;

import com.bedrockstreaming.component.layout.domain.core.model.*;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;

/** Current-payload presentation decisions; never changes wire data or account state. */
public final class Availability {
    private Availability() {}

    public static boolean keep(Object value) {
        if (!(value instanceof Item)) return true;
        try {
            return keepAction(((Item) value).o());
        } catch (RuntimeException malformed) { return true; }
    }

    public static boolean hideAction(Action action) { return !keepAction(action); }

    private static boolean keepAction(Action action) {
        try {
            Target target = action == null ? null : action.P;
            IdentityHashMap<Target, Boolean> seen = new IdentityHashMap<>();
            for (int depth = 0; target != null && depth < 32; depth++) {
                if (target instanceof Target.Lock.RequireSubscriptionLock) return false;
                if (seen.put(target, Boolean.TRUE) != null) return true;
                if (target instanceof Target.Lock) target = ((Target.Lock) target).b();
                else if (target instanceof Target.OptionalTargetLock) target = ((Target.OptionalTargetLock) target).b();
                else return true;
            }
        } catch (RuntimeException malformed) {
            // Inspection cannot turn an unknown item into an unavailable one.
        }
        return true;
    }

    public static List filter(List original) {
        if (original == null) return null;
        ArrayList<Object> visible = null;
        for (int index = 0; index < original.size(); index++) {
            Object item = original.get(index);
            if (keep(item)) {
                if (visible != null) visible.add(item);
            } else if (visible == null) {
                visible = new ArrayList<>();
                for (int previous = 0; previous < index; previous++) visible.add(original.get(previous));
            }
        }
        return visible == null ? original : visible;
    }

    public static boolean collection(Block block) {
        if (!(block instanceof Block.LayoutBlock)) return false;
        BlockTemplateId template = block.P;
        return template == BlockTemplateId.R || template == BlockTemplateId.S || template == BlockTemplateId.T
            || template == BlockTemplateId.U || template == BlockTemplateId.V || template == BlockTemplateId.X;
    }

    public static Block visibleBlock(Block block) {
        if (!collection(block)) return block;
        Block.LayoutBlock original = (Block.LayoutBlock) block;
        LayoutBlockContent content = original.U;
        if (content == null || content.Q == null) return block;
        List visible = filter(content.Q);
        if (visible == content.Q) return block;
        LayoutBlockContent copy = new LayoutBlockContent(content.N, content.O, content.P, visible, content.R, content.S);
        return new Block.LayoutBlock(original.S, original.T, copy, original.V, original.W);
    }

    public static boolean hideEmpty(Block block, x4.c paging) {
        if (!collection(block) || paging == null || paging.b() != 0) return false;
        Object state = ((d0.q1) paging.d).getValue();
        if (!(state instanceof w4.C)) return false;
        w4.C loads = (w4.C) state;
        return loads.a instanceof w4.s0$b && loads.b instanceof w4.s0$b
            && loads.c instanceof w4.s0$b && loads.b.a && loads.c.a;
    }

    public static boolean sectionsChanged(Nk.a$b observer) { return Rows.changed(observer); }

    public static int rowCount(Qk.t row) { return Rows.count(row); }

    public static jv.a visibleFactory(Block block, jv.a original) {
        return collection(block) ? new Factory(original) : original;
    }

    private static final class Factory implements jv.a {
        private final jv.a delegate;
        Factory(jv.a delegate) { this.delegate = delegate; }
        @Override public Object invoke() { return wrapSource((w4.W1) delegate.invoke()); }
    }

    public static w4.W1 wrapSource(w4.W1 original) {
        return original instanceof FilteredSource ? original : new FilteredSource(original);
    }

    public static w4.A1 visiblePager(Block block, w4.A1 original) {
        if (!collection(block) || !(original instanceof w4.H) || original.k() instanceof FilteredSource) return original;
        w4.H raw = (w4.H) original;
        // Only the freshly built, unconsumed presentation seed is projected.
        if (raw.Q.N.size() != 1 || !(raw.Q.N.get(0) instanceof w4.W1$b$c)) return original;
        w4.W1$b$c seed = (w4.W1$b$c) raw.Q.N.get(0);
        List visible = filter(seed.N);
        FilteredSource source = new FilteredSource(raw.k());
        source.seed(seed);
        w4.A1$e config = raw.R;
        w4.A1$b builder = new w4.A1$b(source, new w4.W1$b$c(visible, seed.O, seed.P),
            new w4.A1$e(config.a, config.b, false, config.d, config.e));
        builder.f = raw.P;
        builder.g = raw.h0.e;
        w4.H result = builder.a();
        // loadAround rejects an empty list; the native internal hint accepts it
        // and dispatches asynchronously through the original fetch dispatcher.
        if (visible.isEmpty() && seed.P != null) result.s(0);
        return result;
    }

    public static int visibleIndex(Block block, int index) {
        if (index < 0 || !collection(block)) return index;
        LayoutBlockContent content = ((Block.LayoutBlock) block).U;
        if (content == null || content.Q == null || filter(content.Q) == content.Q) return index;
        int visible = 0;
        for (int raw = 0; raw < content.Q.size(); raw++) {
            if (keep(content.Q.get(raw))) {
                if (raw >= index) return visible;
                visible++;
            }
        }
        return Math.max(0, visible - 1);
    }
}
