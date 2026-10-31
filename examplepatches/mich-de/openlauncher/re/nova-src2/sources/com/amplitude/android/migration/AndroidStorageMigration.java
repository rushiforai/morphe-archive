package com.amplitude.android.migration;

import com.amplitude.android.storage.AndroidStorageV2;
import com.amplitude.common.Logger;
import com.amplitude.core.Storage;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.Plan;
import com.amplitude.core.utilities.JSONUtilKt;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J\u000e\u0010\b\u001a\u00020\tH\u0086@¢\u0006\u0002\u0010\nJ\u000e\u0010\u000b\u001a\u00020\tH\u0082@¢\u0006\u0002\u0010\nJ\u0016\u0010\f\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u000eH\u0082@¢\u0006\u0002\u0010\u000fJ\u000e\u0010\u0010\u001a\u00020\tH\u0082@¢\u0006\u0002\u0010\nR\u000e\u0010\u0004\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"Lcom/amplitude/android/migration/AndroidStorageMigration;", b.f42142b, Plan.AMP_PLAN_SOURCE, "Lcom/amplitude/android/storage/AndroidStorageV2;", "destination", "logger", "Lcom/amplitude/common/Logger;", "(Lcom/amplitude/android/storage/AndroidStorageV2;Lcom/amplitude/android/storage/AndroidStorageV2;Lcom/amplitude/common/Logger;)V", "execute", b.f42142b, "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "moveEventsToDestination", "moveSimpleValue", DatabaseConstants.KEY_FIELD, "Lcom/amplitude/core/Storage$Constants;", "(Lcom/amplitude/core/Storage$Constants;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "moveSimpleValues", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AndroidStorageMigration {

    @NotNull
    private final AndroidStorageV2 destination;

    @NotNull
    private final Logger logger;

    @NotNull
    private final AndroidStorageV2 source;

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "com.amplitude.android.migration.AndroidStorageMigration", f = "AndroidStorageMigration.kt", l = {15, 16}, m = "execute")
    /* renamed from: com.amplitude.android.migration.AndroidStorageMigration$execute$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AndroidStorageMigration.this.execute(this);
        }
    }

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "com.amplitude.android.migration.AndroidStorageMigration", f = "AndroidStorageMigration.kt", l = {21, 29, 35, 44}, m = "moveEventsToDestination")
    /* renamed from: com.amplitude.android.migration.AndroidStorageMigration$moveEventsToDestination$1, reason: invalid class name and case insensitive filesystem */
    public static final class C03701 extends ContinuationImpl {
        int I$0;
        Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        Object L$4;
        Object L$5;
        int label;
        /* synthetic */ Object result;

        public C03701(Continuation<? super C03701> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AndroidStorageMigration.this.moveEventsToDestination(this);
        }
    }

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "com.amplitude.android.migration.AndroidStorageMigration", f = "AndroidStorageMigration.kt", l = {68, 74}, m = "moveSimpleValue")
    /* renamed from: com.amplitude.android.migration.AndroidStorageMigration$moveSimpleValue$1, reason: invalid class name and case insensitive filesystem */
    public static final class C03711 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C03711(Continuation<? super C03711> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AndroidStorageMigration.this.moveSimpleValue(null, this);
        }
    }

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "com.amplitude.android.migration.AndroidStorageMigration", f = "AndroidStorageMigration.kt", l = {51, 52, 53, 55, 56, 57, 58}, m = "moveSimpleValues")
    /* renamed from: com.amplitude.android.migration.AndroidStorageMigration$moveSimpleValues$1, reason: invalid class name and case insensitive filesystem */
    public static final class C03721 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C03721(Continuation<? super C03721> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AndroidStorageMigration.this.moveSimpleValues(this);
        }
    }

    public AndroidStorageMigration(@NotNull AndroidStorageV2 source, @NotNull AndroidStorageV2 destination, @NotNull Logger logger) {
        Intrinsics.g(source, "source");
        Intrinsics.g(destination, "destination");
        Intrinsics.g(logger, "logger");
        this.source = source;
        this.destination = destination;
        this.logger = logger;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x01b4, code lost:
    
        if (r4.rollover(r0) == r3) goto L68;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00bd A[Catch: Exception -> 0x0096, TryCatch #4 {Exception -> 0x0096, blocks: (B:33:0x0092, B:42:0x00ac, B:44:0x00bd, B:46:0x00c5), top: B:81:0x0092 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00c5 A[Catch: Exception -> 0x0096, TRY_LEAVE, TryCatch #4 {Exception -> 0x0096, blocks: (B:33:0x0092, B:42:0x00ac, B:44:0x00bd, B:46:0x00c5), top: B:81:0x0092 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00d3 A[Catch: Exception -> 0x0039, TryCatch #1 {Exception -> 0x0039, blocks: (B:15:0x0034, B:55:0x010a, B:57:0x0110, B:64:0x013a, B:65:0x0168, B:48:0x00cc, B:50:0x00d3, B:54:0x00f6, B:66:0x019b), top: B:76:0x0026 }] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x019b A[Catch: Exception -> 0x0039, TRY_LEAVE, TryCatch #1 {Exception -> 0x0039, blocks: (B:15:0x0034, B:55:0x010a, B:57:0x0110, B:64:0x013a, B:65:0x0168, B:48:0x00cc, B:50:0x00d3, B:54:0x00f6, B:66:0x019b), top: B:76:0x0026 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r2v10 */
    /* JADX WARN: Type inference failed for: r2v11 */
    /* JADX WARN: Type inference failed for: r2v2, types: [com.amplitude.android.migration.AndroidStorageMigration$moveEventsToDestination$1, kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r2v20 */
    /* JADX WARN: Type inference failed for: r2v21 */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:54:0x00f6 -> B:55:0x010a). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object moveEventsToDestination(Continuation<? super Unit> continuation) {
        AndroidStorageMigration c03701;
        AndroidStorageMigration androidStorageMigration;
        List<Object> eventsContent;
        Iterator<Object> it;
        C03701 c037012;
        AndroidStorageMigration androidStorageMigration2;
        String str;
        C03701 c037013;
        int i5;
        String str2;
        Iterator<BaseEvent> it2;
        List<BaseEvent> list;
        AndroidStorageV2 androidStorageV2;
        if (continuation instanceof C03701) {
            C03701 c037014 = (C03701) continuation;
            int i11 = c037014.label;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                c037014.label = i11 - Integer.MIN_VALUE;
                c03701 = c037014;
            } else {
                c03701 = new C03701(continuation);
            }
        }
        Object obj = c03701.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = c03701.label;
        int i13 = 3;
        try {
        } catch (Exception e3) {
            e = e3;
        }
        if (i12 != 0) {
            if (i12 == 1) {
                androidStorageMigration = (AndroidStorageMigration) c03701.L$0;
                try {
                    ResultKt.b(obj);
                    eventsContent = androidStorageMigration.source.readEventsContent();
                    Intrinsics.e(eventsContent, "null cannot be cast to non-null type kotlin.collections.List<kotlin.String>");
                    if (!eventsContent.isEmpty()) {
                        androidStorageMigration.source.cleanupMetadata();
                        return Unit.f71706a;
                    }
                    it = eventsContent.iterator();
                    c037012 = c03701;
                    androidStorageMigration2 = androidStorageMigration;
                    if (it.hasNext()) {
                        androidStorageMigration2.source.cleanupMetadata();
                        AndroidStorageV2 androidStorageV22 = androidStorageMigration2.destination;
                        c037012.L$0 = androidStorageMigration2;
                        c037012.L$1 = null;
                        c037012.L$2 = null;
                        c037012.L$3 = null;
                        c037012.L$4 = null;
                        c037012.L$5 = null;
                        c037012.label = 4;
                    } else {
                        String str3 = (String) it.next();
                        AndroidStorageV2 androidStorageV23 = androidStorageMigration2.source;
                        c037012.L$0 = androidStorageMigration2;
                        c037012.L$1 = it;
                        c037012.L$2 = str3;
                        c037012.L$3 = null;
                        c037012.L$4 = null;
                        c037012.L$5 = null;
                        c037012.label = 2;
                        Object eventsString = androidStorageV23.getEventsString(str3, c037012);
                        if (eventsString != coroutineSingletons) {
                            str = str3;
                            c037013 = c037012;
                            obj = eventsString;
                            Iterator<Object> it3 = it;
                            String str4 = str;
                            List<BaseEvent> events = JSONUtilKt.toEvents(new JSONArray((String) obj));
                            i5 = 0;
                            str2 = str4;
                            it = it3;
                            it2 = events.iterator();
                            list = events;
                        }
                    }
                    return coroutineSingletons;
                } catch (Exception e11) {
                    e = e11;
                    c03701 = androidStorageMigration;
                }
            } else if (i12 == 2) {
                String str5 = (String) c03701.L$2;
                it = (Iterator) c03701.L$1;
                AndroidStorageMigration androidStorageMigration3 = (AndroidStorageMigration) c03701.L$0;
                try {
                    ResultKt.b(obj);
                    str = str5;
                    c037013 = c03701;
                    androidStorageMigration2 = androidStorageMigration3;
                    Iterator<Object> it32 = it;
                    String str42 = str;
                    List<BaseEvent> events2 = JSONUtilKt.toEvents(new JSONArray((String) obj));
                    i5 = 0;
                    str2 = str42;
                    it = it32;
                    it2 = events2.iterator();
                    list = events2;
                } catch (Exception e12) {
                    e = e12;
                    c03701 = androidStorageMigration3;
                }
            } else {
                if (i12 != 3) {
                    if (i12 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                int i14 = c03701.I$0;
                BaseEvent baseEvent = (BaseEvent) c03701.L$5;
                it2 = (Iterator) c03701.L$4;
                list = (List) c03701.L$3;
                String str6 = (String) c03701.L$2;
                Iterator<Object> it4 = (Iterator) c03701.L$1;
                AndroidStorageMigration androidStorageMigration4 = (AndroidStorageMigration) c03701.L$0;
                try {
                    ResultKt.b(obj);
                    it = it4;
                    str2 = str6;
                    i5 = i14;
                    c037013 = c03701;
                    androidStorageMigration2 = androidStorageMigration4;
                } catch (Exception e13) {
                    c037013 = c03701;
                    androidStorageMigration2 = androidStorageMigration4;
                    i5 = i14;
                    androidStorageMigration2.logger.error("can't move event (" + baseEvent + ") from file " + str6 + ": " + e13.getMessage());
                    it = it4;
                    str2 = str6;
                    i13 = 3;
                }
            }
            c03701.logger.error("can't move event files: " + e.getMessage());
            return Unit.f71706a;
        }
        ResultKt.b(obj);
        try {
            AndroidStorageV2 androidStorageV24 = this.source;
            c03701.L$0 = this;
            c03701.label = 1;
            if (androidStorageV24.rollover(c03701) != coroutineSingletons) {
                androidStorageMigration = this;
                eventsContent = androidStorageMigration.source.readEventsContent();
                Intrinsics.e(eventsContent, "null cannot be cast to non-null type kotlin.collections.List<kotlin.String>");
                if (!eventsContent.isEmpty()) {
                }
            }
            return coroutineSingletons;
        } catch (Exception e14) {
            e = e14;
            c03701 = this;
        }
        while (it2.hasNext()) {
            BaseEvent next = it2.next();
            i5++;
            try {
                androidStorageV2 = androidStorageMigration2.destination;
                c037013.L$0 = androidStorageMigration2;
                c037013.L$1 = it;
                c037013.L$2 = str2;
                c037013.L$3 = list;
                c037013.L$4 = it2;
                c037013.L$5 = next;
                c037013.I$0 = i5;
                c037013.label = i13;
            } catch (Exception e15) {
                String str7 = str2;
                Iterator<Object> it5 = it;
                androidStorageMigration2.logger.error("can't move event (" + next + ") from file " + str7 + ": " + e15.getMessage());
                it = it5;
                str2 = str7;
                i13 = 3;
            }
            if (androidStorageV2.writeEvent(next, c037013) == coroutineSingletons) {
                break;
            }
        }
        androidStorageMigration2.logger.debug("Migrated " + i5 + '/' + list.size() + " events from " + str2);
        androidStorageMigration2.source.removeFile(str2);
        c037012 = c037013;
        i13 = 3;
        if (it.hasNext()) {
        }
        return coroutineSingletons;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00c6, code lost:
    
        if (r10 == r3) goto L47;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r0v1 */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v2, types: [com.amplitude.android.migration.AndroidStorageMigration] */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v9 */
    /* JADX WARN: Type inference failed for: r10v11, types: [java.lang.Object] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object moveSimpleValue(Storage.Constants constants, Continuation<? super Unit> continuation) {
        C03711 c03711;
        AndroidStorageMigration androidStorageMigration;
        AndroidStorageMigration androidStorageMigration2;
        Storage.Constants constants2;
        Storage.Constants constants3;
        ?? r02 = "can't write destination ";
        if (continuation instanceof C03711) {
            c03711 = (C03711) continuation;
            int i5 = c03711.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c03711.label = i5 - Integer.MIN_VALUE;
            } else {
                c03711 = new C03711(continuation);
            }
        }
        Object obj = c03711.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c03711.label;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                try {
                    String str = this.source.read(constants);
                    if (str == null) {
                        return Unit.f71706a;
                    }
                    if (this.destination.read(constants) == null) {
                        try {
                            this.logger.debug("Migrating " + constants + " with value " + str);
                            AndroidStorageV2 androidStorageV2 = this.destination;
                            c03711.L$0 = this;
                            c03711.L$1 = constants;
                            c03711.label = 1;
                            if (androidStorageV2.write(constants, str, c03711) != coroutineSingletons) {
                                androidStorageMigration = this;
                                constants3 = constants;
                                androidStorageMigration2 = androidStorageMigration;
                                constants2 = constants3;
                                AndroidStorageV2 androidStorageV22 = androidStorageMigration2.source;
                                c03711.L$0 = androidStorageMigration2;
                                c03711.L$1 = constants2;
                                c03711.label = 2;
                                ?? Remove = androidStorageV22.remove(constants2, c03711);
                                r02 = androidStorageMigration2;
                                constants = Remove;
                            }
                            return coroutineSingletons;
                        } catch (Exception e3) {
                            e = e3;
                            androidStorageMigration = this;
                            androidStorageMigration.logger.error("can't write destination " + constants + ": " + e.getMessage());
                            return Unit.f71706a;
                        }
                    }
                    androidStorageMigration2 = this;
                    constants2 = constants;
                    AndroidStorageV2 androidStorageV222 = androidStorageMigration2.source;
                    c03711.L$0 = androidStorageMigration2;
                    c03711.L$1 = constants2;
                    c03711.label = 2;
                    ?? Remove2 = androidStorageV222.remove(constants2, c03711);
                    r02 = androidStorageMigration2;
                    constants = Remove2;
                } catch (Exception e11) {
                    e = e11;
                    r02 = this;
                    r02.logger.error("can't move " + constants + ": " + e.getMessage());
                    return Unit.f71706a;
                }
            } else if (i11 == 1) {
                constants = (Storage.Constants) c03711.L$1;
                androidStorageMigration = (AndroidStorageMigration) c03711.L$0;
                try {
                    ResultKt.b(obj);
                    constants3 = constants;
                    androidStorageMigration2 = androidStorageMigration;
                    constants2 = constants3;
                    AndroidStorageV2 androidStorageV2222 = androidStorageMigration2.source;
                    c03711.L$0 = androidStorageMigration2;
                    c03711.L$1 = constants2;
                    c03711.label = 2;
                    ?? Remove22 = androidStorageV2222.remove(constants2, c03711);
                    r02 = androidStorageMigration2;
                    constants = Remove22;
                } catch (Exception e12) {
                    e = e12;
                    try {
                        androidStorageMigration.logger.error("can't write destination " + constants + ": " + e.getMessage());
                        return Unit.f71706a;
                    } catch (Exception e13) {
                        e = e13;
                        r02 = androidStorageMigration;
                        r02.logger.error("can't move " + constants + ": " + e.getMessage());
                        return Unit.f71706a;
                    }
                }
            } else {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                Storage.Constants constants4 = (Storage.Constants) c03711.L$1;
                AndroidStorageMigration androidStorageMigration3 = (AndroidStorageMigration) c03711.L$0;
                ResultKt.b(obj);
                r02 = androidStorageMigration3;
                constants = constants4;
            }
        } catch (Exception e14) {
            e = e14;
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00c4, code lost:
    
        if (r2.moveSimpleValue(r5, r0) != r1) goto L41;
     */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0080 A[PHI: r2
      0x0080: PHI (r2v6 com.amplitude.android.migration.AndroidStorageMigration) = 
      (r2v3 com.amplitude.android.migration.AndroidStorageMigration)
      (r2v8 com.amplitude.android.migration.AndroidStorageMigration)
     binds: [B:24:0x007d, B:17:0x0050] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x008e A[PHI: r2
      0x008e: PHI (r2v9 com.amplitude.android.migration.AndroidStorageMigration) = 
      (r2v6 com.amplitude.android.migration.AndroidStorageMigration)
      (r2v11 com.amplitude.android.migration.AndroidStorageMigration)
     binds: [B:27:0x008b, B:16:0x0048] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x009c A[PHI: r2
      0x009c: PHI (r2v12 com.amplitude.android.migration.AndroidStorageMigration) = 
      (r2v9 com.amplitude.android.migration.AndroidStorageMigration)
      (r2v14 com.amplitude.android.migration.AndroidStorageMigration)
     binds: [B:30:0x0099, B:15:0x0040] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00aa A[PHI: r2
      0x00aa: PHI (r2v15 com.amplitude.android.migration.AndroidStorageMigration) = 
      (r2v12 com.amplitude.android.migration.AndroidStorageMigration)
      (r2v17 com.amplitude.android.migration.AndroidStorageMigration)
     binds: [B:33:0x00a7, B:14:0x0037] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00b8 A[PHI: r2
      0x00b8: PHI (r2v18 com.amplitude.android.migration.AndroidStorageMigration) = 
      (r2v15 com.amplitude.android.migration.AndroidStorageMigration)
      (r2v20 com.amplitude.android.migration.AndroidStorageMigration)
     binds: [B:36:0x00b5, B:13:0x002e] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object moveSimpleValues(Continuation<? super Unit> continuation) {
        C03721 c03721;
        AndroidStorageMigration androidStorageMigration;
        Storage.Constants constants;
        Storage.Constants constants2;
        Storage.Constants constants3;
        Storage.Constants constants4;
        Storage.Constants constants5;
        if (continuation instanceof C03721) {
            c03721 = (C03721) continuation;
            int i5 = c03721.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c03721.label = i5 - Integer.MIN_VALUE;
            } else {
                c03721 = new C03721(continuation);
            }
        }
        Object obj = c03721.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (c03721.label) {
            case 0:
                ResultKt.b(obj);
                Storage.Constants constants6 = Storage.Constants.PREVIOUS_SESSION_ID;
                c03721.L$0 = this;
                c03721.label = 1;
                if (moveSimpleValue(constants6, c03721) != coroutineSingletons) {
                    androidStorageMigration = this;
                    constants = Storage.Constants.LAST_EVENT_TIME;
                    c03721.L$0 = androidStorageMigration;
                    c03721.label = 2;
                    if (androidStorageMigration.moveSimpleValue(constants, c03721) != coroutineSingletons) {
                        constants2 = Storage.Constants.LAST_EVENT_ID;
                        c03721.L$0 = androidStorageMigration;
                        c03721.label = 3;
                        if (androidStorageMigration.moveSimpleValue(constants2, c03721) != coroutineSingletons) {
                            constants3 = Storage.Constants.OPT_OUT;
                            c03721.L$0 = androidStorageMigration;
                            c03721.label = 4;
                            if (androidStorageMigration.moveSimpleValue(constants3, c03721) != coroutineSingletons) {
                                constants4 = Storage.Constants.Events;
                                c03721.L$0 = androidStorageMigration;
                                c03721.label = 5;
                                if (androidStorageMigration.moveSimpleValue(constants4, c03721) != coroutineSingletons) {
                                    constants5 = Storage.Constants.APP_VERSION;
                                    c03721.L$0 = androidStorageMigration;
                                    c03721.label = 6;
                                    if (androidStorageMigration.moveSimpleValue(constants5, c03721) != coroutineSingletons) {
                                        Storage.Constants constants7 = Storage.Constants.APP_BUILD;
                                        c03721.L$0 = null;
                                        c03721.label = 7;
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
                return coroutineSingletons;
            case 1:
                androidStorageMigration = (AndroidStorageMigration) c03721.L$0;
                ResultKt.b(obj);
                constants = Storage.Constants.LAST_EVENT_TIME;
                c03721.L$0 = androidStorageMigration;
                c03721.label = 2;
                if (androidStorageMigration.moveSimpleValue(constants, c03721) != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 2:
                androidStorageMigration = (AndroidStorageMigration) c03721.L$0;
                ResultKt.b(obj);
                constants2 = Storage.Constants.LAST_EVENT_ID;
                c03721.L$0 = androidStorageMigration;
                c03721.label = 3;
                if (androidStorageMigration.moveSimpleValue(constants2, c03721) != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 3:
                androidStorageMigration = (AndroidStorageMigration) c03721.L$0;
                ResultKt.b(obj);
                constants3 = Storage.Constants.OPT_OUT;
                c03721.L$0 = androidStorageMigration;
                c03721.label = 4;
                if (androidStorageMigration.moveSimpleValue(constants3, c03721) != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 4:
                androidStorageMigration = (AndroidStorageMigration) c03721.L$0;
                ResultKt.b(obj);
                constants4 = Storage.Constants.Events;
                c03721.L$0 = androidStorageMigration;
                c03721.label = 5;
                if (androidStorageMigration.moveSimpleValue(constants4, c03721) != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 5:
                androidStorageMigration = (AndroidStorageMigration) c03721.L$0;
                ResultKt.b(obj);
                constants5 = Storage.Constants.APP_VERSION;
                c03721.L$0 = androidStorageMigration;
                c03721.label = 6;
                if (androidStorageMigration.moveSimpleValue(constants5, c03721) != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 6:
                androidStorageMigration = (AndroidStorageMigration) c03721.L$0;
                ResultKt.b(obj);
                Storage.Constants constants72 = Storage.Constants.APP_BUILD;
                c03721.L$0 = null;
                c03721.label = 7;
                break;
            case 7:
                ResultKt.b(obj);
                return Unit.f71706a;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0052, code lost:
    
        if (r2.moveSimpleValues(r0) == r1) goto L22;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object execute(@NotNull Continuation<? super Unit> continuation) {
        AnonymousClass1 anonymousClass1;
        AndroidStorageMigration androidStorageMigration;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object obj = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            anonymousClass1.L$0 = this;
            anonymousClass1.label = 1;
            if (moveEventsToDestination(anonymousClass1) != coroutineSingletons) {
                androidStorageMigration = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        androidStorageMigration = (AndroidStorageMigration) anonymousClass1.L$0;
        ResultKt.b(obj);
        anonymousClass1.L$0 = null;
        anonymousClass1.label = 2;
    }
}
