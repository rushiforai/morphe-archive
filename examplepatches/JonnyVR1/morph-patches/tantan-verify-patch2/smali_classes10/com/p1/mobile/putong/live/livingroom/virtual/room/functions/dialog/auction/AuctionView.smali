.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/auction/AuctionView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAuctionDialogViewBindings;
.source "SourceFile"

# interfaces
.implements Ll/iul;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAuctionDialogViewBindings<",
        "Ll/p81;",
        ">;",
        "Ll/iul;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u0003B\u0017\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/auction/AuctionView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAuctionDialogViewBindings;",
        "Ll/p81;",
        "Ll/iul;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Ll/ngn0;",
        "dialog",
        "",
        "a",
        "(Ll/ngn0;)V",
        "c",
        "()V",
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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAuctionDialogViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static i(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/auction/AuctionView;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAuctionDialogViewBindings;->a:Ll/k3m;

    .line 5
    .line 6
    check-cast p0, Ll/p81;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/p81;->L3()V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 12
    .line 13
    return-object p0
.end method


# virtual methods
.method public a(Ll/ngn0;)V
    .locals 2
    .param p1    # Ll/ngn0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAuctionDialogViewBindings;->d:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/y81;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/y81;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/auction/AuctionView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAuctionDialogViewBindings;->d:Lv/VText;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAuctionDialogViewBindings;->c:Lv/VDraweeView;

    .line 24
    .line 25
    invoke-static {}, Ll/bnl0;->y0()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sget v1, Ll/qa00;->y:I

    .line 30
    .line 31
    sub-int/2addr v0, v1

    .line 32
    int-to-float v0, v0

    .line 33
    const v1, 0x3f098d60

    .line 34
    .line 35
    .line 36
    mul-float/2addr v0, v1

    .line 37
    float-to-int v0, v0

    .line 38
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAuctionDialogViewBindings;->c:Lv/VDraweeView;

    .line 42
    .line 43
    sget-object p1, Ll/zft;->g:Ljava/lang/String;

    .line 44
    .line 45
    const-string v0, "context_livingAct"

    .line 46
    .line 47
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public bridge b(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/iul;->b(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge d()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/iul;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge e()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/iul;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
