package nova.branch.engage.sesame_lite.internal.android;

import a80.d;
import a80.e;
import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract;
import b.u4;
import b70.c;
import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import t70.y0;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\b\n\bÆ\u0002\u0018\u00002\u00020\u0001:\u0001\u0015B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003JB\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00050\f2\u0006\u0010\r\u001a\u00020\u00052\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0005H\u0082@¢\u0006\u0002\u0010\u000fJ*\u0010\u0010\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\r\u001a\u00020\u00052\b\b\u0002\u0010\u000e\u001a\u00020\u0005H\u0086@¢\u0006\u0002\u0010\u0011J \u0010\u0012\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\r\u001a\u00020\u0005H\u0086@¢\u0006\u0002\u0010\u0013J*\u0010\u0014\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\r\u001a\u00020\u00052\b\b\u0002\u0010\u000e\u001a\u00020\u0005H\u0086@¢\u0006\u0002\u0010\u0011R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/android/ContactsProviderHelper;", b.f42142b, "<init>", "()V", "MIME_WHATSAPP", b.f42142b, "getFromContactValue", "contentResolver", "Landroid/content/ContentResolver;", "uri", "Landroid/net/Uri;", "projection", b.f42142b, "lookupKey", "mimeType", "(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getPhoneNumber", "(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getEmailAddress", "(Landroid/content/ContentResolver;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getPhoneNumberAssociatedApp", "ContactValue", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ContactsProviderHelper {

    @NotNull
    public static final ContactsProviderHelper INSTANCE = new ContactsProviderHelper();

    @NotNull
    public static final String MIME_WHATSAPP = "vnd.android.cursor.item/vnd.com.whatsapp.profile";

    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\b\u0002\u0018\u0000 \u00112\u00020\u0001:\u0001\u0011B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bR\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0002\u0010\t\"\u0004\b\n\u0010\u000bR\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\r¨\u0006\u0012"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/android/ContactsProviderHelper$ContactValue;", b.f42142b, "isDefault", b.f42142b, "display", b.f42142b, "normalized", "<init>", "(ZLjava/lang/String;Ljava/lang/String;)V", "()Z", "setDefault", "(Z)V", "getDisplay", "()Ljava/lang/String;", "setDisplay", "(Ljava/lang/String;)V", "getNormalized", k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ContactValue {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion(null);

        @NotNull
        private static final Comparator<ContactValue> comparator = new a();

        @NotNull
        private String display;
        private boolean isDefault;

        @NotNull
        private final String normalized;

        @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/android/ContactsProviderHelper$ContactValue$Companion;", b.f42142b, "<init>", "()V", "comparator", "Ljava/util/Comparator;", "Lnova/branch/engage/sesame_lite/internal/android/ContactsProviderHelper$ContactValue;", "getComparator", "()Ljava/util/Comparator;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Companion {
            public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
                this();
            }

            @NotNull
            public final Comparator<ContactValue> getComparator() {
                return ContactValue.comparator;
            }

            private Companion() {
            }
        }

        public ContactValue(boolean z11, @NotNull String display, @NotNull String normalized) {
            Intrinsics.g(display, "display");
            Intrinsics.g(normalized, "normalized");
            this.isDefault = z11;
            this.display = display;
            this.normalized = normalized;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final int comparator$lambda$0(ContactValue contactValue, ContactValue contactValue2) {
            boolean z11 = contactValue.isDefault;
            if (!z11 || contactValue2.isDefault) {
                return (z11 || !contactValue2.isDefault) ? 0 : 1;
            }
            return -1;
        }

        @NotNull
        public final String getDisplay() {
            return this.display;
        }

        @NotNull
        public final String getNormalized() {
            return this.normalized;
        }

        /* renamed from: isDefault, reason: from getter */
        public final boolean getIsDefault() {
            return this.isDefault;
        }

        public final void setDefault(boolean z11) {
            this.isDefault = z11;
        }

        public final void setDisplay(@NotNull String str) {
            Intrinsics.g(str, "<set-?>");
            this.display = str;
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "nova.branch.engage.sesame_lite.internal.android.ContactsProviderHelper", f = "ContactsProviderHelper.kt", l = {37}, m = "getFromContactValue")
    /* renamed from: nova.branch.engage.sesame_lite.internal.android.ContactsProviderHelper$getFromContactValue$1, reason: invalid class name */
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
            return ContactsProviderHelper.this.getFromContactValue(null, null, null, null, null, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "nova.branch.engage.sesame_lite.internal.android.ContactsProviderHelper$getFromContactValue$2", f = "ContactsProviderHelper.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: nova.branch.engage.sesame_lite.internal.android.ContactsProviderHelper$getFromContactValue$2, reason: invalid class name */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ ContentResolver $contentResolver;
        final /* synthetic */ List<ContactValue> $phones;
        final /* synthetic */ String[] $projection;
        final /* synthetic */ Ref.ObjectRef<String> $selection;
        final /* synthetic */ String[] $selectionArgs;
        final /* synthetic */ Uri $uri;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass2(ContentResolver contentResolver, Uri uri, String[] strArr, Ref.ObjectRef<String> objectRef, String[] strArr2, List<ContactValue> list, Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
            this.$contentResolver = contentResolver;
            this.$uri = uri;
            this.$projection = strArr;
            this.$selection = objectRef;
            this.$selectionArgs = strArr2;
            this.$phones = list;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass2(this.$contentResolver, this.$uri, this.$projection, this.$selection, this.$selectionArgs, this.$phones, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws IOException {
            String string;
            Object next;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            Cursor cursorQuery = this.$contentResolver.query(this.$uri, this.$projection, (String) this.$selection.f71863a, this.$selectionArgs, null);
            if (cursorQuery == null) {
                return null;
            }
            String[] strArr = this.$projection;
            List<ContactValue> list = this.$phones;
            while (cursorQuery.moveToNext()) {
                try {
                    String string2 = cursorQuery.getString(0);
                    if (string2 != null) {
                        if (string2.length() == 0) {
                            string2 = null;
                        }
                        if (string2 != null) {
                            boolean z11 = cursorQuery.getInt(1) == 0;
                            if (strArr.length != 3 || (string = cursorQuery.getString(2)) == null) {
                                string = string2;
                            }
                            ContactValue contactValue = new ContactValue(z11, string2, string);
                            Iterator<T> it = list.iterator();
                            while (true) {
                                if (!it.hasNext()) {
                                    next = null;
                                    break;
                                }
                                next = it.next();
                                if (Intrinsics.b(((ContactValue) next).getNormalized(), contactValue.getNormalized())) {
                                    break;
                                }
                            }
                            ContactValue contactValue2 = (ContactValue) next;
                            if (contactValue2 == null) {
                                list.add(contactValue);
                            } else {
                                String display = contactValue.getDisplay();
                                if (!(display.length() > contactValue2.getDisplay().length())) {
                                    display = null;
                                }
                                if (display == null) {
                                    display = contactValue2.getDisplay();
                                }
                                contactValue2.setDisplay(display);
                                contactValue2.setDefault(contactValue2.getIsDefault() || contactValue.getIsDefault());
                            }
                        }
                    }
                } finally {
                }
            }
            Unit unit = Unit.f71706a;
            cursorQuery.close();
            return unit;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((AnonymousClass2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    private ContactsProviderHelper() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object getFromContactValue(ContentResolver contentResolver, Uri uri, String[] strArr, String str, String str2, Continuation<? super String> continuation) {
        AnonymousClass1 anonymousClass1;
        String[] strArr2;
        List list;
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
            Ref.ObjectRef objectRefL = u4.l(obj);
            objectRefL.f71863a = "lookup = ?";
            if (str2 == null) {
                strArr2 = new String[]{str};
            } else {
                objectRefL.f71863a = "lookup = ? AND mimetype = ?";
                strArr2 = new String[]{str, str2};
            }
            String[] strArr3 = strArr2;
            ArrayList arrayList = new ArrayList();
            e eVar = y0.f88884a;
            d dVar = d.f488c;
            AnonymousClass2 anonymousClass2 = new AnonymousClass2(contentResolver, uri, strArr, objectRefL, strArr3, arrayList, null);
            anonymousClass1.L$0 = arrayList;
            anonymousClass1.label = 1;
            if (m0.y(dVar, anonymousClass2, anonymousClass1) == coroutineSingletons) {
                return coroutineSingletons;
            }
            list = arrayList;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            list = (List) anonymousClass1.L$0;
            ResultKt.b(obj);
        }
        if (list.isEmpty()) {
            return null;
        }
        c.y0(list, ContactValue.INSTANCE.getComparator());
        return ((ContactValue) g.W0(list)).getNormalized();
    }

    public static /* synthetic */ Object getFromContactValue$default(ContactsProviderHelper contactsProviderHelper, ContentResolver contentResolver, Uri uri, String[] strArr, String str, String str2, Continuation continuation, int i5, Object obj) {
        if ((i5 & 16) != 0) {
            str2 = null;
        }
        return contactsProviderHelper.getFromContactValue(contentResolver, uri, strArr, str, str2, continuation);
    }

    public static /* synthetic */ Object getPhoneNumber$default(ContactsProviderHelper contactsProviderHelper, ContentResolver contentResolver, String str, String str2, Continuation continuation, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            str2 = "vnd.android.cursor.item/phone_v2";
        }
        return contactsProviderHelper.getPhoneNumber(contentResolver, str, str2, continuation);
    }

    public static /* synthetic */ Object getPhoneNumberAssociatedApp$default(ContactsProviderHelper contactsProviderHelper, ContentResolver contentResolver, String str, String str2, Continuation continuation, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            str2 = "vnd.android.cursor.item/phone_v2";
        }
        return contactsProviderHelper.getPhoneNumberAssociatedApp(contentResolver, str, str2, continuation);
    }

    @Nullable
    public final Object getEmailAddress(@NotNull ContentResolver contentResolver, @NotNull String str, @NotNull Continuation<? super String> continuation) {
        Uri CONTENT_URI = ContactsContract.CommonDataKinds.Email.CONTENT_URI;
        Intrinsics.f(CONTENT_URI, "CONTENT_URI");
        return getFromContactValue$default(this, contentResolver, CONTENT_URI, new String[]{"data1", "is_primary"}, str, null, continuation, 16, null);
    }

    @Nullable
    public final Object getPhoneNumber(@NotNull ContentResolver contentResolver, @NotNull String str, @NotNull String str2, @NotNull Continuation<? super String> continuation) {
        Uri CONTENT_URI = ContactsContract.CommonDataKinds.Phone.CONTENT_URI;
        Intrinsics.f(CONTENT_URI, "CONTENT_URI");
        return getFromContactValue(contentResolver, CONTENT_URI, new String[]{"data1", "is_primary", "data4"}, str, str2, continuation);
    }

    @Nullable
    public final Object getPhoneNumberAssociatedApp(@NotNull ContentResolver contentResolver, @NotNull String str, @NotNull String str2, @NotNull Continuation<? super String> continuation) {
        Uri CONTENT_URI = ContactsContract.Data.CONTENT_URI;
        Intrinsics.f(CONTENT_URI, "CONTENT_URI");
        return getFromContactValue(contentResolver, CONTENT_URI, new String[]{"data1", "is_primary", "data4"}, str, str2, continuation);
    }
}
