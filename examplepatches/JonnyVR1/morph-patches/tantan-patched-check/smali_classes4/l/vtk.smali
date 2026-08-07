.class public Ll/vtk;
.super Ll/o8l;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/o8l;-><init>(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Ll/p8l$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p8l$a;->b:Ll/b240;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b240;->Y4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h(Ll/p8l$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p8l$a;->b:Ll/b240;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, v1}, Ll/iz40;->y(Lcom/p1/mobile/android/app/Act;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/p8l$a;->b:Ll/b240;

    .line 15
    .line 16
    iget-object p0, p0, Ll/b240;->G:Lrx/subjects/a;

    .line 17
    .line 18
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method


# virtual methods
.method public d(Ll/p8l$a;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->D2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0, v0}, Ll/iz40;->G(Lcom/p1/mobile/android/app/Act;Z)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v1, Ll/ttk;

    .line 21
    .line 22
    invoke-direct {v1, p1}, Ll/ttk;-><init>(Ll/p8l$a;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/utk;

    .line 26
    .line 27
    invoke-direct {v2, p1}, Ll/utk;-><init>(Ll/p8l$a;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, v1, v2}, Ll/iz40;->F(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    return v0
.end method

.method public f(Ll/p8l$a;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/spl0;->w()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Ll/uqb0;->i0:Ll/z1f;

    .line 8
    .line 9
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Ll/o8l;->a:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "e_page_switch"

    .line 20
    .line 21
    const-string v2, "p_suggest_users_home_view"

    .line 22
    .line 23
    invoke-virtual {v0, p0, v1, v2}, Ll/rj50;->Y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/y1f;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Ll/z1f;->a(Ll/y1f;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method
