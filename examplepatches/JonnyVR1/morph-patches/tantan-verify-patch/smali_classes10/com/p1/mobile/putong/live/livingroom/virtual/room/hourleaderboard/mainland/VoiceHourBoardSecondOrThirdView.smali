.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u000c\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\u000b\u0010\nJ=\u0010\u0017\u001a\u00020\u00082\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0015\u0010\u001a\u001a\u00020\u00082\u0006\u0010\u0019\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u0015\u0010\u001c\u001a\u00020\u00082\u0006\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\r\u0010\u001e\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u001e\u0010\nJ\u0017\u0010\u001f\u001a\u00020\u00082\u0006\u0010\u000f\u001a\u00020\u000eH\u0002\u00a2\u0006\u0004\u0008\u001f\u0010\u001d\u00a8\u0006 "
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "r",
        "()V",
        "onFinishInflate",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
        "item",
        "",
        "index",
        "Ll/osn0;",
        "listener",
        "",
        "name",
        "",
        "isGroupOrHourBoard",
        "showMvp",
        "m0",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;ILl/osn0;Ljava/lang/String;ZZ)V",
        "svgaUrl",
        "k0",
        "(Ljava/lang/String;)V",
        "n0",
        "(I)V",
        "j0",
        "l0",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static i0(Ll/osn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/osn0;->p(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final r()V
    .locals 6

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const v1, 0x3e89e60f

    .line 7
    .line 8
    .line 9
    mul-float/2addr v0, v1

    .line 10
    const v1, 0x3f1574e7

    .line 11
    .line 12
    .line 13
    div-float v1, v0, v1

    .line 14
    .line 15
    float-to-int v0, v0

    .line 16
    const/4 v2, 0x1

    .line 17
    new-array v3, v2, [Landroid/view/View;

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    aput-object p0, v3, v4

    .line 21
    .line 22
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    float-to-int v1, v1

    .line 26
    invoke-static {p0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 30
    .line 31
    new-array v5, v2, [Landroid/view/View;

    .line 32
    .line 33
    aput-object v3, v5, v4

    .line 34
    .line 35
    invoke-static {v0, v5}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 39
    .line 40
    invoke-static {v3, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->f:Lv/VImage;

    .line 44
    .line 45
    new-array v2, v2, [Landroid/view/View;

    .line 46
    .line 47
    aput-object v3, v2, v4

    .line 48
    .line 49
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->f:Lv/VImage;

    .line 53
    .line 54
    invoke-static {p0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 55
    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public final j0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/wlj;

    .line 17
    .line 18
    sget v1, Ll/obc0;->R2:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/wlj;->D(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->m:Lv/VText;

    .line 24
    .line 25
    sget v1, Ll/n9c0;->m1:I

    .line 26
    .line 27
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->m:Lv/VText;

    .line 35
    .line 36
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 37
    .line 38
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->l6:I

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->n:Lv/VText;

    .line 48
    .line 49
    const-string v1, ""

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->l:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 59
    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->j:Lv/VImage;

    .line 65
    .line 66
    const/4 v3, 0x1

    .line 67
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    invoke-virtual {v1, v3, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 77
    .line 78
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setAnimListener(Lcom/tantan/library/svga/AnimListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 82
    .line 83
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->n:Lv/VText;

    .line 87
    .line 88
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->i:Lv/VDraweeView;

    .line 92
    .line 93
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final k0(Ljava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->clearDynamicData()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 21
    .line 22
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView$a;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final l0(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p1, v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->j:Lv/VImage;

    .line 9
    .line 10
    sget v0, Ll/obc0;->v3:I

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->f:Lv/VImage;

    .line 16
    .line 17
    sget p1, Ll/obc0;->s3:I

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->j:Lv/VImage;

    .line 24
    .line 25
    sget v0, Ll/obc0;->u3:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->f:Lv/VImage;

    .line 31
    .line 32
    sget p1, Ll/obc0;->r3:I

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final m0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;ILl/osn0;Ljava/lang/String;ZZ)V
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/osn0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/wlj;

    .line 27
    .line 28
    sget v2, Ll/obc0;->R2:I

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ll/wlj;->D(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    const/high16 v2, 0x42920000    # 73.0f

    .line 39
    .line 40
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-static {v0, p1, v2}, Ll/usn0;->f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->j:Lv/VImage;

    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k0()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    xor-int/2addr v2, v1

    .line 56
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->m:Lv/VText;

    .line 60
    .line 61
    const/4 v2, 0x0

    .line 62
    if-eqz p5, :cond_1

    .line 63
    .line 64
    iget-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->room:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 65
    .line 66
    iget-object p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 72
    .line 73
    iget-boolean p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->onCall:Z

    .line 74
    .line 75
    if-eqz p5, :cond_0

    .line 76
    .line 77
    const-string p5, "onlive"

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    const-string p5, "unknown_"

    .line 81
    .line 82
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->l:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;->u()V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->l:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 88
    .line 89
    invoke-static {p5}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 90
    .line 91
    .line 92
    move-result-object p5

    .line 93
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, p5}, Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;->s(Lcom/p1/mobile/putong/live/base/data/BLiveState;)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_1
    iget-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 101
    .line 102
    iget-object p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->name:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v0, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->l:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 108
    .line 109
    invoke-static {p5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    :goto_1
    sget-object p5, Ll/jcr;->a:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {p5, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p5

    .line 118
    if-nez p5, :cond_2

    .line 119
    .line 120
    sget-object p5, Ll/jcr;->b:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {p5, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result p5

    .line 126
    if-nez p5, :cond_2

    .line 127
    .line 128
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;->l0(I)V

    .line 129
    .line 130
    .line 131
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->n:Lv/VText;

    .line 132
    .line 133
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->n:Lv/VText;

    .line 137
    .line 138
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->amount:J

    .line 139
    .line 140
    invoke-static {v3, v4, p4}, Ll/usn0;->c(JLjava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p4

    .line 144
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    .line 146
    .line 147
    new-instance p2, Ll/dmn0;

    .line 148
    .line 149
    invoke-direct {p2, p3, p1}, Ll/dmn0;-><init>(Ll/osn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    .line 154
    .line 155
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 156
    .line 157
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->avatar:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    if-nez p2, :cond_3

    .line 164
    .line 165
    if-eqz p6, :cond_3

    .line 166
    .line 167
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->i:Lv/VDraweeView;

    .line 168
    .line 169
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->i:Lv/VDraweeView;

    .line 173
    .line 174
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 175
    .line 176
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->avatar:Ljava/lang/String;

    .line 177
    .line 178
    const-string p2, "context_single_room"

    .line 179
    .line 180
    invoke-static {p2, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->i:Lv/VDraweeView;

    .line 185
    .line 186
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public final n0(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;->j0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;->l0(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;->r()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 8
    .line 9
    const v0, 0x3f4ccccd    # 0.8f

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
