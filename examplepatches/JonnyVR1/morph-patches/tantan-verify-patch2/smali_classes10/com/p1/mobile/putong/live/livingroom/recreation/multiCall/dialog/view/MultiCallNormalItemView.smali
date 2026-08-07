.class public final Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings<",
        "Ll/vi10;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u0008\n\u0002\u0008\u0004\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u001b\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0015\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0015\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0015\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0015\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0016\u001a\u00020\u0015\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\r\u0010\u0019\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\r\u0010\u001b\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u001b\u0010\u001aJ\u0019\u0010\u001e\u001a\u00020\u000b2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001cH\u0002\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u001f\u0010!\u001a\u00020\u000b2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010 \u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008!\u0010\"J\u0017\u0010$\u001a\u00020\u000b2\u0006\u0010#\u001a\u00020\u0015H\u0002\u00a2\u0006\u0004\u0008$\u0010\u0018R\u0014\u0010(\u001a\u00020%8\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008&\u0010\'\u00a8\u0006)"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;",
        "Ll/vi10;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Ll/ff10;",
        "data",
        "",
        "q0",
        "(Ll/ff10;)V",
        "Ll/s910;",
        "p0",
        "(Ll/s910;)V",
        "",
        "enable",
        "n0",
        "(Z)V",
        "",
        "text",
        "z0",
        "(Ljava/lang/String;)V",
        "v0",
        "()V",
        "u0",
        "Lcom/p1/mobile/putong/data/Followship;",
        "followShip",
        "w0",
        "(Lcom/p1/mobile/putong/data/Followship;)V",
        "checked",
        "o0",
        "(ZZ)V",
        "state",
        "y0",
        "",
        "n",
        "I",
        "avatarViewSize",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final n:I


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

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    sget p1, Ll/qa00;->x:I

    .line 8
    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->n:I

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 12
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic i0(Ll/y20;Ll/ff10;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->r0(Ll/y20;Ll/ff10;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static j0(Ll/s910;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/s910;->K()Lkotlin/jvm/functions/Function1;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 12
    .line 13
    return-object p0
.end method

.method public static k0(Ll/s910;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/s910;->N()Lkotlin/jvm/functions/Function1;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0}, Ll/s910;->L()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 21
    .line 22
    return-object p0
.end method

.method public static synthetic l0(Ll/y20;Ll/ff10;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->s0(Ll/y20;Ll/ff10;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Ll/y20;Ll/ff10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->t0(Ll/y20;Ll/ff10;Landroid/view/View;)V

    return-void
.end method

.method public static final r0(Ll/y20;Ll/ff10;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method

.method public static final s0(Ll/y20;Ll/ff10;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/ff10;->J()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->toUserId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 14
    .line 15
    return-object p0
.end method

.method public static final t0(Ll/y20;Ll/ff10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final n0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/n9c0;->e1:I

    .line 6
    .line 7
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->i:Landroid/view/View;

    .line 15
    .line 16
    sget p1, Ll/obc0;->p0:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget p1, Ll/n9c0;->Z0:I

    .line 23
    .line 24
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->i:Landroid/view/View;

    .line 32
    .line 33
    sget p1, Ll/obc0;->k0:I

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final o0(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->m:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->m:Lv/VCheckBox;

    .line 7
    .line 8
    invoke-virtual {v0, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->k:Landroid/widget/ImageView;

    .line 12
    .line 13
    xor-int/lit8 v0, p1, 0x1

    .line 14
    .line 15
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->j:Landroid/widget/TextView;

    .line 19
    .line 20
    xor-int/lit8 v0, p1, 0x1

    .line 21
    .line 22
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->i:Landroid/view/View;

    .line 26
    .line 27
    xor-int/lit8 p1, p1, 0x1

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final p0(Ll/s910;)V
    .locals 4
    .param p1    # Ll/s910;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/s910;->L()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userAvatar:Ljava/lang/String;

    .line 11
    .line 12
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->n:I

    .line 13
    .line 14
    const-string v3, "context_common"

    .line 15
    .line 16
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->g:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/s910;->L()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userName:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ll/s910;->L()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->followship:Lcom/p1/mobile/putong/data/Followship;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->w0(Lcom/p1/mobile/putong/data/Followship;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->i:Landroid/view/View;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    new-instance v1, Ll/hj10;

    .line 45
    .line 46
    invoke-direct {v1, p1}, Ll/hj10;-><init>(Ll/s910;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    new-instance v0, Ll/ij10;

    .line 58
    .line 59
    invoke-direct {v0, p1}, Ll/ij10;-><init>(Ll/s910;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p0, v0}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final q0(Ll/ff10;)V
    .locals 4
    .param p1    # Ll/ff10;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/ff10;->J()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->toUserAvatar:Ljava/lang/String;

    .line 11
    .line 12
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->n:I

    .line 13
    .line 14
    const-string v3, "context_common"

    .line 15
    .line 16
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ll/ff10;->H()Ll/y20;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->l:Lv/VFrame;

    .line 27
    .line 28
    invoke-static {v2, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->l:Lv/VFrame;

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    new-instance v3, Ll/ej10;

    .line 37
    .line 38
    invoke-direct {v3, v0, p1}, Ll/ej10;-><init>(Ll/y20;Ll/ff10;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v2, v3}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-virtual {p1}, Ll/ff10;->I()Ll/y20;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 51
    .line 52
    invoke-static {v2, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    new-instance v3, Ll/fj10;

    .line 61
    .line 62
    invoke-direct {v3, v0, p1}, Ll/fj10;-><init>(Ll/y20;Ll/ff10;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v2, v3}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    invoke-virtual {p1}, Ll/ff10;->N()Ll/y20;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    invoke-static {p0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    new-instance v1, Ll/gj10;

    .line 78
    .line 79
    invoke-direct {v1, v0, p1}, Ll/gj10;-><init>(Ll/y20;Ll/ff10;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    sget-object v0, Ll/cd10;->D:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p1}, Ll/ff10;->O()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    invoke-virtual {p1}, Ll/ff10;->J()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->followship:Lcom/p1/mobile/putong/data/Followship;

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->w0(Lcom/p1/mobile/putong/data/Followship;)V

    .line 104
    .line 105
    .line 106
    :cond_3
    invoke-virtual {p1}, Ll/ff10;->L()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    invoke-virtual {p1}, Ll/ff10;->K()Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->o0(ZZ)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->g:Lv/VText;

    .line 118
    .line 119
    invoke-virtual {p1}, Ll/ff10;->J()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->toUserName:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Ll/ff10;->J()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->state:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->y0(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final u0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->k:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->j:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->k:Landroid/widget/ImageView;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final v0()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->k:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->j:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->k:Landroid/widget/ImageView;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 16
    .line 17
    .line 18
    new-instance v2, Landroid/view/animation/RotateAnimation;

    .line 19
    .line 20
    const/4 v7, 0x1

    .line 21
    const/high16 v8, 0x3f000000    # 0.5f

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    const/high16 v4, 0x43b40000    # 360.0f

    .line 25
    .line 26
    const/4 v5, 0x1

    .line 27
    const/high16 v6, 0x3f000000    # 0.5f

    .line 28
    .line 29
    invoke-direct/range {v2 .. v8}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 33
    .line 34
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 38
    .line 39
    .line 40
    const-wide/16 v3, 0x258

    .line 41
    .line 42
    invoke-virtual {v2, v3, v4}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 43
    .line 44
    .line 45
    const/4 v0, -0x1

    .line 46
    invoke-virtual {v2, v0}, Landroid/view/animation/Animation;->setRepeatCount(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->k:Landroid/widget/ImageView;

    .line 53
    .line 54
    invoke-virtual {p0, v2}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final w0(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->h:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 6
    .line 7
    const-string v0, "matched"

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final y0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->k:Landroid/widget/ImageView;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/cd10;->s:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->n0(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->j:Landroid/widget/TextView;

    .line 25
    .line 26
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->l8:I

    .line 27
    .line 28
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->l:Lv/VFrame;

    .line 36
    .line 37
    invoke-virtual {p0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    sget-object v0, Ll/cd10;->r:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->n0(Z)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->j:Landroid/widget/TextView;

    .line 53
    .line 54
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->w8:I

    .line 55
    .line 56
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->l:Lv/VFrame;

    .line 64
    .line 65
    invoke-virtual {p0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallNormalItemView;->n0(Z)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->j:Landroid/widget/TextView;

    .line 73
    .line 74
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->v8:I

    .line 75
    .line 76
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->l:Lv/VFrame;

    .line 84
    .line 85
    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final z0(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->j:Landroid/widget/TextView;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->k:Landroid/widget/ImageView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallNormalItemBindings;->j:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
