.class public Ll/qdt;
.super Ll/eft;
.source "SourceFile"

# interfaces
.implements Ll/rwl;


# instance fields
.field public final b:Ll/b4m;

.field public c:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/b4m;Ll/pcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b4m;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/eft;-><init>(Ll/rwl;)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p0}, Ll/eft;->S0(Ll/rwl;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/qdt;->b:Ll/b4m;

    .line 9
    .line 10
    iput-object p2, p0, Ll/qdt;->c:Ll/pcj;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public J()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qdt;->c:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/qdt;->b:Ll/b4m;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/b4m;->J()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public N0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qdt;->c:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/qdt;->b:Ll/b4m;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ll/b4m;->N0(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qdt;->c:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/qdt;->b:Ll/b4m;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-interface {p0, v0}, Ll/b4m;->d(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public V()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qdt;->c:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/qdt;->b:Ll/b4m;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-interface {p0, v0}, Ll/b4m;->d(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qdt;->c:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/qdt;->b:Ll/b4m;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/b4m;->l()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public s0()V
    .locals 0

    .line 1
    return-void
.end method

.method public y(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qdt;->c:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/qdt;->b:Ll/b4m;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ll/b4m;->y(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
