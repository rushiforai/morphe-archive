.class public Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->T4(Z)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;->b:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;->e(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;Ll/gcg0;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;->d(Ll/gcg0;Z)V

    return-void
.end method


# virtual methods
.method public c(Ll/gcg0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/qfd0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/qfd0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;->b:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ll/rgd0;->e(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    .line 11
    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;->a:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;->b:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/rgd0;->p()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {p1, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    new-instance v1, Ll/rfd0;

    .line 33
    .line 34
    invoke-direct {v1, p0, v0}, Ll/rfd0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;->c(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic d(Ll/gcg0;Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;->b:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    xor-int/lit8 v0, p2, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setFullSlide(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;->b:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rgd0;->u(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
