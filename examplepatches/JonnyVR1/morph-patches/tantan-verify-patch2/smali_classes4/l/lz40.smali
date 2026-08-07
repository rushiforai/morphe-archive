.class public Ll/lz40;
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
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p8l$a;->b:Ll/b240;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b240;->G:Lrx/subjects/a;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic d(Ll/p8l$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p8l$a;->b:Ll/b240;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/b240;->Y4()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/p8l$a;->b:Ll/b240;

    .line 7
    .line 8
    iget-object p0, p0, Ll/b240;->G:Lrx/subjects/a;

    .line 9
    .line 10
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lz40;->e(Ll/p8l$a;)Ljava/lang/Boolean;

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
    invoke-virtual {p0, p1}, Ll/lz40;->f(Ll/p8l$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e(Ll/p8l$a;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/jz40;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/jz40;-><init>(Ll/p8l$a;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/kz40;

    .line 11
    .line 12
    invoke-direct {v1, p1}, Ll/kz40;-><init>(Ll/p8l$a;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0, v1}, Ll/iz40;->F(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 19
    .line 20
    return-object p0
.end method

.method public f(Ll/p8l$a;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/iz40;->x(Lcom/p1/mobile/android/app/Act;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
