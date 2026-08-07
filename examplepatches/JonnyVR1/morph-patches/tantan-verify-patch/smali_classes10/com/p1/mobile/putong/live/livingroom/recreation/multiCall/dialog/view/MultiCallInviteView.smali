.class public final Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;
.source "SourceFile"

# interfaces
.implements Ll/k0m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings<",
        "Ll/pg10;",
        ">;",
        "Ll/k0m;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0002\u0008\u0006\u0018\u00002\u00020\u00012\u0008\u0012\u0004\u0012\u00020\u00030\u0002B\u001b\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u001f\u0010\u000e\u001a\u00020\r2\u000e\u0010\u000c\u001a\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\nH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\r\u0010\u0013\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0013\u0010\u0012J\u0017\u0010\u0016\u001a\u00020\u00102\u0006\u0010\u0015\u001a\u00020\u0014H\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0010H\u0014\u00a2\u0006\u0004\u0008\u0018\u0010\u0012J\u001f\u0010\u001d\u001a\u00020\u00102\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001c\u001a\u00020\u001bH\u0002\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u000f\u0010\u001f\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u001f\u0010\u0012R\u0016\u0010\u0015\u001a\u00020\u00148\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008 \u0010!R\u001b\u0010\'\u001a\u00020\"8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008#\u0010$\u001a\u0004\u0008%\u0010&RE\u0010-\u001a,\u0012(\u0012&\u0012\u000c\u0012\n )*\u0004\u0018\u00010\u000b0\u000b )*\u0012\u0012\u000c\u0012\n )*\u0004\u0018\u00010\u000b0\u000b\u0018\u00010\n0\n0(8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008*\u0010$\u001a\u0004\u0008+\u0010,\u00a8\u0006."
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;",
        "Ll/k0m;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;",
        "Ll/pg10;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Ll/nsv;",
        "Ll/mdd0;",
        "user",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallFriendsRollUserView;",
        "p0",
        "(Ll/nsv;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallFriendsRollUserView;",
        "",
        "F",
        "()V",
        "o0",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "R",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "onAttachedToWindow",
        "",
        "isTabSelected",
        "Lcom/google/android/material/tabs/TabLayout$Tab;",
        "tab",
        "s0",
        "(ZLcom/google/android/material/tabs/TabLayout$Tab;)V",
        "q0",
        "l",
        "Lcom/p1/mobile/android/app/Act;",
        "Ll/ef10;",
        "m",
        "Lkotlin/Lazy;",
        "getInvitePageAdapter",
        "()Ll/ef10;",
        "invitePageAdapter",
        "",
        "kotlin.jvm.PlatformType",
        "n",
        "getUserPicList",
        "()Ljava/util/List;",
        "userPicList",
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
.field public l:Lcom/p1/mobile/android/app/Act;

.field public final m:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final n:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
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

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    sget-object p1, Lkotlin/LazyThreadSafetyMode;->NONE:Lkotlin/LazyThreadSafetyMode;

    .line 8
    .line 9
    new-instance p2, Ll/yf10;

    .line 10
    .line 11
    invoke-direct {p2, p0}, Ll/yf10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->m:Lkotlin/Lazy;

    .line 19
    .line 20
    new-instance p2, Ll/zf10;

    .line 21
    .line 22
    invoke-direct {p2}, Ll/zf10;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, p2}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->n:Lkotlin/Lazy;

    .line 30
    .line 31
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 32
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private final getInvitePageAdapter()Ll/ef10;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->m:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ef10;

    .line 8
    .line 9
    return-object p0
.end method

.method private final getUserPicList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/nsv<",
            "Ll/mdd0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->n:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public static i0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/widget/TextView;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    const/16 v1, 0xd

    .line 14
    .line 15
    invoke-static {v1}, Ll/txq;->c(I)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x7

    .line 20
    invoke-static {v3}, Ll/txq;->c(I)I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    invoke-static {v1}, Ll/txq;->c(I)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-static {v3}, Ll/txq;->c(I)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 33
    .line 34
    .line 35
    const/16 v1, 0x11

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->getInvitePageAdapter()Ll/ef10;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, p2}, Ll/ef10;->J(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;Ll/nsv;)Lcom/p1/mobile/putong/live/base/view/RollItemView;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->r0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;Ll/nsv;)Lcom/p1/mobile/putong/live/base/view/RollItemView;

    move-result-object p0

    return-object p0
.end method

