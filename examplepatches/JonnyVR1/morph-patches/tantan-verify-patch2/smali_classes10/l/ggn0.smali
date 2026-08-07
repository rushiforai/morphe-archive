.class public final Ll/ggn0;
.super Ll/lq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/lq2<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/LiveVirtualVoiceFunctionPanelView<",
        "TD;>;",
        "Ll/yzu<",
        "TD;>;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\n\u0018\u0000*\u0008\u0008\u0000\u0010\u0002*\u00020\u00012\u001a\u0012\n\u0012\u0008\u0012\u0004\u0012\u00028\u00000\u0004\u0012\n\u0012\u0008\u0012\u0004\u0012\u00028\u00000\u00050\u0003B#\u0012\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0006\u0012\u000c\u0010\t\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0015\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0005H\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0013R\u001a\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016R\u001d\u0010\t\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0017\u0010\u0018\u001a\u0004\u0008\u0019\u0010\u001a\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/ggn0;",
        "Ll/rwn0;",
        "D",
        "Ll/lq2;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/LiveVirtualVoiceFunctionPanelView;",
        "Ll/yzu;",
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
        "()Ll/yzu;",
        "",
        "o",
        "()V",
        "p",
        "h",
        "Ll/dum;",
        "i",
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
.field public final h:Ll/dum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dum<",
            "TD;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final i:Ll/e9m0;
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
    const-string v0, "functionPanel"

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
    iput-object p1, p0, Ll/ggn0;->h:Ll/dum;

    .line 17
    .line 18
    iput-object p2, p0, Ll/ggn0;->i:Ll/e9m0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public g()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->a7:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic h()Ll/l6t;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ggn0;->s()Ll/yzu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/lq2;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ggn0;->i:Ll/e9m0;

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
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/LiveVirtualVoiceFunctionPanelView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/LiveVirtualVoiceFunctionPanelView;->r0()V

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
    iget-object v0, p0, Ll/ggn0;->i:Ll/e9m0;

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
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/LiveVirtualVoiceFunctionPanelView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/LiveVirtualVoiceFunctionPanelView;->u0()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public s()Ll/yzu;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/yzu<",
            "TD;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/yzu;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ggn0;->h:Ll/dum;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/yzu;-><init>(Ll/dum;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
