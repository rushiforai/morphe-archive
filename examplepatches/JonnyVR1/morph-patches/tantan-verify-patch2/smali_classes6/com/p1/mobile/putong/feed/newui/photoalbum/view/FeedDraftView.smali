.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;
.super Lv/VRelative;
.source "SourceFile"


# static fields
.field public static r:Ll/dji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dji<",
            "Lcom/p1/mobile/putong/feed/data/NewMomentDraft;",
            ">;"
        }
    .end annotation
.end field

.field public static s:Ll/dji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dji<",
            "Lcom/p1/mobile/putong/feed/data/NewMomentDraft;",
            ">;"
        }
    .end annotation
.end field

.field public static t:Ll/byd0;

.field public static u:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public d:Lv/VRelative;

.field public e:Lv/VFrame;

.field public f:Lv/VDraweeView;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Lv/VLinear;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VText;

.field public m:Ll/jxd0;

.field public n:Lcom/p1/mobile/putong/app/PutongFrag;

.field public o:Ll/kcg0;

.field public p:Lcom/p1/mobile/putong/feed/data/TopicOperations;

.field public q:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Ll/dji;

    .line 2
    .line 3
    new-instance v1, Ll/vod;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "new_moment_draft_text"

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-direct {v1, v3, v4, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object v2, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    const/4 v3, -0x1

    .line 22
    invoke-direct {v0, v1, v3, v2}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->r:Ll/dji;

    .line 26
    .line 27
    new-instance v0, Ll/dji;

    .line 28
    .line 29
    new-instance v1, Ll/vod;

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v5, "new_moment_draft_media"

    .line 40
    .line 41
    invoke-direct {v1, v5, v4, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sget-object v2, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-direct {v0, v1, v3, v2}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->s:Ll/dji;

    .line 50
    .line 51
    new-instance v0, Ll/byd0;

    .line 52
    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v2, "close_draft_guide_time_"

    .line 56
    .line 57
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    const-wide/16 v2, 0x0

    .line 76
    .line 77
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 82
    .line 83
    .line 84
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->t:Ll/byd0;

    .line 85
    .line 86
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->u:Lrx/subjects/a;

    .line 91
    .line 92
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 5
    .line 6
    iget-object v0, v0, Ll/jka;->U:Ll/jxd0;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->m:Ll/jxd0;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->Q(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    iget-object p2, p2, Ll/jka;->U:Ll/jxd0;

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->m:Ll/jxd0;

    .line 16
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->Q(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 18
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    iget-object p2, p2, Ll/jka;->U:Ll/jxd0;

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->m:Ll/jxd0;

    .line 19
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->Q(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;Ll/dji$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->Y(Ll/dji$a;)V

    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;Lcom/p1/mobile/putong/feed/data/TopicOperations;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->V(Lcom/p1/mobile/putong/feed/data/TopicOperations;)V

    return-void
.end method

.method public static P(Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->u:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private Q(Landroid/content/Context;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->M(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->d:Lv/VRelative;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->i:Lv/VImage;

    .line 23
    .line 24
    new-instance v1, Ll/q3h;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/q3h;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/jka;->t7()Lrx/subjects/a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ll/r3h;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/r3h;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;)V

    .line 47
    .line 48
    .line 49
    new-instance p0, Ll/s3h;

    .line 50
    .line 51
    invoke-direct {p0}, Ll/s3h;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->t:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->d:Lv/VRelative;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->o:Ll/kcg0;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->o:Ll/kcg0;

    .line 29
    .line 30
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private c0(Ljava/util/ArrayList;)V
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
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 13
    .line 14
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Audio;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->e:Lv/VFrame;

    .line 19
    .line 20
    sget v2, Ll/lbc0;->M0:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    check-cast p1, Lcom/p1/mobile/putong/data/Audio;

    .line 26
    .line 27
    iget p1, p1, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 28
    .line 29
    float-to-int p1, p1

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->g:Landroid/widget/TextView;

    .line 31
    .line 32
    new-instance v2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p1, "\""

    .line 41
    .line 42
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->g:Landroid/widget/TextView;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->f:Lv/VDraweeView;

    .line 58
    .line 59
    const/16 v0, 0x8

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    const-string p1, "voice"

    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->q:Ljava/lang/String;

    .line 67
    .line 68
    :cond_0
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->W(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public M(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/x3h;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public O()Z
    .locals 1

    .line 1
    const-string p0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 2
    .line 3
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 4
    .line 5
    filled-new-array {p0, v0}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public R(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->n:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->u:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/w3h;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/w3h;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->o:Ll/kcg0;

    .line 23
    .line 24
    return-void
.end method

.method public final S(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/v3h;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/v3h;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/feed/data/TopicOperations;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->t:Ll/byd0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Long;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-static {v0, v1}, Ll/p6i;->g(J)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->p:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->Z()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->d:Lv/VRelative;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic W(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->n:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v0, v0, [Lcom/p1/mobile/putong/data/Media;

    .line 9
    .line 10
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    const-string v2, "moment_post_drafts"

    .line 16
    .line 17
    invoke-static {p1, v0, v1, v2}, Ll/cn40;->k0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/cmg;->Y()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const-string p1, "p_like"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string p1, "p_follow"

    .line 30
    .line 31
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->q:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v0, "moment_drafts_type"

    .line 38
    .line 39
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    filled-new-array {p0}, [Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v0, "e_moment_post_drafts"

    .line 48
    .line 49
    invoke-static {v0, p1, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic Y(Ll/dji$a;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p1, p1, Ll/dji$a;->a:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->a0(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->d:Lv/VRelative;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->p:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/cmg;->Y()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    const-string p1, "p_like"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const-string p1, "p_follow"

    .line 32
    .line 33
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->q:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "moment_drafts_type"

    .line 40
    .line 41
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    filled-new-array {p0}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v0, "e_moment_post_drafts"

    .line 50
    .line 51
    invoke-static {v0, p1, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public Z()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->n:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->O()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->d:Lv/VRelative;

    .line 14
    .line 15
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 20
    .line 21
    iget-object v0, v0, Ll/jka;->V:Ll/jxd0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->r:Ll/dji;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->m:Ll/jxd0;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->s:Ll/dji;

    .line 53
    .line 54
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->n:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/dji;->k()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v0, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/t3h;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/t3h;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->d:Lv/VRelative;

    .line 86
    .line 87
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->h:Lv/VImage;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v0}, Ll/ksg;->Y(Ljava/util/List;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 31
    .line 32
    check-cast p1, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->c0(Ljava/util/ArrayList;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->f:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->e:Lv/VFrame;

    .line 44
    .line 45
    sget v1, Ll/k9c0;->n0:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 51
    .line 52
    check-cast p1, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->e0(Ljava/util/ArrayList;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->e:Lv/VFrame;

    .line 59
    .line 60
    sget v0, Ll/lbc0;->N0:I

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->h:Lv/VImage;

    .line 66
    .line 67
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->f:Lv/VDraweeView;

    .line 71
    .line 72
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    const-string p1, "word"

    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->q:Ljava/lang/String;

    .line 78
    .line 79
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->p:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 80
    .line 81
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_2

    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->k:Landroid/widget/TextView;

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->p:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PostGuide;->title:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->l:Lv/VText;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->p:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PostGuide;->subTitle:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    :cond_2
    return-void
.end method

.method public b0(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->t:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/p6i;->g(J)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->R(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->Z()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->e:Lv/VFrame;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->j:Lv/VLinear;

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    new-array v1, v1, [Landroid/view/ViewGroup;

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    aput-object p1, v1, v2

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    aput-object v0, v1, p1

    .line 38
    .line 39
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/u3h;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/u3h;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final e0(Ljava/util/ArrayList;)V
    .locals 2
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
    move-result v0

    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 13
    .line 14
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->f:Lv/VDraweeView;

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p1, "video"

    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->q:Ljava/lang/String;

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->f:Lv/VDraweeView;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const-string p1, "photo"

    .line 46
    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->q:Ljava/lang/String;

    .line 48
    .line 49
    :cond_1
    return-void
.end method
