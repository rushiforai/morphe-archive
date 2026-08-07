.class public Ll/loh0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field final b:[Ll/aje;

.field private c:Ll/qe00;


# direct methods
.method public varargs constructor <init>([Ll/aje;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/loh0;->b:[Ll/aje;

    .line 5
    .line 6
    return-void
.end method

.method private b()V
    .locals 1

    .line 1
    invoke-static {}, Ll/koh0;->j()Ll/koh0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/koh0;->g(Ll/loh0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private g()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/cje;->l(Ll/loh0;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/loh0;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/loh0;->c:Ll/qe00;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/qe00;->a(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d(ID)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/loh0;->c:Ll/qe00;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/qe00;->onProcess(ID)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/loh0;->c:Ll/qe00;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/qe00;->onSuccess()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-direct {p0}, Ll/loh0;->g()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f(Ll/qe00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/loh0;->c:Ll/qe00;

    .line 2
    .line 3
    return-void
.end method
