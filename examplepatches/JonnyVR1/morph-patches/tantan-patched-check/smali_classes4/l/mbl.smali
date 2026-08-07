.class public Ll/mbl;
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

.method public static synthetic g(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public d(Ll/p8l$a;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object p0, p0, Ll/o8l;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ll/rj50;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v1, Ll/lbl;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/lbl;-><init>()V

    .line 30
    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {v0, p1, p0, v2, v1}, Ll/rj50;->u0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZLl/y20;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public f(Ll/p8l$a;)Z
    .locals 3

    .line 1
    sget-object p1, Ll/uqb0;->i0:Ll/z1f;

    .line 2
    .line 3
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/o8l;->a:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "e_page_switch"

    .line 14
    .line 15
    const-string v2, "p_suggest_users_home_view"

    .line 16
    .line 17
    invoke-virtual {v0, p0, v1, v2}, Ll/rj50;->Y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/y1f;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Ll/z1f;->a(Ll/y1f;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method
