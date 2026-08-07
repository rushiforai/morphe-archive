.class public Ll/rgd0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rgd0;->n(Lcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/rgd0;


# direct methods
.method public constructor <init>(Ll/rgd0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/rgd0$b;->b:Ll/rgd0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/rgd0$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(ZLcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;ZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rgd0$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/rgd0$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/c;->a:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/rgd0$b;->b:Ll/rgd0;

    .line 20
    .line 21
    invoke-static {p0}, Ll/rgd0;->c(Ll/rgd0;)Ll/ogd0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ogd0;->B1(ZLcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;ZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rgd0$b;->b:Ll/rgd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/rgd0;->c(Ll/rgd0;)Ll/ogd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x4

    .line 8
    invoke-virtual {p0, v0}, Ll/ogd0;->P0(I)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    xor-int/lit8 p0, p0, 0x1

    .line 13
    .line 14
    return p0
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rgd0$b;->b:Ll/rgd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/rgd0;->c(Ll/rgd0;)Ll/ogd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x6

    .line 8
    invoke-virtual {p0, v0}, Ll/ogd0;->e1(I)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d(Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0$b;->b:Ll/rgd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/rgd0;->c(Ll/rgd0;)Ll/ogd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/ogd0;->m1(Z)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0$b;->b:Ll/rgd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/rgd0;->c(Ll/rgd0;)Ll/ogd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/ogd0;->o1(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0$b;->b:Ll/rgd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/rgd0;->c(Ll/rgd0;)Ll/ogd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/ogd0;->t0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rgd0$b;->b:Ll/rgd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/rgd0;->c(Ll/rgd0;)Ll/ogd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Ll/ogd0;->e1(I)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0$b;->b:Ll/rgd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/rgd0;->c(Ll/rgd0;)Ll/ogd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Ll/ogd0;->s1(Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0$b;->b:Ll/rgd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/rgd0;->c(Ll/rgd0;)Ll/ogd0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/ogd0;->r1()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
