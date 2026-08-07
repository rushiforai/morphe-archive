.class public final Ll/ef10;
.super Ll/wb10;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\n\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\r\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J/\u0010\u0015\u001a\u00020\u000c2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u00082\u0006\u0010\u0014\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0015\u0010\u0017\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0017\u0010\u000bJ\u000f\u0010\u0019\u001a\u00020\u0018H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001cR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010\u001e\u00a8\u0006\u001f"
    }
    d2 = {
        "Ll/ef10;",
        "Ll/wb10;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Ll/pg10;",
        "presenter",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Ll/pg10;)V",
        "",
        "position",
        "getItemViewType",
        "(I)I",
        "",
        "L",
        "()V",
        "C",
        "()I",
        "Landroid/view/View;",
        "convertView",
        "item",
        "itemViewType",
        "E",
        "(Landroid/view/View;III)V",
        "J",
        "",
        "K",
        "()Z",
        "f",
        "Lcom/p1/mobile/android/app/Act;",
        "g",
        "Ll/pg10;",
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
.field public final f:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final g:Ll/pg10;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/pg10;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/pg10;
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
    invoke-direct {p0, p1, p2}, Ll/wb10;-><init>(Lcom/p1/mobile/android/app/Act;Ll/i6t;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/ef10;->f:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Ll/ef10;->g:Ll/pg10;

    .line 13
    .line 14
    return-void
.end method

.method public static H()Lkotlin/Unit;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object v0
.end method

.method public static I()Lkotlin/Unit;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/Number;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ef10;->E(Landroid/view/View;III)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ef10;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x2

    .line 10
    return p0
.end method

.method public E(Landroid/view/View;III)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    instance-of p2, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;

    .line 9
    .line 10
    iget-object p2, p0, Ll/ef10;->g:Ll/pg10;

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;->i1(Ll/k3m;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/ef10;->f:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->R(Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    instance-of p2, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallLivingFriendView;

    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallLivingFriendView;

    .line 26
    .line 27
    iget-object p2, p0, Ll/ef10;->g:Ll/pg10;

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallLivingFriendBindings;->i1(Ll/k3m;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/ef10;->f:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallLivingFriendView;->R(Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public final J(I)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ef10;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->k9:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    if-eqz p1, :cond_2

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    if-eq p1, p0, :cond_1

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->k9:I

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->k9:I

    .line 19
    .line 20
    return p0

    .line 21
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->G8:I

    .line 22
    .line 23
    return p0
.end method

.method public final K()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ef10;->g:Ll/pg10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "friends"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final L()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wb10;->F()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/wb10;->F()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;

    .line 17
    .line 18
    new-instance v0, Ll/cf10;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/cf10;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/df10;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/df10;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->r0(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/wb10;->F()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    instance-of v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallLivingFriendView;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Ll/ef10;->g:Ll/pg10;

    .line 41
    .line 42
    const/4 v0, 0x3

    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-static {p0, v1, v1, v0, v1}, Ll/pg10;->g4(Ll/pg10;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ef10;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget p0, Ll/yec0;->b4:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    if-eqz p1, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eq p1, v0, :cond_1

    .line 14
    .line 15
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_1
    sget p0, Ll/yec0;->b4:I

    .line 21
    .line 22
    return p0

    .line 23
    :cond_2
    sget p0, Ll/yec0;->n4:I

    .line 24
    .line 25
    return p0
.end method
