package x00;

import android.content.Context;
import android.content.res.Resources;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.TextStreamsKt;
import kotlin.jvm.functions.Function2;
import kotlin.text.Charsets;
import kotlinx.serialization.json.Json;
import p1.e1;
import t70.j0;

/* loaded from: classes4.dex */
public final class c extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ Context f94912t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ e1 f94913u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(Context context, Continuation continuation, e1 e1Var) {
        super(2, continuation);
        this.f94912t = context;
        this.f94913u = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new c(this.f94912t, continuation, this.f94913u);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((c) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Resources.NotFoundException, IOException {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        Json.Companion companion = Json.INSTANCE;
        Context context = this.f94912t;
        InputStream inputStreamOpenRawResource = context.getResources().openRawResource(2131951621);
        Charset charset = Charsets.f72000b;
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStreamOpenRawResource, charset), UserMetadata.MAX_INTERNAL_KEY_SIZE);
        try {
            String strB = TextStreamsKt.b(bufferedReader);
            bufferedReader.close();
            companion.getSerializersModule();
            np.c cVar = np.d.Companion;
            Object objDecodeFromString = companion.decodeFromString(cVar.serializer(), strB);
            bufferedReader = new BufferedReader(new InputStreamReader(context.getResources().openRawResource(2131951620), charset), UserMetadata.MAX_INTERNAL_KEY_SIZE);
            try {
                String strB2 = TextStreamsKt.b(bufferedReader);
                bufferedReader.close();
                companion.getSerializersModule();
                this.f94913u.setValue(new Pair(objDecodeFromString, companion.decodeFromString(cVar.serializer(), strB2)));
                return Unit.f71706a;
            } finally {
            }
        } finally {
            try {
                throw th;
            } finally {
            }
        }
    }
}