.method public static k0()Ljava/util/List;
    .locals 7

    .line 1
    new-instance v0, Ll/mdd0;

    .line 2
    .line 3
    sget v1, Ll/obc0;->Q3:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x2

    .line 7
    invoke-direct {v0, v1, v2, v3, v2}, Ll/mdd0;-><init>(ILjava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/mdd0;

    .line 15
    .line 16
    sget v4, Ll/obc0;->R3:I

    .line 17
    .line 18
    invoke-direct {v1, v4, v2, v3, v2}, Ll/mdd0;-><init>(ILjava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v4, Ll/mdd0;

    .line 26
    .line 27
    sget v5, Ll/obc0;->S3:I

    .line 28
    .line 29
    invoke-direct {v4, v5, v2, v3, v2}, Ll/mdd0;-><init>(ILjava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v4}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    new-instance v5, Ll/mdd0;

    .line 37
    .line 38
    sget v6, Ll/obc0;->Q3:I

    .line 39
    .line 40
    invoke-direct {v5, v6, v2, v3, v2}, Ll/mdd0;-><init>(ILjava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v5}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    filled-new-array {v0, v1, v4, v2}, [Ll/nsv;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    return-object v0
.end method

.method public static l0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/jr10;->INSTANCE:Ll/jr10;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/jr10;->i()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->d:Ll/k3m;

    .line 10
    .line 11
    check-cast p0, Ll/pg10;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/pg10;->d4()V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 17
    .line 18
    return-object p0
.end method

.method public static m0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;)Ll/ef10;
    .locals 2

    .line 1
    new-instance v0, Ll/ef10;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->l:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const-string v1, "act"

    .line 8
    .line 9
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->d:Ll/k3m;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    check-cast p0, Ll/pg10;

    .line 19
    .line 20
    invoke-direct {v0, v1, p0}, Ll/ef10;-><init>(Lcom/p1/mobile/android/app/Act;Ll/pg10;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static final synthetic n0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;ZLcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->s0(ZLcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final p0(Ll/nsv;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallFriendsRollUserView;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/mdd0;",
            ">;)",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallFriendsRollUserView;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/yec0;->k4:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    instance-of v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallFriendsRollUserView;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    move-object v0, p0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallFriendsRollUserView;

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    invoke-static {v1}, Ll/txq;->c(I)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallFriendsRollUserView;->setViewPadding(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallFriendsRollUserView;->a(Ll/nsv;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallFriendsRollUserView;

    .line 40
    .line 41
    return-object p0
.end method

.method public static final r0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;Ll/nsv;)Lcom/p1/mobile/putong/live/base/view/RollItemView;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->p0(Ll/nsv;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallFriendsRollUserView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public F()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/k0m;->F()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->d:Ll/k3m;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    check-cast p0, Ll/pg10;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, 0x3

    .line 13
    invoke-static {p0, v0, v0, v1, v0}, Ll/pg10;->g4(Ll/pg10;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public R(Lcom/p1/mobile/android/app/Act;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->l:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->k:Landroidx/viewpager2/widget/ViewPager2;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->getInvitePageAdapter()Ll/ef10;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->g:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/wf10;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/wf10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v1}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->d:Ll/k3m;

    .line 33
    .line 34
    check-cast p1, Ll/pg10;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/pg10;->c4()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v1, 0x4

    .line 41
    const/4 v2, 0x1

    .line 42
    if-ne p1, v1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->k:Landroidx/viewpager2/widget/ViewPager2;

    .line 45
    .line 46
    invoke-virtual {p1, v0, v0}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->d:Ll/k3m;

    .line 51
    .line 52
    check-cast p1, Ll/pg10;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/pg10;->c4()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    const/4 v1, 0x3

    .line 59
    if-ne p1, v1, :cond_1

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->k:Landroidx/viewpager2/widget/ViewPager2;

    .line 62
    .line 63
    invoke-virtual {p1, v2, v0}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->d:Ll/k3m;

    .line 67
    .line 68
    check-cast p1, Ll/pg10;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 79
    .line 80
    const-string v1, "friends"

    .line 81
    .line 82
    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->j:Lcom/google/android/material/tabs/TabLayout;

    .line 87
    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->j:Lcom/google/android/material/tabs/TabLayout;

    .line 98
    .line 99
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView$a;

    .line 100
    .line 101
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 105
    .line 106
    .line 107
    new-instance p1, Lcom/google/android/material/tabs/TabLayoutMediator;

    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->j:Lcom/google/android/material/tabs/TabLayout;

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->k:Landroidx/viewpager2/widget/ViewPager2;

    .line 112
    .line 113
    new-instance v2, Ll/xf10;

    .line 114
    .line 115
    invoke-direct {v2, p0}, Ll/xf10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;)V

    .line 116
    .line 117
    .line 118
    invoke-direct {p1, v0, v1, v2}, Lcom/google/android/material/tabs/TabLayoutMediator;-><init>(Lcom/google/android/material/tabs/TabLayout;Landroidx/viewpager2/widget/ViewPager2;Lcom/google/android/material/tabs/TabLayoutMediator$TabConfigurationStrategy;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayoutMediator;->attach()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public final o0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->getInvitePageAdapter()Ll/ef10;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ef10;->L()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->q0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final q0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallInviteViewBindings;->h:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallRollAnimView;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;->getUserPicList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->setUsers(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/ag10;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/ag10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallInviteView;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->setItemViewFunc(Ll/qcj;)V

    .line 16
    .line 17
    .line 18
    const/16 p0, 0x9c4

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->setDelay(I)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->O()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final s0(ZLcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p2, p0, Landroid/widget/TextView;

    .line 6
    .line 7
    if-eqz p2, :cond_2

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget p2, Ll/n9c0;->R:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget p2, Ll/n9c0;->N:I

    .line 15
    .line 16
    :goto_0
    check-cast p0, Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    sget p1, Ll/obc0;->W:I

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    sget p1, Ll/obc0;->a1:I

    .line 31
    .line 32
    :goto_1
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    :cond_2
    return-void
.end method
