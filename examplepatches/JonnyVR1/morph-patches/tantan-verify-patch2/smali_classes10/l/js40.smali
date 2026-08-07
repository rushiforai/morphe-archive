.class public final Ll/js40;
.super Ll/lq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/lq2<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;",
        "Ll/scp0<",
        "*>;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000b\u0018\u0000*\u0008\u0008\u0000\u0010\u0002*\u00020\u00012\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00050\u0003B#\u0012\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0006\u0012\u000c\u0010\t\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0015\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0005H\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0012\u001a\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0018\u001a\u00020\u00132\u0006\u0010\u0017\u001a\u00020\u0016H\u0014\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0013H\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\u0013H\u0016\u00a2\u0006\u0004\u0008\u001c\u0010\u001bR\u001d\u0010\t\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001d\u0010\u001e\u001a\u0004\u0008\u001f\u0010 \u00a8\u0006!"
    }
    d2 = {
        "Ll/js40;",
        "Ll/rwn0;",
        "D",
        "Ll/lq2;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;",
        "Ll/scp0;",
        "Ll/dum;",
        "curInfo",
        "Ll/e9m0;",
        "manager",
        "<init>",
        "(Ll/dum;Ll/e9m0;)V",
        "",
        "g",
        "()I",
        "s",
        "()Ll/scp0;",
        "Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;",
        "type",
        "",
        "m",
        "(Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;)V",
        "Landroid/view/ViewGroup;",
        "viewGroup",
        "r",
        "(Landroid/view/ViewGroup;)V",
        "o",
        "()V",
        "p",
        "h",
        "Ll/e9m0;",
        "getManager",
        "()Ll/e9m0;",
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
.field public final h:Ll/e9m0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/e9m0<",
            "TD;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ll/e9m0;)V
    .locals 1
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/e9m0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Ll/e9m0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const-string v0, "nineDeputy"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p0, p1, v0}, Ll/lq2;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/js40;->h:Ll/e9m0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public g()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->Va:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic h()Ll/l6t;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/js40;->s()Ll/scp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/lq2;->m(Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/lq2;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/js40;->h:Ll/e9m0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/e9m0;->L3()Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/lq2;->c:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->t0()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/lq2;->p()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/js40;->h:Ll/e9m0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/e9m0;->L3()Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/lq2;->c:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->v0()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public r(Landroid/view/ViewGroup;)V
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/lq2;->r(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    instance-of p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 16
    .line 17
    const/high16 p1, 0x41400000    # 12.0f

    .line 18
    .line 19
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 24
    .line 25
    const/high16 p1, 0x41200000    # 10.0f

    .line 26
    .line 27
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public s()Ll/scp0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/scp0<",
            "TD;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lq2;->a:Ll/dum;

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/dum;->d:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/odp0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/odp0;-><init>(Ll/dum;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    new-instance v0, Ll/sdp0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/sdp0;-><init>(Ll/dum;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
