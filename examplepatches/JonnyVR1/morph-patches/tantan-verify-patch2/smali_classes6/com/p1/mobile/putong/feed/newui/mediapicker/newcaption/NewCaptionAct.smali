.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/crl;


# instance fields
.field public final c:I

.field public final d:I

.field public e:Ljava/lang/String;

.field public f:Ll/dji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dji<",
            "Lcom/p1/mobile/putong/feed/data/NewMomentDraft;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/dji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dji<",
            "Lcom/p1/mobile/putong/feed/data/NewMomentDraft;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/jxd0;

.field public i:Ll/jxd0;

.field public j:I

.field public k:Z

.field public l:Z

.field public m:Ll/uq20;

.field public n:Ll/jr20;

.field public o:Landroid/view/MenuItem;

.field public p:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/MenuItem;",
            ">;"
        }
    .end annotation
.end field

.field public q:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->c:I

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->d:I

    .line 9
    .line 10
    const-string v1, "camera"

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->e:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v1, Ll/dji;

    .line 15
    .line 16
    new-instance v2, Ll/vod;

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v4, "new_moment_draft_text"

    .line 27
    .line 28
    const/4 v5, 0x0

    .line 29
    invoke-direct {v2, v4, v5, v3}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget-object v3, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 33
    .line 34
    const/4 v4, -0x1

    .line 35
    invoke-direct {v1, v2, v4, v3}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->f:Ll/dji;

    .line 39
    .line 40
    new-instance v1, Ll/dji;

    .line 41
    .line 42
    new-instance v2, Ll/vod;

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const-string v6, "new_moment_draft_media"

    .line 53
    .line 54
    invoke-direct {v2, v6, v5, v3}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget-object v3, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    invoke-direct {v1, v2, v4, v3}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 60
    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->g:Ll/dji;

    .line 63
    .line 64
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 65
    .line 66
    iget-object v2, v1, Ll/jka;->V:Ll/jxd0;

    .line 67
    .line 68
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->h:Ll/jxd0;

    .line 69
    .line 70
    iget-object v1, v1, Ll/jka;->U:Ll/jxd0;

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->i:Ll/jxd0;

    .line 73
    .line 74
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->j:I

    .line 75
    .line 76
    new-instance v0, Ll/gq20;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Ll/gq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 79
    .line 80
    .line 81
    const/16 v1, 0x1f4

    .line 82
    .line 83
    invoke-static {v1, v0}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->p:Ll/y20;

    .line 88
    .line 89
    return-void
.end method

