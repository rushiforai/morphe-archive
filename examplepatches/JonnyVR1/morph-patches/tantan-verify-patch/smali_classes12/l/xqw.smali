.class public Ll/xqw;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xqw$b;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private b:Ll/iml;

.field private c:Ll/rde0;

.field private d:Ll/yse0;

.field private e:Ll/b6g0;

.field private f:Ll/krq;

.field private g:Ll/klw;

.field private h:Ll/uzv;


# direct methods
.method private constructor <init>(Ll/xqw$b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/xqw$b;->a(Ll/xqw$b;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/xqw;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Ll/xqw$b;->b(Ll/xqw$b;)Ll/e6f;

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Ll/xqw$b;->c(Ll/xqw$b;)Ll/iml;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/xqw;->b:Ll/iml;

    .line 18
    .line 19
    invoke-static {p1}, Ll/xqw$b;->d(Ll/xqw$b;)Ll/xim;

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Ll/xqw$b;->e(Ll/xqw$b;)Ll/rde0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/xqw;->c:Ll/rde0;

    .line 27
    .line 28
    invoke-static {p1}, Ll/xqw$b;->f(Ll/xqw$b;)Ll/yse0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/xqw;->d:Ll/yse0;

    .line 33
    .line 34
    invoke-static {p1}, Ll/xqw$b;->g(Ll/xqw$b;)Ll/b6g0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/xqw;->e:Ll/b6g0;

    .line 39
    .line 40
    invoke-static {p1}, Ll/xqw$b;->h(Ll/xqw$b;)Ll/krq;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ll/xqw;->f:Ll/krq;

    .line 45
    .line 46
    invoke-static {p1}, Ll/xqw$b;->i(Ll/xqw$b;)Ll/klw;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Ll/xqw;->g:Ll/klw;

    .line 51
    .line 52
    invoke-static {p1}, Ll/xqw$b;->j(Ll/xqw$b;)Ll/uzv;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Ll/xqw;->h:Ll/uzv;

    .line 57
    .line 58
    return-void
.end method

.method public synthetic constructor <init>(Ll/xqw$b;Ll/xqw$a;)V
    .locals 0

    .line 59
    invoke-direct {p0, p1}, Ll/xqw;-><init>(Ll/xqw$b;)V

    return-void
.end method


# virtual methods
.method public a()Ll/iml;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xqw;->b:Ll/iml;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/jpd;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/jpd;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/xqw;->b:Ll/iml;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/xqw;->b:Ll/iml;

    .line 13
    .line 14
    return-object p0
.end method

.method public b()Ll/xim;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public c()Ll/krq;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xqw;->f:Ll/krq;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/tpd;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/tpd;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/xqw;->f:Ll/krq;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/xqw;->f:Ll/krq;

    .line 13
    .line 14
    return-object p0
.end method

.method public d()Ll/uzv;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xqw;->h:Ll/uzv;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/aqd;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/aqd;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/xqw;->h:Ll/uzv;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/xqw;->h:Ll/uzv;

    .line 13
    .line 14
    return-object p0
.end method

.method public e()Ll/klw;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xqw;->g:Ll/klw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/bqd;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/bqd;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/xqw;->g:Ll/klw;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/xqw;->g:Ll/klw;

    .line 13
    .line 14
    return-object p0
.end method

.method public f()Ll/rde0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xqw;->c:Ll/rde0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/esd;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/esd;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/xqw;->c:Ll/rde0;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/xqw;->c:Ll/rde0;

    .line 13
    .line 14
    return-object p0
.end method

.method public g()Ll/yse0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xqw;->d:Ll/yse0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/hsd;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/hsd;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/xqw;->d:Ll/yse0;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/xqw;->d:Ll/yse0;

    .line 13
    .line 14
    return-object p0
.end method

.method public h()Ll/b6g0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xqw;->e:Ll/b6g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/isd;

    .line 6
    .line 7
    const-string v1, "MWC_MMKV_DEFAULT_LOCALSTORAGE_KEY"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/isd;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/xqw;->e:Ll/b6g0;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/xqw;->e:Ll/b6g0;

    .line 15
    .line 16
    return-object p0
.end method
