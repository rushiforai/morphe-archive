package q20;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {
    public Object A;
    public JSONObject B;
    public JSONArray C;
    public String D;
    public long E;
    public long F;
    public int G;
    public int H;
    public /* synthetic */ Object I;
    public final /* synthetic */ p J;
    public int K;

    /* renamed from: t, reason: collision with root package name */
    public p f83505t;

    /* renamed from: u, reason: collision with root package name */
    public ArrayList f83506u;

    /* renamed from: v, reason: collision with root package name */
    public Map f83507v;

    /* renamed from: w, reason: collision with root package name */
    public HashSet f83508w;

    /* renamed from: x, reason: collision with root package name */
    public Ref.LongRef f83509x;

    /* renamed from: y, reason: collision with root package name */
    public Ref.LongRef f83510y;

    /* renamed from: z, reason: collision with root package name */
    public Ref.ObjectRef f83511z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.J = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.I = obj;
        this.K |= Integer.MIN_VALUE;
        return p.l(this.J, null, this);
    }
}
