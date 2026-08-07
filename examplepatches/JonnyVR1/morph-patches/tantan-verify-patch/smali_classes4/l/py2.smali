.class public Ll/py2;
.super Ll/n4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/n4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/p8l$a;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/iz40;->y(Lcom/p1/mobile/android/app/Act;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/p8l$a;->b:Ll/b240;

    .line 13
    .line 14
    iget-object p0, p0, Ll/b240;->G:Lrx/subjects/a;

    .line 15
    .line 16
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/py2;->d(Ll/p8l$a;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/py2;->e(Ll/p8l$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Ll/p8l$a;)Ljava/lang/Boolean;
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v2, Ll/oy2;

    .line 6
    .line 7
    invoke-direct {v2, p1}, Ll/oy2;-><init>(Ll/p8l$a;)V

    .line 8
    .line 9
    .line 10
    const/4 v4, 0x1

    .line 11
    const/4 v5, 0x0

    .line 12
    const-string v1, ""

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-static/range {v0 .. v5}, Ll/qtk;->P0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;ZZLl/x20;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 19
    .line 20
    return-object p0
.end method

.method public e(Ll/p8l$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
