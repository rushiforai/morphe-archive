.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;",
        ">;"
    }
.end annotation


# static fields
.field public static I:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public A:Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;

.field public B:Ll/dji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dji<",
            "Lcom/p1/mobile/putong/feed/data/NewMomentDraft;",
            ">;"
        }
    .end annotation
.end field

.field public C:Ll/dji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dji<",
            "Lcom/p1/mobile/putong/feed/data/NewMomentDraft;",
            ">;"
        }
    .end annotation
.end field

.field public D:Ll/jxd0;

.field public E:Z

.field public F:Ll/yaj0;

.field public G:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public H:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/NotifyUsers;",
            ">;"
        }
    .end annotation
.end field

.field public final a:I

.field public final b:I

.field public c:I

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation
.end field

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Z

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Z

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Lcom/p1/mobile/putong/data/DoublePair;

.field public p:Lcom/p1/mobile/putong/data/Audio;

.field public q:Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;

.field public r:Ljava/lang/String;

.field public s:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public t:Ljava/lang/String;

.field public u:Z

.field public v:[D

.field public w:Z

.field public x:Lcom/p1/mobile/putong/data/BubbleInfo;

.field public y:Lcom/p1/mobile/putong/data/BubbleInfo;

.field public z:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->I:Lrx/subjects/b;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 6

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->a:I

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->b:I

    .line 9
    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->c:I

    .line 11
    .line 12
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->d:Lrx/subjects/a;

    .line 17
    .line 18
    new-instance v0, Ll/dji;

    .line 19
    .line 20
    new-instance v1, Ll/vod;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "new_moment_draft_text"

    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    invoke-direct {v1, v3, v4, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object v2, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    const/4 v3, -0x1

    .line 39
    invoke-direct {v0, v1, v3, v2}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->B:Ll/dji;

    .line 43
    .line 44
    new-instance v0, Ll/dji;

    .line 45
    .line 46
    new-instance v1, Ll/vod;

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const-string v5, "new_moment_draft_media"

    .line 57
    .line 58
    invoke-direct {v1, v5, v4, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    sget-object v2, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-direct {v0, v1, v3, v2}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->C:Ll/dji;

    .line 67
    .line 68
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 69
    .line 70
    iget-object v0, v0, Ll/jka;->U:Ll/jxd0;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->D:Ll/jxd0;

    .line 73
    .line 74
    new-instance v0, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->G:Ljava/util/ArrayList;

    .line 80
    .line 81
    new-instance v0, Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->H:Ljava/util/ArrayList;

    .line 87
    .line 88
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 89
    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->z:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 91
    .line 92
    return-void
.end method

.method public static synthetic A0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic C0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->y:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-object v0, Ll/vo5;->g:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->w:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public static synthetic D0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic E0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic F0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic G0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->U:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic H0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->u1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic I0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic L0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->s1(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    return-void
.end method

.method public static synthetic N0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->q1(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static c1()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->I:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private f1(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->Z:Ll/a4j;

    .line 2
    .line 3
    const-string v0, "p_user_passive_show_nearby"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/a4j;->Q(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/rc40;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/rc40;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/tc40;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/tc40;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic g0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Emotion;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->E1(Ll/x20;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->x1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->r1(Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/feed/data/NotifyUsers;Lcom/p1/mobile/putong/feed/data/NotifyUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NotifyUser;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic l0(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->I:Lrx/subjects/b;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->v1(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->B1(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->t1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/Emotion;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method private p1(Ljava/util/ArrayList;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/asx;->b()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/asx;->d()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_4

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 42
    .line 43
    instance-of v3, v2, Lcom/p1/mobile/putong/data/Video;

    .line 44
    .line 45
    if-eqz v3, :cond_2

    .line 46
    .line 47
    return p0

    .line 48
    :cond_2
    instance-of v3, v2, Lcom/p1/mobile/putong/data/Picture;

    .line 49
    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 53
    .line 54
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    .line 55
    .line 56
    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-boolean p0, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 60
    .line 61
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v4}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-static {v4, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->nullCheck()V

    .line 71
    .line 72
    .line 73
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 74
    .line 75
    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 76
    .line 77
    iput v5, v4, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 78
    .line 79
    iget v3, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 80
    .line 81
    iput v3, v4, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 82
    .line 83
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->bigAspectRate()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->isHorizontal()Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    const/4 v5, 0x0

    .line 92
    if-eqz v4, :cond_3

    .line 93
    .line 94
    if-le v3, v0, :cond_3

    .line 95
    .line 96
    const-string p0, "\u56fe\u7247\u5bbd\u5ea6\u8d85\u51fa\u4e0a\u9650"

    .line 97
    .line 98
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return v5

    .line 102
    :cond_3
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->isHorizontal()Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-nez v2, :cond_1

    .line 107
    .line 108
    if-le v3, v1, :cond_1

    .line 109
    .line 110
    const-string p0, "\u56fe\u7247\u957f\u5ea6\u8d85\u51fa\u4e0a\u9650"

    .line 111
    .line 112
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return v5

    .line 116
    :cond_4
    :goto_0
    return p0
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/dji$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->D1(Ll/dji$a;)V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->C1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic s0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicVoteType()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic u0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jka;->d8()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method private synthetic u1(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->D0(Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->x0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Lcom/p1/mobile/putong/data/Audio;Ljava/lang/String;Ljava/util/ArrayList;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->F1(Lcom/p1/mobile/putong/data/Audio;Ljava/lang/String;Ljava/util/ArrayList;Ll/x20;)V

    return-void
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/g90;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->H1(Ll/g90;)V

    return-void
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->z1(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic z1(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->C1(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic B1(Ljava/util/Map;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 16
    .line 17
    sget-object v0, Ll/owi;->g:Ll/wyd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    const-class v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 54
    .line 55
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_0

    .line 60
    .line 61
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;->emotions:Ljava/util/List;

    .line 62
    .line 63
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-nez v2, :cond_0

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;->emotions:Ljava/util/List;

    .line 70
    .line 71
    new-instance v2, Ll/zc40;

    .line 72
    .line 73
    invoke-direct {v2, p1}, Ll/zc40;-><init>(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Lcom/p1/mobile/putong/data/Emotion;

    .line 81
    .line 82
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_0

    .line 87
    .line 88
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 89
    .line 90
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 91
    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 93
    .line 94
    :cond_1
    if-eqz p1, :cond_2

    .line 95
    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->y:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 97
    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->x:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 99
    .line 100
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 101
    .line 102
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Y1()V

    .line 105
    .line 106
    .line 107
    :cond_2
    return-void
.end method

.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->P0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C1(Ll/pf60;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 30
    .line 31
    new-instance v3, Ll/nc40;

    .line 32
    .line 33
    invoke-direct {v3, v1}, Ll/nc40;-><init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v2, v3}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    iput-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->T1(Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic D1(Ll/dji$a;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p1, Ll/dji$a;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->topics:Ljava/util/List;

    .line 16
    .line 17
    check-cast v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->S1(Ljava/util/ArrayList;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 31
    .line 32
    iget-object p1, p1, Ll/dji$a;->a:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->u1(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic E1(Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->P(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic F1(Lcom/p1/mobile/putong/data/Audio;Ljava/lang/String;Ljava/util/ArrayList;Ll/x20;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->o1(Ljava/util/ArrayList;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->new_()Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object v0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 36
    .line 37
    iput-object p2, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

    .line 38
    .line 39
    iput-object p3, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->topics:Ljava/util/List;

    .line 40
    .line 41
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->c:I

    .line 42
    .line 43
    const/4 p3, 0x2

    .line 44
    const/4 v1, 0x1

    .line 45
    if-ne p2, v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-lez p2, :cond_2

    .line 52
    .line 53
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->c:I

    .line 54
    .line 55
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 56
    .line 57
    iget-object p2, p2, Ll/jka;->V:Ll/jxd0;

    .line 58
    .line 59
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {p2, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->c:I

    .line 66
    .line 67
    if-ne p2, p3, :cond_3

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-nez p2, :cond_3

    .line 74
    .line 75
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->c:I

    .line 76
    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->D:Ll/jxd0;

    .line 78
    .line 79
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 80
    .line 81
    invoke-virtual {p2, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    :cond_3
    :goto_0
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->c:I

    .line 85
    .line 86
    iput p2, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->type:I

    .line 87
    .line 88
    if-ne p2, v1, :cond_4

    .line 89
    .line 90
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->B:Ll/dji;

    .line 91
    .line 92
    invoke-virtual {p2, p1}, Ll/dji;->p(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 96
    .line 97
    iget-object p1, p1, Ll/jka;->V:Ll/jxd0;

    .line 98
    .line 99
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 100
    .line 101
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    if-ne p2, p3, :cond_5

    .line 106
    .line 107
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->C:Ll/dji;

    .line 108
    .line 109
    invoke-virtual {p2, p1}, Ll/dji;->p(Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->D:Ll/jxd0;

    .line 113
    .line 114
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    :cond_5
    :goto_1
    new-instance p1, Ll/ic40;

    .line 120
    .line 121
    invoke-direct {p1, p0, p4}, Ll/ic40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/x20;)V

    .line 122
    .line 123
    .line 124
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public final synthetic H1(Ll/g90;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/g90;->c()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->m:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/g90;->a()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->n:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/g90;->b()Lcom/p1/mobile/putong/data/DoublePair;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->o:Lcom/p1/mobile/putong/data/DoublePair;

    .line 21
    .line 22
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->R1()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public I1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->p:Lcom/p1/mobile/putong/data/Audio;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public J1(Landroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    const-string v1, "extra_images"

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ljava/util/ArrayList;

    .line 28
    .line 29
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->l:Z

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move-object v0, p1

    .line 38
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->d:Lrx/subjects/a;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->z1(Ljava/util/ArrayList;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J1()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 65
    .line 66
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->f0(Ljava/util/ArrayList;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public L1(Ljava/lang/String;Lcom/p1/mobile/putong/data/MessageLocation;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->y:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->x:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->x:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->y:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 24
    .line 25
    iget-object v3, v3, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    move v0, v2

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v0, v1

    .line 36
    :goto_0
    invoke-static {}, Ll/cmg;->u0()Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->x:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 43
    .line 44
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->N1()V

    .line 53
    .line 54
    .line 55
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 56
    .line 57
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Moment;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->o1(Ljava/util/ArrayList;)Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-nez v4, :cond_2

    .line 69
    .line 70
    new-instance v3, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    :cond_2
    invoke-direct {p0, v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->p1(Ljava/util/ArrayList;)Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-nez v4, :cond_3

    .line 80
    .line 81
    return v1

    .line 82
    :cond_3
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_4

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->I1()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_4

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->p:Lcom/p1/mobile/putong/data/Audio;

    .line 95
    .line 96
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    :cond_4
    iput-object v3, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 100
    .line 101
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 102
    .line 103
    iput-object p2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 104
    .line 105
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->r:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-nez p2, :cond_5

    .line 112
    .line 113
    new-instance p2, Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 114
    .line 115
    invoke-direct {p2}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;-><init>()V

    .line 116
    .line 117
    .line 118
    iput-object p2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->r:Ljava/lang/String;

    .line 121
    .line 122
    iput-object v1, p2, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 123
    .line 124
    :cond_5
    new-instance p2, Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    :cond_6
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    if-eqz v3, :cond_7

    .line 138
    .line 139
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 144
    .line 145
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    if-eqz v4, :cond_6

    .line 150
    .line 151
    iget-object v4, v3, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 152
    .line 153
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    if-eqz v4, :cond_6

    .line 158
    .line 159
    iget-object v4, v3, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 160
    .line 161
    iget-object v4, v4, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    if-nez v4, :cond_6

    .line 168
    .line 169
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 170
    .line 171
    iget-object v3, v3, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 172
    .line 173
    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_7
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-nez v1, :cond_8

    .line 182
    .line 183
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/feed/data/Moment;->setCameraStickerIds(Ljava/util/List;)V

    .line 184
    .line 185
    .line 186
    :cond_8
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 187
    .line 188
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result p2

    .line 192
    if-eqz p2, :cond_a

    .line 193
    .line 194
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 195
    .line 196
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    if-lez p2, :cond_a

    .line 201
    .line 202
    new-instance p2, Ljava/util/ArrayList;

    .line 203
    .line 204
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 205
    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 208
    .line 209
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    if-eqz v3, :cond_9

    .line 218
    .line 219
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    check-cast v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 224
    .line 225
    new-instance v4, Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 226
    .line 227
    invoke-direct {v4}, Lcom/p1/mobile/putong/data/TopicMomentIdBox;-><init>()V

    .line 228
    .line 229
    .line 230
    iget-object v5, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 231
    .line 232
    iput-object v5, v4, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->id:Ljava/lang/String;

    .line 233
    .line 234
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 235
    .line 236
    iput-object v3, v4, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->name:Ljava/lang/String;

    .line 237
    .line 238
    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    goto :goto_2

    .line 242
    :cond_9
    iput-object p2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 243
    .line 244
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 245
    .line 246
    iput-object p2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->mTopicList:Ljava/util/List;

    .line 247
    .line 248
    :cond_a
    invoke-static {}, Ll/nt00;->k()Ll/nt00;

    .line 249
    .line 250
    .line 251
    move-result-object p2

    .line 252
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 253
    .line 254
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 255
    .line 256
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->s0()I

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    invoke-virtual {p2, v1}, Ll/nt00;->o(I)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object p2

    .line 264
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 265
    .line 266
    .line 267
    move-result-object p2

    .line 268
    iput-object p2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 269
    .line 270
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->f1(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Moment;->nullCheck()V

    .line 274
    .line 275
    .line 276
    invoke-static {}, Ll/cmg;->R()Z

    .line 277
    .line 278
    .line 279
    move-result p1

    .line 280
    const/4 p2, 0x0

    .line 281
    if-eqz p1, :cond_c

    .line 282
    .line 283
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 284
    .line 285
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 286
    .line 287
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->y:Lv/VCheckBox;

    .line 288
    .line 289
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 290
    .line 291
    .line 292
    move-result p1

    .line 293
    if-eqz p1, :cond_b

    .line 294
    .line 295
    const-string p1, "allow"

    .line 296
    .line 297
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    goto :goto_3

    .line 302
    :cond_b
    const-string p1, "disallow"

    .line 303
    .line 304
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    :goto_3
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 309
    .line 310
    goto :goto_4

    .line 311
    :cond_c
    iput-object p2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 312
    .line 313
    :goto_4
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 314
    .line 315
    iput-object p2, p1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 316
    .line 317
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->q:Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;

    .line 318
    .line 319
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result p1

    .line 323
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 324
    .line 325
    if-eqz p1, :cond_d

    .line 326
    .line 327
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->q:Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;

    .line 328
    .line 329
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 330
    .line 331
    goto :goto_5

    .line 332
    :cond_d
    iput-object p2, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 333
    .line 334
    :goto_5
    invoke-static {}, Ll/cmg;->x()Z

    .line 335
    .line 336
    .line 337
    move-result p1

    .line 338
    if-eqz p1, :cond_10

    .line 339
    .line 340
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->H:Ljava/util/ArrayList;

    .line 341
    .line 342
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 343
    .line 344
    .line 345
    move-result p1

    .line 346
    if-nez p1, :cond_10

    .line 347
    .line 348
    new-instance p1, Ljava/util/ArrayList;

    .line 349
    .line 350
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 351
    .line 352
    .line 353
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->H:Ljava/util/ArrayList;

    .line 354
    .line 355
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 356
    .line 357
    .line 358
    move-result-object v1

    .line 359
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 360
    .line 361
    .line 362
    move-result v3

    .line 363
    if-eqz v3, :cond_f

    .line 364
    .line 365
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 366
    .line 367
    .line 368
    move-result-object v3

    .line 369
    check-cast v3, Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 370
    .line 371
    new-instance v4, Ll/qc40;

    .line 372
    .line 373
    invoke-direct {v4, v3}, Ll/qc40;-><init>(Lcom/p1/mobile/putong/feed/data/NotifyUsers;)V

    .line 374
    .line 375
    .line 376
    invoke-static {p1, v4}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 377
    .line 378
    .line 379
    move-result v4

    .line 380
    if-eqz v4, :cond_e

    .line 381
    .line 382
    goto :goto_6

    .line 383
    :cond_e
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/NotifyUser;->new_()Lcom/p1/mobile/putong/feed/data/NotifyUser;

    .line 384
    .line 385
    .line 386
    move-result-object v4

    .line 387
    iget-object v5, v3, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->userId:Ljava/lang/String;

    .line 388
    .line 389
    iput-object v5, v4, Lcom/p1/mobile/putong/feed/data/NotifyUser;->userId:Ljava/lang/String;

    .line 390
    .line 391
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->name:Ljava/lang/String;

    .line 392
    .line 393
    iput-object v3, v4, Lcom/p1/mobile/putong/feed/data/NotifyUser;->name:Ljava/lang/String;

    .line 394
    .line 395
    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    goto :goto_6

    .line 399
    :cond_f
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 400
    .line 401
    :cond_10
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 402
    .line 403
    .line 404
    move-result-object p1

    .line 405
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 406
    .line 407
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 408
    .line 409
    const-string v1, "share"

    .line 410
    .line 411
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    move-result p1

    .line 415
    if-eqz p1, :cond_12

    .line 416
    .line 417
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->q:Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;

    .line 418
    .line 419
    if-nez p1, :cond_11

    .line 420
    .line 421
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 422
    .line 423
    .line 424
    move-result-object p1

    .line 425
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 426
    .line 427
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 428
    .line 429
    goto :goto_7

    .line 430
    :cond_11
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->name:Ljava/lang/String;

    .line 431
    .line 432
    goto :goto_7

    .line 433
    :cond_12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 434
    .line 435
    .line 436
    move-result-object p1

    .line 437
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 438
    .line 439
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 440
    .line 441
    :goto_7
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->from:Ljava/lang/String;

    .line 442
    .line 443
    invoke-static {}, Ll/cmg;->l0()Z

    .line 444
    .line 445
    .line 446
    move-result p1

    .line 447
    if-eqz p1, :cond_13

    .line 448
    .line 449
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->u:Z

    .line 450
    .line 451
    iput-boolean p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isNewUserAIMoment:Z

    .line 452
    .line 453
    :cond_13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 454
    .line 455
    .line 456
    move-result-object p1

    .line 457
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 458
    .line 459
    .line 460
    move-result-object v3

    .line 461
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 462
    .line 463
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 464
    .line 465
    invoke-static {p1, v0, v3}, Ll/cn40;->T(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    invoke-static {}, Ll/cmg;->l0()Z

    .line 469
    .line 470
    .line 471
    move-result p1

    .line 472
    if-eqz p1, :cond_14

    .line 473
    .line 474
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->u:Z

    .line 475
    .line 476
    if-eqz p1, :cond_14

    .line 477
    .line 478
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 479
    .line 480
    iget-object p1, p1, Ll/jka;->A1:Lrx/subjects/a;

    .line 481
    .line 482
    sget-object v3, Ll/uxj0;->a:Ll/uxj0;

    .line 483
    .line 484
    invoke-virtual {p1, v3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 485
    .line 486
    .line 487
    :cond_14
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 488
    .line 489
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 490
    .line 491
    .line 492
    move-result p1

    .line 493
    if-nez p1, :cond_15

    .line 494
    .line 495
    invoke-static {}, Ll/dth;->i()V

    .line 496
    .line 497
    .line 498
    :cond_15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 499
    .line 500
    .line 501
    move-result-object p1

    .line 502
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 503
    .line 504
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 505
    .line 506
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 507
    .line 508
    .line 509
    move-result p1

    .line 510
    if-nez p1, :cond_16

    .line 511
    .line 512
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 513
    .line 514
    .line 515
    move-result-object p1

    .line 516
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 517
    .line 518
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 519
    .line 520
    const-string v0, "from_h5_moment_level_open_camera"

    .line 521
    .line 522
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 523
    .line 524
    .line 525
    move-result p1

    .line 526
    if-nez p1, :cond_16

    .line 527
    .line 528
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->Q0(Ll/x20;)V

    .line 529
    .line 530
    .line 531
    :cond_16
    return v2
.end method

.method public N1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->x:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 4
    .line 5
    const-string v1, "p_moment_post"

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Ll/ms8;->V0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public O0(Lcom/p1/mobile/putong/feed/data/NotifyUsers;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->a0(Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public O1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "share"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x2

    .line 16
    if-nez v0, :cond_3

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 25
    .line 26
    const-string v2, "from_h5_moment_level_open_camera"

    .line 27
    .line 28
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->u:Z

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->c:I

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    if-ne v0, v2, :cond_2

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 46
    .line 47
    iget-object v0, v0, Ll/jka;->V:Ll/jxd0;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->B:Ll/dji;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->c:I

    .line 65
    .line 66
    if-ne v0, v1, :cond_4

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->D:Ll/jxd0;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->f:Z

    .line 83
    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->C:Ll/dji;

    .line 87
    .line 88
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->X1:I

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Ll/dji;->k()Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/ac40;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/ac40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_3
    :goto_1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->c:I

    .line 127
    .line 128
    if-ne v0, v1, :cond_4

    .line 129
    .line 130
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->d:Lrx/subjects/a;

    .line 131
    .line 132
    new-instance v0, Ljava/util/ArrayList;

    .line 133
    .line 134
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    :cond_4
    :goto_2
    return-void
.end method

.method public P0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cmg;->p0()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/yaj0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {v0, v1, p1}, Ll/yaj0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->F:Ll/yaj0;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public P1(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->t0()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 25
    .line 26
    iput-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    goto :goto_3

    .line 36
    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-ge v2, v0, :cond_4

    .line 41
    .line 42
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 47
    .line 48
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->t0()Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    :cond_2
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_3

    .line 65
    .line 66
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    check-cast v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 71
    .line 72
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v5, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-eqz v4, :cond_2

    .line 81
    .line 82
    const/4 v4, 0x1

    .line 83
    iput-boolean v4, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_4
    :goto_3
    return-void
.end method

.method public Q0(Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->R0()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->P(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public Q1(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/jka;->hd(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/fc40;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/fc40;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/gc40;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/gc40;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final R0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->V:Ll/jxd0;

    .line 4
    .line 5
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->B:Ll/dji;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/dji;->c()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->D:Ll/jxd0;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->C:Ll/dji;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/dji;->c()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public R1(Landroid/content/Intent;)V
    .locals 3

    .line 1
    const-string v0, "framePath"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-lez v1, :cond_0

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    instance-of v2, v2, Lcom/p1/mobile/putong/data/Video;

    .line 29
    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 47
    .line 48
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 51
    .line 52
    new-instance p1, Ll/wb40;

    .line 53
    .line 54
    invoke-direct {p1}, Ll/wb40;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, p1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F1(Ljava/util/ArrayList;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public S0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->U0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public S1(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->P1(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I1(Ljava/util/ArrayList;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public T1(Ll/pf60;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance v3, Ll/mc40;

    .line 27
    .line 28
    invoke-direct {v3, v1}, Ll/mc40;-><init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v2, v3}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iput-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->K1(Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public U0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Ll/zb40;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/zb40;-><init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    const-string p0, "\u5b58\u5728\u91cd\u590d\u8bdd\u9898"

    .line 23
    .line 24
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    const/4 v0, 0x3

    .line 41
    if-lt p2, v0, :cond_2

    .line 42
    .line 43
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->r1:I

    .line 44
    .line 45
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->X1(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/util/ArrayList;)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-nez p2, :cond_3

    .line 56
    .line 57
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isActivityTopic()Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_3

    .line 67
    .line 68
    invoke-static {}, Ll/cng;->g()Ll/cng;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->details:Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;->tips:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p2, v0, p1}, Ll/cng;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->S1(Ljava/util/ArrayList;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public U1(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Audio;Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x20;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Audio;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->R0()V

    .line 11
    .line 12
    .line 13
    new-instance v2, Ll/ec40;

    .line 14
    .line 15
    move-object v3, p0

    .line 16
    move-object v7, p1

    .line 17
    move-object v5, p2

    .line 18
    move-object v4, p3

    .line 19
    move-object v6, p4

    .line 20
    invoke-direct/range {v2 .. v7}, Ll/ec40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Lcom/p1/mobile/putong/data/Audio;Ljava/lang/String;Ljava/util/ArrayList;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v2}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public V0(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "read_draft"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->f:Z

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->Z1(Ljava/util/ArrayList;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->O1()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->Y1()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public V1(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->x:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    return-void
.end method

.method public W0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->S1(Ljava/util/ArrayList;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final W1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/vh80;->f(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/xc40;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/xc40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/yc40;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/yc40;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public X0(Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->E:Z

    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/data/DetectRequest;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DetectRequest;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, v0, Lcom/p1/mobile/putong/data/DetectRequest;->category:Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 10
    .line 11
    new-instance p2, Lcom/p1/mobile/putong/data/DetectText;

    .line 12
    .line 13
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/DetectText;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p2, Lcom/p1/mobile/putong/data/DetectText;->key:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p1, p2, Lcom/p1/mobile/putong/data/DetectText;->value:Ljava/lang/String;

    .line 19
    .line 20
    new-instance p1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, v0, Lcom/p1/mobile/putong/data/DetectRequest;->text:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ll/jka;->P6(Lcom/p1/mobile/putong/data/DetectRequest;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance p2, Ll/jc40;

    .line 41
    .line 42
    invoke-direct {p2, p0, p5, p4}, Ll/jc40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/x20;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    new-instance p3, Ll/kc40;

    .line 46
    .line 47
    invoke-direct {p3, p0, p5}, Ll/kc40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/x20;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final X1(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/util/ArrayList;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicAnonymousType()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/4 p2, 0x1

    .line 20
    if-eqz p0, :cond_3

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicAnonymousType()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    const-string p0, "\u53ea\u80fd\u6dfb\u52a0\u4e00\u6761\u533f\u540d\u8bdd\u9898"

    .line 29
    .line 30
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-static {}, Ll/cmg;->O()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    const-string p0, "\u4f60\u5df2\u6dfb\u52a0\u533f\u540d\u8bdd\u9898\uff0c\u4e0d\u53ef\u540c\u9009\u5f53\u524d\u8bdd\u9898"

    .line 41
    .line 42
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const-string p0, "\u6dfb\u52a0\u4e86\u533f\u540d\u8bdd\u9898\uff0c\u4e0d\u80fd\u518d\u6dfb\u52a0\u666e\u901a\u8bdd\u9898"

    .line 47
    .line 48
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    return p2

    .line 52
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicAnonymousType()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_5

    .line 57
    .line 58
    invoke-static {}, Ll/cmg;->O()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_4

    .line 63
    .line 64
    const-string p0, "\u533f\u540d\u8bdd\u9898\u4e0e\u5df2\u6dfb\u52a0\u8bdd\u9898\u4e0d\u53ef\u540c\u9009"

    .line 65
    .line 66
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_4
    const-string p0, "\u6dfb\u52a0\u4e86\u666e\u901a\u8bdd\u9898\uff0c\u4e0d\u80fd\u518d\u6dfb\u52a0\u533f\u540d\u8bdd\u9898"

    .line 71
    .line 72
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :goto_1
    return p2

    .line 76
    :cond_5
    return v0
.end method

.method public Y0(Ljava/lang/String;Ll/x20;)V
    .locals 7

    .line 1
    const-string v0, "moment"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    const-string v4, "moment"

    .line 8
    .line 9
    const/4 v5, 0x0

    .line 10
    move-object v1, p0

    .line 11
    move-object v2, p1

    .line 12
    move-object v6, p2

    .line 13
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->X0(Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final Y1()V
    .locals 4

    .line 1
    invoke-static {}, Ll/cmg;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->t:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->t:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ll/jka;->R7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ll/dth;->h(Lcom/p1/mobile/putong/feed/data/NotifyUsers;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->O0(Lcom/p1/mobile/putong/feed/data/NotifyUsers;Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 50
    .line 51
    invoke-static {v2}, Ll/dth;->f(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_1

    .line 60
    .line 61
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->H:Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-nez v3, :cond_1

    .line 68
    .line 69
    invoke-static {v2}, Ll/dth;->h(Lcom/p1/mobile/putong/feed/data/NotifyUsers;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0, v2, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->O0(Lcom/p1/mobile/putong/feed/data/NotifyUsers;Z)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    return-void
.end method

.method public Z1(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->c:I

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/l94;->e()Ll/l94;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Ll/l94;->g:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/uc40;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/uc40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/vc40;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/vc40;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/ksg;->d0()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    invoke-static {}, Ll/ikh;->f()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->w:Z

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    invoke-static {}, Ll/ikh;->g()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->w:Z

    .line 68
    .line 69
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->w:Z

    .line 70
    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    invoke-static {}, Ll/rkh;->d()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_1

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->W1()V

    .line 80
    .line 81
    .line 82
    :cond_1
    invoke-static {}, Ll/cmg;->u0()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 89
    .line 90
    invoke-virtual {v0}, Ll/jka;->K7()Lrx/subjects/a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/wc40;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/wc40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    :cond_2
    return-void
.end method

.method public a1(Ljava/lang/String;)V
    .locals 7

    .line 1
    const-string v0, "moment"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    new-instance v6, Ll/yb40;

    .line 8
    .line 9
    invoke-direct {v6, p0, p1}, Ll/yb40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v4, "topic"

    .line 13
    .line 14
    const-string v5, "\u53d1\u5e03\u5185\u5bb9\u5305\u542b\u4e0d\u53cb\u5584\u8bcd\u6c47\uff0c\u8bf7\u91cd\u65b0\u8f93\u5165"

    .line 15
    .line 16
    move-object v1, p0

    .line 17
    move-object v2, p1

    .line 18
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->X0(Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public b1(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "extra_addressInfo_name"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->m:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "extra_addressInfo_address"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->n:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "extra_addressInfo_location"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/data/DoublePair;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->o:Lcom/p1/mobile/putong/data/DoublePair;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    move-exception p0

    .line 29
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public d1()V
    .locals 4

    .line 1
    sget-object v0, Ll/owi;->g:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    const-class v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 37
    .line 38
    invoke-static {}, Ll/d5i;->d()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;->emotions:Ljava/util/List;

    .line 51
    .line 52
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-nez v2, :cond_1

    .line 57
    .line 58
    invoke-static {}, Ll/d5i;->c()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/StateEmotion;->emotions:Ljava/util/List;

    .line 63
    .line 64
    new-instance v3, Ll/bc40;

    .line 65
    .line 66
    invoke-direct {v3, v2}, Ll/bc40;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Lcom/p1/mobile/putong/data/Emotion;

    .line 74
    .line 75
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_1

    .line 80
    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->x:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 82
    .line 83
    if-nez v2, :cond_1

    .line 84
    .line 85
    new-instance v2, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 86
    .line 87
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v1, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 91
    .line 92
    new-instance v3, Lcom/p1/mobile/putong/data/TextTheme;

    .line 93
    .line 94
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/TextTheme;-><init>()V

    .line 95
    .line 96
    .line 97
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 98
    .line 99
    iput-object v1, v3, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 100
    .line 101
    iput-object v3, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 102
    .line 103
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->x:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 104
    .line 105
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 106
    .line 107
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 108
    .line 109
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Y1()V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_2
    :goto_1
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e1()Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->x:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public g1()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->d:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public h1(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->d:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i1(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    new-instance p1, Ll/hc40;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/hc40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->d:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/sc40;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/sc40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->k1(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public j1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    const-string v1, "suggest"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jka;->Yc(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/cc40;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/cc40;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/dc40;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/dc40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->S1(Ljava/util/ArrayList;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public k1(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "feed_post_title_tag_config"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/tantanapp/common/data/JsonAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/util/List;

    .line 28
    .line 29
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;

    .line 50
    .line 51
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;->from:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->A:Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->k:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_1

    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->A:Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;->hint:Ljava/lang/String;

    .line 72
    .line 73
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->k:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    :catch_0
    :cond_1
    return-void
.end method

.method public l1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jka;->b8()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/ad40;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ad40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/xb40;

    .line 17
    .line 18
    invoke-direct {v2}, Ll/xb40;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    const-string v0, "moment"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->Q1(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public m1()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "immersion_cartoon_effects"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final n1(Ljava/util/ArrayList;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->g0:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    return v1
.end method

.method public o1(Ljava/util/ArrayList;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_0
    return v0
.end method

.method public final synthetic q1(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->E:Z

    .line 3
    .line 4
    const-class p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 5
    .line 6
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 13
    .line 14
    iget-object p3, p0, Lcom/p1/mobile/putong/data/Detect;->text:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    if-eqz p3, :cond_0

    .line 21
    .line 22
    iget-object p3, p0, Lcom/p1/mobile/putong/data/Detect;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    if-eqz p3, :cond_0

    .line 29
    .line 30
    invoke-interface {p1}, Ll/x20;->call()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const-string p1, "p_moment_post"

    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/ksg;->l(Lcom/p1/mobile/putong/data/Detect;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->s:I

    .line 43
    .line 44
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->W2:I

    .line 55
    .line 56
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic r1(Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->E:Z

    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic s1(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->U0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic t1(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1, p1}, Ll/jka;->R6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/oc40;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/oc40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/pc40;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/pc40;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic v1(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/ksg;->Y(Ljava/util/List;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A1(Ljava/util/ArrayList;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F1(Ljava/util/ArrayList;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 28
    .line 29
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F1(Ljava/util/ArrayList;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g0()V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J1()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic x1(Ll/pf60;)V
    .locals 6

    .line 1
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/util/Collection;

    .line 4
    .line 5
    new-instance v0, Ll/lc40;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/lc40;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x5

    .line 20
    if-le v0, v2, :cond_0

    .line 21
    .line 22
    invoke-interface {p1, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v2, 0x1

    .line 31
    xor-int/2addr v0, v2

    .line 32
    new-instance v3, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v3, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->new_()Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    sget v5, Lcom/p1/mobile/putong/feed/R$string;->g0:I

    .line 50
    .line 51
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    iput-object v4, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v3, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/cmg;->O()Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    if-eqz v4, :cond_3

    .line 65
    .line 66
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->s:Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-eqz v4, :cond_3

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->s:Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->n1(Ljava/util/ArrayList;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_1

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->s:Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->s:Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->s:Ljava/util/ArrayList;

    .line 98
    .line 99
    const/4 v4, 0x6

    .line 100
    if-le v0, v4, :cond_2

    .line 101
    .line 102
    invoke-virtual {v3, v1, v4}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    :cond_2
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->y1(Ljava/util/List;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 110
    .line 111
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 112
    .line 113
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V1(Z)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_3
    invoke-static {}, Ll/cmg;->p0()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_4

    .line 122
    .line 123
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->F:Ll/yaj0;

    .line 124
    .line 125
    invoke-virtual {p1, v3}, Ll/yaj0;->g(Ljava/util/List;)V

    .line 126
    .line 127
    .line 128
    :cond_4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 129
    .line 130
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 131
    .line 132
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->y1(Ljava/util/List;)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 136
    .line 137
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V1(Z)V

    .line 140
    .line 141
    .line 142
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 143
    .line 144
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->S1(Ljava/util/ArrayList;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method
