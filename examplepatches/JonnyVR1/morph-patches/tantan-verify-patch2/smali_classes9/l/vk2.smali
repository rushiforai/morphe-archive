.class public abstract Ll/vk2;
.super Ll/vr4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vr4<",
        "Ll/vxj0;",
        "Ll/pf60<",
        "Ll/ycg;",
        "Ll/y20<",
        "Ljava/lang/Boolean;",
        ">;>;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vr4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/vk2;Ll/pf60;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vk2;->h(Ll/pf60;Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic b(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/pf60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vk2;->i(Ll/pf60;)Ll/vxj0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public abstract f(Ll/ycg;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ycg;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation
.end method

.method public final g(Ll/pf60;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ll/ycg;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;>;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ll/ycg;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ll/y20;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final synthetic h(Ll/pf60;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vr4;->a:Ll/vr4;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/vr4;->a:Ll/vr4;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/vr4;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Ll/y20;

    .line 21
    .line 22
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final i(Ll/pf60;)Ll/vxj0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ll/ycg;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;>;)",
            "Ll/vxj0;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/vk2;->g(Ll/pf60;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/vxj0;->a:Ll/vxj0;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ll/ycg;

    .line 13
    .line 14
    new-instance v1, Ll/uk2;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/uk2;-><init>(Ll/vk2;Ll/pf60;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/vk2;->f(Ll/ycg;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    sget-object p0, Ll/vxj0;->a:Ll/vxj0;

    .line 23
    .line 24
    return-object p0
.end method

.method public final j(Ll/ycg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vk2;->k(Ll/ycg;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/vr4;->a:Ll/vr4;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    check-cast p0, Ll/vk2;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/vk2;->j(Ll/ycg;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public k(Ll/ycg;)V
    .locals 0

    .line 1
    return-void
.end method
