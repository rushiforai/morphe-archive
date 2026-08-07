.class public Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;
.super Lcom/p1/mobile/putong/core/ui/AutoReleaseVideoAct;
.source "SourceFile"

# interfaces
.implements Ll/crl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;
    }
.end annotation


# instance fields
.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VPager;

.field public e:Lv/VImage;

.field public f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;

.field public h:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/MessageAndMedia;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/MessageAndMedia;",
            ">;"
        }
    .end annotation
.end field

.field public j:I

.field public k:Z

.field public l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

.field public m:Z

.field public n:Ll/ie80;

.field public o:Ll/ie80;

.field public p:Z

.field public q:I

.field public r:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/AutoReleaseVideoAct;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/vg60;->a()Ll/vg60;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->i:Ljava/util/ArrayList;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->j:I

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->k:Z

    .line 22
    .line 23
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->p:Z

    .line 24
    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->q:I

    .line 26
    .line 27
    return-void
.end method

.method private synthetic A2()V
    .locals 2

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/PlayerView;->A:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->o:Ll/ie80;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->o:Ll/ie80;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/ie80;->release()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->n:Ll/ie80;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->n:Ll/ie80;

    .line 32
    .line 33
    invoke-interface {p0}, Ll/ie80;->release()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method private synthetic B2()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->f:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Xn(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private synthetic C2()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->p:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 11
    .line 12
    if-ne v0, v1, :cond_3

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-ltz v0, :cond_3

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 23
    .line 24
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-lt v0, v1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 34
    .line 35
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 42
    .line 43
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 44
    .line 45
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 46
    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    instance-of v1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    check-cast p0, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->C()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_3

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 70
    .line 71
    const-string v1, "real_shot"

    .line 72
    .line 73
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    const/4 v0, 0x1

    .line 80
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->L(Z)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->K()V

    .line 85
    .line 86
    .line 87
    :cond_3
    :goto_0
    return-void
.end method

.method private synthetic H2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->E2(Ll/vg60;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->lambda$initSubscription$2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->C2()V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->F2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->H2()V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->D2(Lcom/p1/mobile/putong/core/data/MessageAndMedia;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->A2()V

    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->y2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->z2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->B2()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic l2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)Ll/ie80;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->o:Ll/ie80;

    return-object p0
.end method

.method private synthetic lambda$initSubscription$2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->I2(Lcom/p1/mobile/putong/core/data/MessageAndMedia;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 7
    .line 8
    const/high16 v0, 0x41000000    # 8.0f

    .line 9
    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 18
    .line 19
    invoke-static {p1}, Ll/bnl0;->a0(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->g:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->g:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->e:Lv/VImage;

    .line 42
    .line 43
    new-instance v0, Ll/m1y;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/m1y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static bridge synthetic m2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)Ll/ie80;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->n:Ll/ie80;

    return-object p0
.end method

.method public static bridge synthetic n2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->p:Z

    return-void
.end method

.method public static bridge synthetic o2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->I2(Lcom/p1/mobile/putong/core/data/MessageAndMedia;)V

    return-void
.end method

.method public static bridge synthetic p2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->K2()V

    return-void
.end method

.method public static final r2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->s2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageAndMedia;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static final s2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageAndMedia;Z)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->u2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageAndMedia;ZZ)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static final u2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageAndMedia;ZZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lcom/tantanapp/common/data/ProtobufAdapter;->toBytes(Ljava/lang/Object;)[B

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p2, "start_data"

    .line 15
    .line 16
    invoke-virtual {v0, p2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    const-string p0, "user_id"

    .line 20
    .line 21
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string p0, "not_more_media"

    .line 25
    .line 26
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    const-string p0, "forbid_long_press"

    .line 30
    .line 31
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public static v2(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    new-instance v1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 22
    .line 23
    invoke-direct {v1, v0, p1}, Lcom/p1/mobile/putong/core/data/MessageAndMedia;-><init>(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-static {p0, p1, v1, v0, p2}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->u2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageAndMedia;ZZ)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method private synthetic y2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic z2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-eq p1, v0, :cond_2

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-eq p1, v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-eq p1, v0, :cond_2

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne p1, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 23
    .line 24
    const-string p1, "video/mp4"

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 p1, 0x1

    .line 41
    invoke-interface {p0, p1}, Ll/nam;->f(Z)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void

    .line 45
    :cond_2
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const/4 p1, 0x0

    .line 54
    invoke-interface {p0, p1}, Ll/nam;->f(Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public final synthetic D2(Lcom/p1/mobile/putong/core/data/MessageAndMedia;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 28
    .line 29
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 30
    .line 31
    cmpl-double p0, v0, p0

    .line 32
    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public final synthetic E2(Ll/vg60;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    :goto_0
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->k:Z

    .line 15
    .line 16
    if-eqz v2, :cond_4

    .line 17
    .line 18
    iget-object v2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    add-int/lit8 v2, v2, -0x1

    .line 25
    .line 26
    :goto_1
    if-ltz v2, :cond_4

    .line 27
    .line 28
    iget-object v3, p1, Ll/vg60;->a:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lcom/p1/mobile/putong/core/data/Message;

    .line 35
    .line 36
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-eqz v4, :cond_3

    .line 43
    .line 44
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    :cond_1
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-eqz v5, :cond_3

    .line 55
    .line 56
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 61
    .line 62
    instance-of v6, v5, Lcom/p1/mobile/putong/data/Picture;

    .line 63
    .line 64
    if-nez v6, :cond_2

    .line 65
    .line 66
    instance-of v6, v5, Lcom/p1/mobile/putong/data/Video;

    .line 67
    .line 68
    if-eqz v6, :cond_1

    .line 69
    .line 70
    :cond_2
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->i:Ljava/util/ArrayList;

    .line 71
    .line 72
    new-instance v7, Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 73
    .line 74
    invoke-direct {v7, v5, v3}, Lcom/p1/mobile/putong/core/data/MessageAndMedia;-><init>(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    add-int/lit8 v2, v2, -0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_4
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->k:Z

    .line 85
    .line 86
    if-nez v2, :cond_8

    .line 87
    .line 88
    iget-object v2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->q:I

    .line 95
    .line 96
    if-le v2, v3, :cond_8

    .line 97
    .line 98
    iget-object v2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->q:I

    .line 105
    .line 106
    sub-int/2addr v2, v3

    .line 107
    add-int/lit8 v2, v2, -0x1

    .line 108
    .line 109
    :goto_3
    if-ltz v2, :cond_8

    .line 110
    .line 111
    iget-object v3, p1, Ll/vg60;->a:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Lcom/p1/mobile/putong/core/data/Message;

    .line 118
    .line 119
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 120
    .line 121
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    if-eqz v4, :cond_7

    .line 126
    .line 127
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    :cond_5
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    if-eqz v5, :cond_7

    .line 138
    .line 139
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 144
    .line 145
    instance-of v6, v5, Lcom/p1/mobile/putong/data/Picture;

    .line 146
    .line 147
    if-nez v6, :cond_6

    .line 148
    .line 149
    instance-of v6, v5, Lcom/p1/mobile/putong/data/Video;

    .line 150
    .line 151
    if-eqz v6, :cond_5

    .line 152
    .line 153
    :cond_6
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->i:Ljava/util/ArrayList;

    .line 154
    .line 155
    new-instance v7, Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 156
    .line 157
    invoke-direct {v7, v5, v3}, Lcom/p1/mobile/putong/core/data/MessageAndMedia;-><init>(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    goto :goto_4

    .line 164
    :cond_7
    add-int/lit8 v2, v2, -0x1

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_8
    iget-object v2, p1, Ll/vg60;->a:Ljava/util/List;

    .line 168
    .line 169
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->q:I

    .line 174
    .line 175
    new-instance v2, Ll/vg60;

    .line 176
    .line 177
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->i:Ljava/util/ArrayList;

    .line 178
    .line 179
    iget-object p1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 180
    .line 181
    invoke-direct {v2, v3, p1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 182
    .line 183
    .line 184
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 185
    .line 186
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->g:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;

    .line 187
    .line 188
    invoke-virtual {p1}, Ll/cf60;->notifyDataSetChanged()V

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 192
    .line 193
    new-instance v2, Ll/h2y;

    .line 194
    .line 195
    invoke-direct {v2, p0}, Ll/h2y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 199
    .line 200
    .line 201
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->k:Z

    .line 202
    .line 203
    if-eqz p1, :cond_9

    .line 204
    .line 205
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->i:Ljava/util/ArrayList;

    .line 206
    .line 207
    new-instance v2, Ll/j2y;

    .line 208
    .line 209
    invoke-direct {v2, p0}, Ll/j2y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 210
    .line 211
    .line 212
    invoke-static {p1, v2}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    if-ltz p1, :cond_9

    .line 217
    .line 218
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 219
    .line 220
    invoke-virtual {v2, p1, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 221
    .line 222
    .line 223
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 224
    .line 225
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 226
    .line 227
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 232
    .line 233
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 234
    .line 235
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->k:Z

    .line 236
    .line 237
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 238
    .line 239
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 240
    .line 241
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    if-ne v0, p1, :cond_a

    .line 246
    .line 247
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->j:I

    .line 248
    .line 249
    const/4 v0, 0x5

    .line 250
    if-ge p1, v0, :cond_a

    .line 251
    .line 252
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->K2()V

    .line 253
    .line 254
    .line 255
    return-void

    .line 256
    :cond_a
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->j:I

    .line 257
    .line 258
    return-void
.end method

.method public final synthetic F2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->A:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->n:Ll/ie80;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->n:Ll/ie80;

    .line 19
    .line 20
    invoke-interface {p1}, Ll/ie80;->stop()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->o:Ll/ie80;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->o:Ll/ie80;

    .line 32
    .line 33
    invoke-interface {p0}, Ll/ie80;->stop()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final I2(Lcom/p1/mobile/putong/core/data/MessageAndMedia;)V
    .locals 1

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->e:Lv/VImage;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final K2()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->j:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->j:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/vg60;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->f:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Bn(Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hasCustomTransition()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget v0, Ll/x7c0;->a:I

    .line 11
    .line 12
    sget v1, Ll/x7c0;->b:I

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->q2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTopViewLayout(Landroid/view/View;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->e:Lv/VImage;

    .line 10
    .line 11
    const/4 p2, -0x1

    .line 12
    invoke-virtual {p0, p2}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method

.method public initDataOnCreate()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "start_data"

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->get([B)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "not_more_media"

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->m:Z

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "forbid_long_press"

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->r:Z

    .line 48
    .line 49
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/t1y;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/t1y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/v1y;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/v1y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->m:Z

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/x1y;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/x1y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/z1y;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/z1y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/b2y;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/b2y;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/d2y;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/d2y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/f2y;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/f2y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v1, v0, Lv/VFrame;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    sget v1, Ll/adc0;->I7:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v1, v2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setOnImageEventListener(Lv/fresco/subscaleview/SubsamplingScaleImageView$h;)V

    .line 29
    .line 30
    .line 31
    const/16 v2, 0x8

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    check-cast v0, Lv/VFrame;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/k1y;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/k1y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 44
    .line 45
    .line 46
    const-wide/16 v1, 0x64

    .line 47
    .line 48
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    new-instance p1, Ll/vg60;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 4
    .line 5
    filled-new-array {v0}, [Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {p1, v0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "user_id"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->f:Ljava/lang/String;

    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->dimStatusBar(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget v0, Ll/c9c0;->W1:I

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const/high16 v0, -0x1000000

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hasCustomTransition()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_0

    .line 66
    .line 67
    sget p1, Ll/x7c0;->c:I

    .line 68
    .line 69
    sget v0, Ll/x7c0;->d:I

    .line 70
    .line 71
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public q2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/s2y;->b(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public w2(Ljava/lang/String;)Ll/ie80;
    .locals 1

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
    const-string v0, "http"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->n:Ll/ie80;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ll/re80;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/re80;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->n:Ll/ie80;

    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->n:Ll/ie80;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->o:Ll/ie80;

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    new-instance p1, Ll/ye80;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/ye80;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->o:Ll/ie80;

    .line 39
    .line 40
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->o:Ll/ie80;

    .line 41
    .line 42
    return-object p0
.end method