.method private synthetic A2()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->n2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->y2()V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->A2()V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->H2(Ll/x20;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->D2(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b2(Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->z2()V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->v2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;Landroid/view/MenuItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->w2(Landroid/view/MenuItem;)V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->B2()V

    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;Ll/dji$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->F2(Ll/dji$a;)V

    return-void
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->E2()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->C2()V

    return-void
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->I2(Ll/x20;)V

    return-void
.end method

.method public static synthetic m2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static p2(Landroid/content/Context;Ljava/util/ArrayList;Z)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "extra_images"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "read_draft"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static q2(Landroid/content/Context;Ljava/util/ArrayList;ZLcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            "Ljava/lang/String;",
            "Z)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "extra_images"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "read_draft"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "extra_topic"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "extra_from"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    const-string p0, "extra_from_attend_btn"

    .line 29
    .line 30
    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method private r2(Ll/x20;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->j:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->h:Ll/jxd0;

    .line 7
    .line 8
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->f:Ll/dji;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/dji;->c()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v1, 0x2

    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->i:Ll/jxd0;

    .line 23
    .line 24
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->g:Ll/dji;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/dji;->c()V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    invoke-interface {p1}, Ll/x20;->call()V

    .line 41
    .line 42
    .line 43
    :cond_2
    return-void
.end method

.method private s2()V
    .locals 1

    .line 1
    new-instance v0, Ll/hq20;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private u2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "extra_from_attend_btn"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->l:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "extra_from"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->e:Ljava/lang/String;

    .line 32
    .line 33
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->e:Ljava/lang/String;

    .line 34
    .line 35
    return-void
.end method

.method private synthetic v2(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    const-string p1, "\u7f16\u8f91\u5185\u5bb9"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget v0, Ll/fgc0;->p:I

    .line 11
    .line 12
    invoke-virtual {p1, p0, v0}, Landroidx/appcompat/widget/Toolbar;->setTitleTextAppearance(Landroid/content/Context;I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "read_draft"

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->k:Z

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/uq20;->h0()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 v0, 0x2

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->j:I

    .line 38
    .line 39
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->j:I

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    if-ne p1, v1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->h:Ll/jxd0;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->f:Ll/dji;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->L2(Ll/dji;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->j:I

    .line 65
    .line 66
    if-ne p1, v0, :cond_2

    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->i:Ll/jxd0;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_2

    .line 81
    .line 82
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->k:Z

    .line 83
    .line 84
    if-eqz p1, :cond_2

    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->g:Ll/dji;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->L2(Ll/dji;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method private synthetic z2()V
    .locals 1

    .line 1
    new-instance v0, Ll/kq20;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->N2(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final synthetic B2()V
    .locals 1

    .line 1
    new-instance v0, Ll/mq20;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->r2(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic C2()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic D2(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->p:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public final synthetic E2()Ljava/lang/Boolean;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/bnl0;->s(Landroid/view/ViewGroup;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/lq20;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/lq20;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/view/View;

    .line 33
    .line 34
    check-cast v1, Landroid/widget/TextView;

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->q:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_0

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->q:Landroid/widget/TextView;

    .line 49
    .line 50
    const/4 v2, 0x3

    .line 51
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->q:Landroid/widget/TextView;

    .line 59
    .line 60
    const/high16 v2, 0x41900000    # 18.0f

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->M2()V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 70
    .line 71
    return-object p0
.end method

.method public final synthetic F2(Ll/dji$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p1, p1, Ll/dji$a;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/uq20;->n0(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic H2(Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic I2(Ll/x20;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->new_()Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/uq20;->f0()Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->n:Ll/jr20;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/jr20;->n()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->j:I

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    const/4 v3, 0x1

    .line 25
    if-ne v1, v3, :cond_0

    .line 26
    .line 27
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-lez v1, :cond_0

    .line 34
    .line 35
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->j:I

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->h:Ll/jxd0;

    .line 38
    .line 39
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {v1, v4}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->j:I

    .line 46
    .line 47
    if-ne v1, v2, :cond_1

    .line 48
    .line 49
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_1

    .line 56
    .line 57
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->j:I

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->i:Ll/jxd0;

    .line 60
    .line 61
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {v1, v4}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_0
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->j:I

    .line 67
    .line 68
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->type:I

    .line 69
    .line 70
    if-ne v1, v3, :cond_2

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->f:Ll/dji;

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Ll/dji;->p(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->h:Ll/jxd0;

    .line 78
    .line 79
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    if-ne v1, v2, :cond_3

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->g:Ll/dji;

    .line 88
    .line 89
    invoke-virtual {v1, v0}, Ll/dji;->p(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->i:Ll/jxd0;

    .line 93
    .line 94
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    :cond_3
    :goto_1
    new-instance v0, Ll/dq20;

    .line 100
    .line 101
    invoke-direct {v0, p0, p1}, Ll/dq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;Ll/x20;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final K2(Landroid/view/MenuItem;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/uq20;->f0()Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->n:Ll/jr20;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/jr20;->n()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->n:Ll/jr20;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/jr20;->m()Lcom/p1/mobile/putong/data/MessageLocation;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-static {v1, p1, v2}, Ll/cn40;->T(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->r2(Ll/x20;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->finish()V

    .line 47
    .line 48
    .line 49
    return v0
.end method

.method public final L2(Ll/dji;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dji<",
            "Lcom/p1/mobile/putong/feed/data/NewMomentDraft;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->X1:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/dji;->k()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Ll/bq20;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/bq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public M2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->n:Ll/jr20;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jr20;->p()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/uq20;->g0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->o:Landroid/view/MenuItem;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->o:Landroid/view/MenuItem;

    .line 29
    .line 30
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->q:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sget v1, Ll/k9c0;->Y:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sget v1, Ll/k9c0;->Z:I

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->q:Landroid/widget/TextView;

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    .line 76
    .line 77
    :cond_3
    return-void
.end method

.method public final N2(Ll/x20;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/cq20;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Ll/cq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public finish()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->n:Ll/jr20;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/jr20;->s(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->n:Ll/jr20;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jr20;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/uq20;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/uq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 10
    .line 11
    new-instance v0, Ll/jr20;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/jr20;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->n:Ll/jr20;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/uq20;->i0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->s2()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/uq20;->k0(IILandroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uq20;->g0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/mxg;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/mxg;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->I1:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/mxg;->j(I)Ll/mxg;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->Y1:I

    .line 21
    .line 22
    new-instance v2, Ll/aq20;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/aq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Ll/mxg;->i(ILjava/lang/Runnable;)Ll/mxg;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->s1:I

    .line 32
    .line 33
    new-instance v2, Ll/eq20;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Ll/eq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Ll/mxg;->h(ILjava/lang/Runnable;)Ll/mxg;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/mxg;->show()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    new-instance v0, Ll/fq20;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/fq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->r2(Ll/x20;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->W1:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->actionItemPadding(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p1, v0}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/iq20;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/iq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->o:Landroid/view/MenuItem;

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->M2()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->pendChangeActionButtonTypeface()V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/uq20;->l0(Landroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/uq20;->f0()Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v0, "extra_images"

    .line 11
    .line 12
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public pendChangeActionButtonTypeface()V
    .locals 2

    .line 1
    const v0, 0x1020002

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/jq20;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/jq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    new-instance v0, Landroid/content/Intent;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v0, v1}, Ll/l51;->p(Landroid/content/Intent;Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    const-string v1, "after_signin"

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/orb0;->J(Landroid/content/Context;Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->finish()V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->m:Ll/uq20;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1, p1}, Ll/uq20;->m0(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 54
    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 58
    .line 59
    .line 60
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->u2()V

    .line 61
    .line 62
    .line 63
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic w2(Landroid/view/MenuItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->K2(Landroid/view/MenuItem;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y2()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->o2(Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
