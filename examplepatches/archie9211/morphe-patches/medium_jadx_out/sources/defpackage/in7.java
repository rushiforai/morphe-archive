package defpackage;

import gen.model.AddMembership;
import gen.model.AuthInfo;
import gen.model.Quote;
import gen.model.UploadInfo;
import gen.model.request.AcctCreateRequestBody;
import gen.model.request.AcctSignInContent;
import gen.model.request.CreateInResponseToQuoteRequest;
import gen.model.request.HasSeenIcelandOnboardingRequestBody;
import gen.model.request.PublishPostRequest;
import gen.model.response.AcctCreateResponse;
import gen.model.response.AddMembershipResponse;
import gen.model.response.CreateQuoteResponse;
import gen.model.response.FetchUsersForTypeaheadResponse;
import gen.model.response.GenericActionResponse;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000Æ\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J \u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0006\u0010\u0007J \u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\u00042\b\b\u0001\u0010\t\u001a\u00020\bH§@¢\u0006\u0004\b\n\u0010\u000bJ\u0016\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u0004H§@¢\u0006\u0004\b\r\u0010\u000eJ \u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00112\b\b\u0001\u0010\u0010\u001a\u00020\u000fH§@¢\u0006\u0004\b\u0013\u0010\u0014J \u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00170\u00112\b\b\u0001\u0010\u0016\u001a\u00020\u0015H§@¢\u0006\u0004\b\u0018\u0010\u0019J \u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u001c0\u00112\b\b\u0001\u0010\u001b\u001a\u00020\u001aH§@¢\u0006\u0004\b\u001d\u0010\u001eJ \u0010\"\u001a\b\u0012\u0004\u0012\u00020!0\u00112\b\b\u0001\u0010 \u001a\u00020\u001fH§@¢\u0006\u0004\b\"\u0010#J \u0010'\u001a\b\u0012\u0004\u0012\u00020&0\u00042\b\b\u0001\u0010%\u001a\u00020$H§@¢\u0006\u0004\b'\u0010(J\u0016\u0010*\u001a\b\u0012\u0004\u0012\u00020)0\u0004H§@¢\u0006\u0004\b*\u0010\u000eJ \u0010,\u001a\b\u0012\u0004\u0012\u00020&0\u00042\b\b\u0001\u0010%\u001a\u00020+H§@¢\u0006\u0004\b,\u0010-J\u0016\u0010.\u001a\b\u0012\u0004\u0012\u00020)0\u0004H§@¢\u0006\u0004\b.\u0010\u000eJ \u00102\u001a\b\u0012\u0004\u0012\u0002010\u00112\b\b\u0001\u00100\u001a\u00020/H§@¢\u0006\u0004\b2\u00103J*\u00107\u001a\b\u0012\u0004\u0012\u0002060\u00112\b\b\u0001\u00100\u001a\u00020/2\b\b\u0001\u00105\u001a\u000204H§@¢\u0006\u0004\b7\u00108J:\u0010<\u001a\b\u0012\u0004\u0012\u00020;0\u00112\n\b\u0001\u0010\u0018\u001a\u0004\u0018\u00010/2\n\b\u0001\u00109\u001a\u0004\u0018\u00010/2\n\b\u0001\u0010:\u001a\u0004\u0018\u00010/H§@¢\u0006\u0004\b<\u0010=J,\u0010@\u001a\b\u0012\u0004\u0012\u0002010\u00112\u0014\b\u0001\u0010?\u001a\u000e\u0012\u0004\u0012\u00020/\u0012\u0004\u0012\u00020\u00010>H§@¢\u0006\u0004\b@\u0010AJ6\u0010B\u001a\b\u0012\u0004\u0012\u0002010\u00112\b\b\u0001\u00100\u001a\u00020/2\u0014\b\u0001\u0010?\u001a\u000e\u0012\u0004\u0012\u00020/\u0012\u0004\u0012\u00020\u00010>H§@¢\u0006\u0004\bB\u0010CJ \u0010E\u001a\b\u0012\u0004\u0012\u0002010\u00112\b\b\u0001\u00105\u001a\u00020DH§@¢\u0006\u0004\bE\u0010FJ*\u0010H\u001a\b\u0012\u0004\u0012\u0002010\u00112\b\b\u0001\u00100\u001a\u00020/2\b\b\u0001\u0010\t\u001a\u00020GH§@¢\u0006\u0004\bH\u0010IJ*\u0010K\u001a\b\u0012\u0004\u0012\u0002010\u00112\b\b\u0001\u00100\u001a\u00020/2\b\b\u0001\u0010\t\u001a\u00020JH§@¢\u0006\u0004\bK\u0010L¨\u0006MÀ\u0006\u0003"}, d2 = {"Lin7;", "", "Lsbb;", "uploadedFile", "Lnn7;", "Lgen/model/UploadInfo;", "e", "(Lsbb;Ln92;)Ljava/lang/Object;", "Lw5e;", "request", "k", "(Lw5e;Ln92;)Ljava/lang/Object;", "Le18;", "j", "(Ln92;)Ljava/lang/Object;", "Lgen/model/AddMembership;", "addMembership", "Ljn7;", "Lgen/model/response/AddMembershipResponse;", "b", "(Lgen/model/AddMembership;Ln92;)Ljava/lang/Object;", "Lgen/model/request/AcctSignInContent;", "content", "Lgen/model/AuthInfo;", "q", "(Lgen/model/request/AcctSignInContent;Ln92;)Ljava/lang/Object;", "Lgen/model/request/AcctCreateRequestBody;", "acctCreate", "Lgen/model/response/AcctCreateResponse;", "m", "(Lgen/model/request/AcctCreateRequestBody;Ln92;)Ljava/lang/Object;", "Lgen/model/request/HasSeenIcelandOnboardingRequestBody;", "payload", "Lgen/model/response/GenericActionResponse;", "l", "(Lgen/model/request/HasSeenIcelandOnboardingRequestBody;Ln92;)Ljava/lang/Object;", "Lz84;", "oAuthData", "Lc1e;", "p", "(Lz84;Ln92;)Ljava/lang/Object;", "", "f", "Ldaf;", "d", "(Ldaf;Ln92;)Ljava/lang/Object;", "n", "", "postId", "Lmq3;", "o", "(Ljava/lang/String;Ln92;)Ljava/lang/Object;", "Lgen/model/Quote;", "quote", "Lgen/model/response/CreateQuoteResponse;", "h", "(Ljava/lang/String;Lgen/model/Quote;Ln92;)Ljava/lang/Object;", "source", "collectionId", "Lgen/model/response/FetchUsersForTypeaheadResponse;", "g", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ln92;)Ljava/lang/Object;", "", "body", "r", "(Ljava/util/Map;Ln92;)Ljava/lang/Object;", "c", "(Ljava/lang/String;Ljava/util/Map;Ln92;)Ljava/lang/Object;", "Lgen/model/request/CreateInResponseToQuoteRequest;", "a", "(Lgen/model/request/CreateInResponseToQuoteRequest;Ln92;)Ljava/lang/Object;", "Lwa;", "s", "(Ljava/lang/String;Lwa;Ln92;)Ljava/lang/Object;", "Lgen/model/request/PublishPostRequest;", "i", "(Ljava/lang/String;Lgen/model/request/PublishPostRequest;Ln92;)Ljava/lang/Object;", "data_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public interface in7 {
    @ux8("/new-story")
    Object a(@xs0 CreateInResponseToQuoteRequest createInResponseToQuoteRequest, n92<? super jn7<mq3>> n92Var);

    @ux8("/_/api/memberships/members")
    Object b(@xs0 AddMembership addMembership, n92<? super jn7<AddMembershipResponse>> n92Var);

    @ux8("/p/{postId}/responses")
    Object c(@h59("postId") String str, @xs0 Map<String, Object> map, n92<jn7<mq3>> n92Var);

    @ux8("/_/api/twitter/connect")
    Object d(@xs0 daf dafVar, n92<? super nn7<c1e>> n92Var);

    @y58
    @ux8("/_/upload")
    Object e(@s49("uploadedFile\"; filename=\"image") sbb sbbVar, n92<? super nn7<UploadInfo>> n92Var);

    @sm2("/_/api/facebook/connect")
    Object f(n92<? super nn7<Boolean>> n92Var);

    @g65("/_/api/users")
    Object g(@tqa("q") String str, @tqa("source") String str2, @tqa("collectionId") String str3, n92<? super jn7<FetchUsersForTypeaheadResponse>> n92Var);

    @ux8("/p/{postId}/quotes")
    Object h(@h59("postId") String str, @xs0 Quote quote, n92<? super jn7<CreateQuoteResponse>> n92Var);

    @ux8("/p/{postId}/publish")
    Object i(@h59("postId") String str, @xs0 PublishPostRequest publishPostRequest, n92<? super jn7<mq3>> n92Var);

    @g65("/_/android/config")
    Object j(n92<? super nn7<e18>> n92Var);

    @ux8("/_/upload-url")
    Object k(@xs0 w5e w5eVar, n92<? super nn7<UploadInfo>> n92Var);

    @vx8("/me/has-seen-iceland-onboarding")
    Object l(@xs0 HasSeenIcelandOnboardingRequestBody hasSeenIcelandOnboardingRequestBody, n92<? super jn7<GenericActionResponse>> n92Var);

    @ux8("/m/account/create")
    Object m(@xs0 AcctCreateRequestBody acctCreateRequestBody, n92<? super jn7<AcctCreateResponse>> n92Var);

    @sm2("/_/api/twitter/connect")
    Object n(n92<? super nn7<Boolean>> n92Var);

    @g65("/_/api/posts/{postId}/draft")
    Object o(@h59("postId") String str, n92<? super jn7<mq3>> n92Var);

    @ux8("/_/api/facebook/connect")
    Object p(@xs0 z84 z84Var, n92<? super nn7<c1e>> n92Var);

    @ux8("/m/signin")
    Object q(@xs0 AcctSignInContent acctSignInContent, n92<? super jn7<AuthInfo>> n92Var);

    @ux8("/p/new-post")
    Object r(@xs0 Map<String, Object> map, n92<jn7<mq3>> n92Var);

    @ux8("/p/{postId}/deltas")
    Object s(@h59("postId") String str, @xs0 wa waVar, n92<? super jn7<mq3>> n92Var);
}
