package androidx.compose.ui;

import androidx.compose.ui.internal.PlatformOptimizedCancellationException;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Landroidx/compose/ui/ModifierNodeDetachedCancellationException;", "Landroidx/compose/ui/internal/PlatformOptimizedCancellationException;", "<init>", "()V", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ModifierNodeDetachedCancellationException extends PlatformOptimizedCancellationException {
    public ModifierNodeDetachedCancellationException() {
        super("The Modifier.Node was detached");
    }
}
