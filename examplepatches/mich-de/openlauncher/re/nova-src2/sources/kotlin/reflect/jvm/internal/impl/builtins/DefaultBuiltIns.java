package kotlin.reflect.jvm.internal.impl.builtins;

import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.reflect.jvm.internal.impl.storage.LockBasedStorageManager;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class DefaultBuiltIns extends KotlinBuiltIns {

    @NotNull
    public static final Companion Companion = new Companion(null);

    @NotNull
    private static final Lazy<DefaultBuiltIns> Instance$delegate = LazyKt.a(new Function0<DefaultBuiltIns>() { // from class: kotlin.reflect.jvm.internal.impl.builtins.DefaultBuiltIns$Companion$Instance$2
        @Override // kotlin.jvm.functions.Function0
        @NotNull
        public final DefaultBuiltIns invoke() {
            return new DefaultBuiltIns(false, 1, null);
        }
    });

    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final DefaultBuiltIns getInstance() {
            return (DefaultBuiltIns) DefaultBuiltIns.Instance$delegate.getValue();
        }

        private Companion() {
        }
    }

    public DefaultBuiltIns() {
        this(false, 1, null);
    }

    public DefaultBuiltIns(boolean z11) {
        super(new LockBasedStorageManager("DefaultBuiltIns"));
        if (z11) {
            createBuiltInsModule(false);
        }
    }

    public /* synthetic */ DefaultBuiltIns(boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? true : z11);
    }
}
