package com.moloco.sdk.internal.services;

import android.content.SharedPreferences;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;

/* loaded from: classes.dex */
public final class D implements w {

    /* renamed from: b, reason: collision with root package name */
    public static final int f37593b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f37594a;

    @DebugMetadata(c = "com.moloco.sdk.internal.services.PreferencesDataStoreServiceImpl$getBoolean$2", f = "DataStoreService.kt", l = {}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class a extends SuspendLambda implements Function2<j0, Continuation<? super Boolean>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37595a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f37597c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(String str, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f37597c = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Boolean> continuation) {
            return ((a) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return D.this.new a(this.f37597c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37595a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            if (!D.this.f37594a.contains(this.f37597c)) {
                return null;
            }
            try {
                return Boolean.valueOf(D.this.f37594a.getBoolean(this.f37597c, false));
            } catch (ClassCastException unused) {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, "ContentValues", "Unexpected value type for key: " + this.f37597c, null, false, 12, null);
                return null;
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.PreferencesDataStoreServiceImpl$getDouble$2", f = "DataStoreService.kt", l = {}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super Double>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37598a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f37600c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(String str, Continuation<? super b> continuation) {
            super(2, continuation);
            this.f37600c = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Double> continuation) {
            return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return D.this.new b(this.f37600c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37598a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            if (!D.this.f37594a.contains(this.f37600c)) {
                return null;
            }
            try {
                String string = D.this.f37594a.getString(this.f37600c, "0");
                if (string != null) {
                    return new Double(Double.parseDouble(string));
                }
                return null;
            } catch (ClassCastException e3) {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, "ContentValues", "Unexpected value type for key: " + this.f37600c, e3, false, 8, null);
                return null;
            } catch (NumberFormatException e11) {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, "ContentValues", "Unexpected value type for key: " + this.f37600c, e11, false, 8, null);
                return null;
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.PreferencesDataStoreServiceImpl$getFloat$2", f = "DataStoreService.kt", l = {}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class c extends SuspendLambda implements Function2<j0, Continuation<? super Float>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37601a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f37603c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(String str, Continuation<? super c> continuation) {
            super(2, continuation);
            this.f37603c = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Float> continuation) {
            return ((c) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return D.this.new c(this.f37603c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37601a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            if (!D.this.f37594a.contains(this.f37603c)) {
                return null;
            }
            try {
                return new Float(D.this.f37594a.getFloat(this.f37603c, 0.0f));
            } catch (ClassCastException unused) {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, "ContentValues", "Unexpected value type for key: " + this.f37603c, null, false, 12, null);
                return null;
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.PreferencesDataStoreServiceImpl$getInt$2", f = "DataStoreService.kt", l = {}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class d extends SuspendLambda implements Function2<j0, Continuation<? super Integer>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37604a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f37606c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(String str, Continuation<? super d> continuation) {
            super(2, continuation);
            this.f37606c = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Integer> continuation) {
            return ((d) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return D.this.new d(this.f37606c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37604a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            if (!D.this.f37594a.contains(this.f37606c)) {
                return null;
            }
            try {
                return new Integer(D.this.f37594a.getInt(this.f37606c, 0));
            } catch (ClassCastException unused) {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, "ContentValues", "Unexpected value type for key: " + this.f37606c, null, false, 12, null);
                return null;
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.PreferencesDataStoreServiceImpl$getLong$2", f = "DataStoreService.kt", l = {}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class e extends SuspendLambda implements Function2<j0, Continuation<? super Long>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37607a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f37609c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public e(String str, Continuation<? super e> continuation) {
            super(2, continuation);
            this.f37609c = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Long> continuation) {
            return ((e) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return D.this.new e(this.f37609c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37607a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            if (!D.this.f37594a.contains(this.f37609c)) {
                return null;
            }
            try {
                String string = D.this.f37594a.getString(this.f37609c, "0");
                if (string != null) {
                    return new Long(Long.parseLong(string));
                }
                return null;
            } catch (ClassCastException e3) {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, "ContentValues", "Unexpected value type for key: " + this.f37609c, e3, false, 8, null);
                return null;
            } catch (NumberFormatException e11) {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, "ContentValues", "Unexpected value type for key: " + this.f37609c, e11, false, 8, null);
                return null;
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.PreferencesDataStoreServiceImpl$getString$2", f = "DataStoreService.kt", l = {}, m = "invokeSuspend")
    public static final class f extends SuspendLambda implements Function2<j0, Continuation<? super String>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37610a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f37612c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public f(String str, Continuation<? super f> continuation) {
            super(2, continuation);
            this.f37612c = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super String> continuation) {
            return ((f) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return D.this.new f(this.f37612c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37610a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            if (!D.this.f37594a.contains(this.f37612c)) {
                return null;
            }
            try {
                return D.this.f37594a.getString(this.f37612c, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            } catch (ClassCastException unused) {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, "ContentValues", "Unexpected value type for key: " + this.f37612c, null, false, 12, null);
                return null;
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.PreferencesDataStoreServiceImpl$removeKey$2", f = "DataStoreService.kt", l = {}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class g extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37613a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f37615c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public g(String str, Continuation<? super g> continuation) {
            super(2, continuation);
            this.f37615c = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((g) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return D.this.new g(this.f37615c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37613a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            D.this.f37594a.edit().remove(this.f37615c).apply();
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.PreferencesDataStoreServiceImpl$set$2", f = "DataStoreService.kt", l = {}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class h extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f37616a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ T f37617b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ D f37618c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ String f37619d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public h(T t6, D d5, String str, Continuation<? super h> continuation) {
            super(2, continuation);
            this.f37617b = t6;
            this.f37618c = d5;
            this.f37619d = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((h) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new h(this.f37617b, this.f37618c, this.f37619d, continuation);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f37616a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            T t6 = this.f37617b;
            if (t6 instanceof Integer) {
                this.f37618c.f37594a.edit().putInt(this.f37619d, ((Number) this.f37617b).intValue()).apply();
            } else if (t6 instanceof String) {
                this.f37618c.f37594a.edit().putString(this.f37619d, (String) this.f37617b).apply();
            } else if (t6 instanceof Float) {
                this.f37618c.f37594a.edit().putFloat(this.f37619d, ((Number) this.f37617b).floatValue()).apply();
            } else if (t6 instanceof Boolean) {
                this.f37618c.f37594a.edit().putBoolean(this.f37619d, ((Boolean) this.f37617b).booleanValue()).apply();
            } else if (t6 instanceof Double) {
                this.f37618c.f37594a.edit().putString(this.f37619d, String.valueOf(((Number) this.f37617b).doubleValue())).apply();
            } else if (t6 instanceof Long) {
                this.f37618c.f37594a.edit().putString(this.f37619d, String.valueOf(((Number) this.f37617b).longValue())).apply();
            } else {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, "ContentValues", "Unexpected value type: " + this.f37617b + " for key: " + this.f37619d, null, false, 12, null);
            }
            return Unit.f71706a;
        }
    }

    public D(@NotNull SharedPreferences sharedPreferences) {
        Intrinsics.g(sharedPreferences, "sharedPreferences");
        this.f37594a = sharedPreferences;
    }

    @Override // com.moloco.sdk.internal.services.w
    @Nullable
    public Object b(@NotNull String str, @NotNull Continuation<? super Double> continuation) {
        return m0.y(com.moloco.sdk.internal.scheduling.b.a().getIo(), new b(str, null), continuation);
    }

    @Override // com.moloco.sdk.internal.services.w
    @Nullable
    public Object c(@NotNull String str, @NotNull Continuation<? super Float> continuation) {
        return m0.y(com.moloco.sdk.internal.scheduling.b.a().getIo(), new c(str, null), continuation);
    }

    @Override // com.moloco.sdk.internal.services.w
    @Nullable
    public Object d(@NotNull String str, @NotNull Continuation<? super String> continuation) {
        return m0.y(com.moloco.sdk.internal.scheduling.b.a().getIo(), new f(str, null), continuation);
    }

    @Override // com.moloco.sdk.internal.services.w
    @Nullable
    public Object e(@NotNull String str, @NotNull Continuation<? super Integer> continuation) {
        return m0.y(com.moloco.sdk.internal.scheduling.b.a().getIo(), new d(str, null), continuation);
    }

    @Override // com.moloco.sdk.internal.services.w
    @Nullable
    public Object f(@NotNull String str, @NotNull Continuation<? super Boolean> continuation) {
        return m0.y(com.moloco.sdk.internal.scheduling.b.a().getIo(), new a(str, null), continuation);
    }

    @Override // com.moloco.sdk.internal.services.w
    @Nullable
    public Object g(@NotNull String str, @NotNull Continuation<? super Long> continuation) {
        return m0.y(com.moloco.sdk.internal.scheduling.b.a().getIo(), new e(str, null), continuation);
    }

    @Override // com.moloco.sdk.internal.services.w
    @Nullable
    public Object a(@NotNull String str, @NotNull Continuation<? super Unit> continuation) throws Throwable {
        Object objY = m0.y(com.moloco.sdk.internal.scheduling.b.a().getIo(), new g(str, null), continuation);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }

    @Override // com.moloco.sdk.internal.services.w
    @Nullable
    public <T> Object a(@NotNull String str, T t6, @NotNull Continuation<? super Unit> continuation) throws Throwable {
        Object objY = m0.y(com.moloco.sdk.internal.scheduling.b.a().getIo(), new h(t6, this, str, null), continuation);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }
}
