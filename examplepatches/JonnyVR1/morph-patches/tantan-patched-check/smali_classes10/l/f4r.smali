.class public final Ll/f4r;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000e\u0010\u000f\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "Ll/f4r;",
        "Ll/d3q;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;",
        "content",
        "<init>",
        "(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;)V",
        "",
        "o",
        "()I",
        "itemView",
        "",
        "H",
        "(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;)V",
        "a",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;",
        "getContent",
        "()Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;",
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
.field public final a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/f4r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/f4r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;->setData(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/bean/KtvAcousticsBean;)V

    .line 10
    .line 11
    .line 12
    sget p0, Ll/qa00;->i:I

    .line 13
    .line 14
    invoke-static {p1, p0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/bnl0;->y0()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    sget v0, Ll/qa00;->I:I

    .line 22
    .line 23
    sub-int/2addr p0, v0

    .line 24
    int-to-float p0, p0

    .line 25
    const/high16 v0, 0x40800000    # 4.0f

    .line 26
    .line 27
    div-float/2addr p0, v0

    .line 28
    const v0, 0x3f95e50d

    .line 29
    .line 30
    .line 31
    mul-float/2addr p0, v0

    .line 32
    float-to-int p0, p0

    .line 33
    invoke-static {p1, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->W2:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f4r;->H(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAcousticsItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
