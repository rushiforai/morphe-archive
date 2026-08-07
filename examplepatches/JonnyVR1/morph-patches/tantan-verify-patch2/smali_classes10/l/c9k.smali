.class public Ll/c9k;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/a9k;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/widget/FrameLayout;

.field public l:Landroid/view/View;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public p:Landroid/view/View;

.field public q:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public r:Landroid/widget/ImageView;

.field public s:Landroid/view/View;

.field public t:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;


# direct methods
.method public constructor <init>(Ll/a9k;)V
    .locals 2
    .param p1    # Ll/a9k;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->Z8:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic F(Ll/c9k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c9k;->H(Landroid/view/View;)V

    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/d9k;->a(Ll/c9k;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)V
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/c9k;->n:Landroid/widget/TextView;

    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->F2:I

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 9
    .line 10
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->otherUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 13
    .line 14
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 15
    .line 16
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->lovePoint:J

    .line 17
    .line 18
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    filled-new-array {v2, v3, v4}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v1, v2}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 38
    .line 39
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->hatUrl:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 42
    .line 43
    const-string v1, ""

    .line 44
    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v0, p0, Ll/c9k;->q:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 48
    .line 49
    const/high16 v1, 0x42840000    # 66.0f

    .line 50
    .line 51
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 56
    .line 57
    invoke-static {v0, v2, v3}, Ll/biv;->f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/c9k;->t:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 61
    .line 62
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->otherUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 67
    .line 68
    invoke-static {p0, v0, p1}, Ll/biv;->k(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/c9k;->G(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/c9k;->l:Landroid/view/View;

    .line 8
    .line 9
    new-instance v0, Ll/b9k;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/b9k;-><init>(Ll/c9k;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
