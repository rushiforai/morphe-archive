.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardFirstView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\r\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\u000f\u0010\nJ5\u0010\u0017\u001a\u00020\u00082\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0014\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0015\u0010\u0019\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u0019\u0010\u000eJ\r\u0010\u001a\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u001a\u0010\nR\u0018\u0010\u001e\u001a\u0004\u0018\u00010\u001b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010\u001d\u00a8\u0006\u001f"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardFirstView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "r",
        "()V",
        "",
        "name",
        "k0",
        "(Ljava/lang/String;)V",
        "onFinishInflate",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
        "item",
        "Ll/osn0;",
        "listener",
        "",
        "isGroupOrHourBoard",
        "showMvp",
        "l0",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Ll/osn0;Ljava/lang/String;ZZ)V",
        "m0",
        "j0",
        "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
        "o",
        "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
        "mHourLeaderBoardItem",
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


# instance fields
.field public o:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardFirstView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

.method private final k0(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/jcr;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p1, "https://fe-static.tancdn.com/v1/raw/4d8bf3ff-b877-415e-95a3-597a61e6b66313.svga"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v0, Ll/jcr;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    const-string p1, "https://fe-static.tancdn.com/v1/raw/e70068ae-465d-4804-9641-7c968617b94b13.svga"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string p1, "https://auto.tancdn.com/v1/raw/5aa8daac-87da-4bca-9ea9-61a6985b620413.pdf"

    .line 24
    .line 25
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    const/4 v1, 0x0

    .line 29
    const/4 v2, -0x1

    .line 30
    invoke-virtual {p0, p1, v2, v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->m(Ljava/lang/String;ILl/wo0;Z)V

    .line 31
    .line 32
    .line 33
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
    const v1, 0x3eb596df

    .line 7
    .line 8
    .line 9
    mul-float/2addr v0, v1

    .line 10
    const v1, 0x3f29649e

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
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 39
    .line 40
    invoke-static {v3, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->f:Lv/VImage;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->f:Lv/VImage;

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
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardFirstView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 5
    .line 6
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/wlj;

    .line 23
    .line 24
    sget v1, Ll/obc0;->R2:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/wlj;->D(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->m:Lv/VText;

    .line 30
    .line 31
    sget v1, Ll/n9c0;->m1:I

    .line 32
    .line 33
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->m:Lv/VText;

    .line 41
    .line 42
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 43
    .line 44
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->l6:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->n:Lv/VText;

    .line 54
    .line 55
    const-string v1, ""

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->j:Lv/VImage;

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->l:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->n:Lv/VText;

    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->i:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Ll/osn0;Ljava/lang/String;ZZ)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/osn0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->m:Lv/VText;

    .line 11
    .line 12
    sget v1, Ll/n9c0;->p1:I

    .line 13
    .line 14
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/wlj;

    .line 32
    .line 33
    sget v1, Ll/obc0;->R2:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/wlj;->D(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    sget v1, Ll/qa00;->Q:I

    .line 44
    .line 45
    invoke-static {v0, p1, v1}, Ll/usn0;->f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->j:Lv/VImage;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k0()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/4 v2, 0x1

    .line 57
    xor-int/2addr v1, v2

    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->avatar:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const/4 v1, 0x0

    .line 70
    if-nez v0, :cond_0

    .line 71
    .line 72
    if-eqz p5, :cond_0

    .line 73
    .line 74
    iget-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->i:Lv/VDraweeView;

    .line 75
    .line 76
    invoke-static {p5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->i:Lv/VDraweeView;

    .line 80
    .line 81
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->avatar:Ljava/lang/String;

    .line 84
    .line 85
    const-string v3, "context_single_room"

    .line 86
    .line 87
    invoke-static {v3, p5, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    iget-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->i:Lv/VDraweeView;

    .line 92
    .line 93
    invoke-static {p5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    :goto_0
    iget-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->m:Lv/VText;

    .line 97
    .line 98
    if-eqz p4, :cond_2

    .line 99
    .line 100
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->room:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 101
    .line 102
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p5, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 108
    .line 109
    iget-boolean p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->onCall:Z

    .line 110
    .line 111
    if-eqz p4, :cond_1

    .line 112
    .line 113
    const-string p4, "onlive"

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_1
    const-string p4, "unknown_"

    .line 117
    .line 118
    :goto_1
    iget-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->l:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 119
    .line 120
    invoke-virtual {p5}, Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;->u()V

    .line 121
    .line 122
    .line 123
    iget-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->l:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 124
    .line 125
    invoke-static {p4}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 126
    .line 127
    .line 128
    move-result-object p4

    .line 129
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p5, p4}, Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;->s(Lcom/p1/mobile/putong/live/base/data/BLiveState;)V

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_2
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 137
    .line 138
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->name:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {p5, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->l:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 144
    .line 145
    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    :goto_2
    sget-object p4, Ll/jcr;->b:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result p4

    .line 154
    if-nez p4, :cond_4

    .line 155
    .line 156
    sget-object p4, Ll/jcr;->a:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p4

    .line 162
    if-eqz p4, :cond_3

    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_3
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->f:Lv/VImage;

    .line 166
    .line 167
    invoke-static {p4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 168
    .line 169
    .line 170
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->f:Lv/VImage;

    .line 171
    .line 172
    sget p5, Ll/obc0;->q3:I

    .line 173
    .line 174
    invoke-virtual {p4, p5}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 175
    .line 176
    .line 177
    goto :goto_4

    .line 178
    :cond_4
    :goto_3
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->f:Lv/VImage;

    .line 179
    .line 180
    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 181
    .line 182
    .line 183
    :goto_4
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->n:Lv/VText;

    .line 184
    .line 185
    invoke-static {p4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 186
    .line 187
    .line 188
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->n:Lv/VText;

    .line 189
    .line 190
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->amount:J

    .line 191
    .line 192
    invoke-static {v0, v1, p3}, Ll/usn0;->c(JLjava/lang/String;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p5

    .line 196
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    new-instance p4, Ll/wln0;

    .line 200
    .line 201
    invoke-direct {p4, p2, p1}, Ll/wln0;-><init>(Ll/osn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 205
    .line 206
    .line 207
    invoke-direct {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardFirstView;->k0(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    return-void
.end method

.method public final m0(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardFirstView;->j0()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardFirstView;->k0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogMainlandHeaderFirstBindings;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardFirstView;->r()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
