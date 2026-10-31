package com.instabridge.ai.tools;

import android.content.Context;
import b.c0;
import b70.g;
import com.instabridge.ai.tools.SendMessageTool;
import h6.c1;
import java.util.List;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001:\u0001\u0013B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J \u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0086@¢\u0006\u0002\u0010\nJ \u0010\u000b\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0086@¢\u0006\u0002\u0010\nJ \u0010\f\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0086@¢\u0006\u0002\u0010\nJ \u0010\r\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0086@¢\u0006\u0002\u0010\nJ\u0018\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tJ\u001e\u0010\u0010\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\t2\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u000f0\u0012H\u0002¨\u0006\u0014"}, d2 = {"Lcom/instabridge/ai/tools/ContactResolver;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "resolve", "Lcom/instabridge/ai/tools/SendMessageTool$ResolveResult;", "context", "Landroid/content/Context;", "query", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "resolvePhone", "resolveEmail", "resolveName", "resolveSync", "Lcom/instabridge/ai/tools/SendMessageTool$ResolvedContact;", "formatAmbiguousMessage", "candidates", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "AmbiguousContactException", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class ContactResolver {
    public static final int $stable = 0;

    @NotNull
    public static final ContactResolver INSTANCE = new ContactResolver();

    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0007\u0018\u00002\u00060\u0001j\u0002`\u0002B\u001d\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\u0004\b\b\u0010\tR\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/tools/ContactResolver$AmbiguousContactException;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "query", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "candidates", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/tools/SendMessageTool$ResolvedContact;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "getQuery", "()Ljava/lang/String;", "getCandidates", "()Ljava/util/List;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class AmbiguousContactException extends Exception {
        public static final int $stable = 8;

        @NotNull
        private final List<SendMessageTool.ResolvedContact> candidates;

        @NotNull
        private final String query;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AmbiguousContactException(@NotNull String query, @NotNull List<SendMessageTool.ResolvedContact> candidates) {
            super(ContactResolver.INSTANCE.formatAmbiguousMessage(query, candidates));
            Intrinsics.g(query, "query");
            Intrinsics.g(candidates, "candidates");
            this.query = query;
            this.candidates = candidates;
        }

        @NotNull
        public final List<SendMessageTool.ResolvedContact> getCandidates() {
            return this.candidates;
        }

        @NotNull
        public final String getQuery() {
            return this.query;
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.tools.ContactResolver", f = "ContactResolver.kt", l = {66}, m = "resolveEmail")
    /* renamed from: com.instabridge.ai.tools.ContactResolver$resolveEmail$1, reason: invalid class name */
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
            return ContactResolver.this.resolveEmail(null, null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.tools.ContactResolver", f = "ContactResolver.kt", l = {81}, m = "resolveName")
    /* renamed from: com.instabridge.ai.tools.ContactResolver$resolveName$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28571 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28571(Continuation<? super C28571> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return ContactResolver.this.resolveName(null, null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.tools.ContactResolver", f = "ContactResolver.kt", l = {48}, m = "resolvePhone")
    /* renamed from: com.instabridge.ai.tools.ContactResolver$resolvePhone$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28581 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C28581(Continuation<? super C28581> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return ContactResolver.this.resolvePhone(null, null, this);
        }
    }

    private ContactResolver() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String formatAmbiguousMessage(String query, List<SendMessageTool.ResolvedContact> candidates) {
        return c0.m("Multiple contacts match '", query, "'. Please specify which one:\n", g.f1(candidates, "\n", null, null, 0, new a00.a(27), 30));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence formatAmbiguousMessage$lambda$1(SendMessageTool.ResolvedContact c11) {
        Intrinsics.g(c11, "c");
        String str = (String) g.Y0(c11.getPhones());
        String strM = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (str == null && (str = (String) g.Y0(c11.getEmails())) == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        StringBuilder sb2 = new StringBuilder("- ");
        sb2.append(c11.getName());
        if (str.length() > 0) {
            strM = c1.m(')', " (", str);
        }
        sb2.append(strM);
        return sb2.toString();
    }

    @Nullable
    public final Object resolve(@NotNull Context context, @NotNull String str, @NotNull Continuation<? super SendMessageTool.ResolveResult> continuation) {
        return SendMessageTool.resolveContactWithDisambiguation$instabridge_ai_sdk_release$default(SendMessageTool.INSTANCE, context, str, false, continuation, 4, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object resolveEmail(@NotNull Context context, @NotNull String str, @NotNull Continuation<? super String> continuation) throws AmbiguousContactException {
        AnonymousClass1 anonymousClass1;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object objResolve = anonymousClass1.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(objResolve);
            anonymousClass1.L$0 = str;
            anonymousClass1.label = 1;
            objResolve = resolve(context, str, anonymousClass1);
            if (objResolve == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = (String) anonymousClass1.L$0;
            ResultKt.b(objResolve);
        }
        SendMessageTool.ResolveResult resolveResult = (SendMessageTool.ResolveResult) objResolve;
        if (resolveResult instanceof SendMessageTool.ResolveResult.Found) {
            return (String) g.Y0(((SendMessageTool.ResolveResult.Found) resolveResult).getContact().getEmails());
        }
        if (resolveResult instanceof SendMessageTool.ResolveResult.Ambiguous) {
            throw new AmbiguousContactException(str, ((SendMessageTool.ResolveResult.Ambiguous) resolveResult).getCandidates());
        }
        if (resolveResult == null) {
            return null;
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object resolveName(@NotNull Context context, @NotNull String str, @NotNull Continuation<? super String> continuation) {
        C28571 c28571;
        if (continuation instanceof C28571) {
            c28571 = (C28571) continuation;
            int i5 = c28571.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28571.label = i5 - Integer.MIN_VALUE;
            } else {
                c28571 = new C28571(continuation);
            }
        }
        Object objResolve = c28571.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28571.label;
        if (i11 == 0) {
            ResultKt.b(objResolve);
            c28571.label = 1;
            objResolve = resolve(context, str, c28571);
            if (objResolve == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objResolve);
        }
        SendMessageTool.ResolveResult resolveResult = (SendMessageTool.ResolveResult) objResolve;
        if (resolveResult instanceof SendMessageTool.ResolveResult.Found) {
            return ((SendMessageTool.ResolveResult.Found) resolveResult).getContact().getName();
        }
        if ((resolveResult instanceof SendMessageTool.ResolveResult.Ambiguous) || resolveResult == null) {
            return null;
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object resolvePhone(@NotNull Context context, @NotNull String str, @NotNull Continuation<? super String> continuation) throws AmbiguousContactException {
        C28581 c28581;
        if (continuation instanceof C28581) {
            c28581 = (C28581) continuation;
            int i5 = c28581.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28581.label = i5 - Integer.MIN_VALUE;
            } else {
                c28581 = new C28581(continuation);
            }
        }
        Object objResolve = c28581.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28581.label;
        if (i11 == 0) {
            ResultKt.b(objResolve);
            c28581.L$0 = context;
            c28581.L$1 = str;
            c28581.label = 1;
            objResolve = resolve(context, str, c28581);
            if (objResolve == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = (String) c28581.L$1;
            context = (Context) c28581.L$0;
            ResultKt.b(objResolve);
        }
        SendMessageTool.ResolveResult resolveResult = (SendMessageTool.ResolveResult) objResolve;
        if (!(resolveResult instanceof SendMessageTool.ResolveResult.Found)) {
            if (resolveResult instanceof SendMessageTool.ResolveResult.Ambiguous) {
                throw new AmbiguousContactException(str, ((SendMessageTool.ResolveResult.Ambiguous) resolveResult).getCandidates());
            }
            if (resolveResult == null) {
                return null;
            }
            throw new NoWhenBranchMatchedException();
        }
        String str2 = (String) g.Y0(((SendMessageTool.ResolveResult.Found) resolveResult).getContact().getPhones());
        if (str2 == null) {
            return null;
        }
        String strNormalizePhone = SendMessageTool.normalizePhone(str2, context);
        if (strNormalizePhone.length() == 0) {
            return null;
        }
        return strNormalizePhone;
    }

    @Nullable
    public final SendMessageTool.ResolvedContact resolveSync(@NotNull Context context, @NotNull String query) {
        Intrinsics.g(context, "context");
        Intrinsics.g(query, "query");
        return SendMessageTool.INSTANCE.resolveContact$instabridge_ai_sdk_release(context, query);
    }
}
