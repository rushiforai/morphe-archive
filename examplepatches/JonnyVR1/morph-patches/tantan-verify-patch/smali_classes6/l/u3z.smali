.class public Ll/u3z;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:J

.field public c:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/xsl;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/xsl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MessageCenter"

    .line 5
    .line 6
    iput-object v0, p0, Ll/u3z;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Ll/u3z;->b:J

    .line 11
    .line 12
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/u3z;->c:Lrx/subjects/b;

    .line 17
    .line 18
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/u3z;->d:Lrx/subjects/b;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Ll/xsl;)Ll/xsl;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ll/u3z;Ljava/lang/Class;Ll/xsl;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u3z;->i(Ljava/lang/Class;Ll/xsl;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/u3z;Ljava/lang/Class;[ILl/xsl;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/u3z;->j(Ljava/lang/Class;[ILl/xsl;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/xsl;)Ll/xsl;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public e(Ljava/lang/Class;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/xsl;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u3z;->d:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/s3z;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/s3z;-><init>(Ll/u3z;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/t3z;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/t3z;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final f(Ljava/lang/Class;Ll/xsl;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/xsl;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ll/xsl;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final g([ILl/xsl;)Z
    .locals 5

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x1

    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    array-length p0, p1

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, p0, :cond_2

    .line 10
    .line 11
    aget v3, p1, v2

    .line 12
    .line 13
    invoke-interface {p2}, Ll/xsl;->getAction()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-ne v3, v4, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    return v1
.end method

.method public varargs h(Ljava/lang/Class;[I)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/xsl;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;[I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u3z;->c:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/q3z;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, p2}, Ll/q3z;-><init>(Ll/u3z;Ljava/lang/Class;[I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/r3z;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/r3z;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final synthetic i(Ljava/lang/Class;Ll/xsl;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u3z;->f(Ljava/lang/Class;Ll/xsl;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic j(Ljava/lang/Class;[ILl/xsl;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3}, Ll/u3z;->f(Ljava/lang/Class;Ll/xsl;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2, p3}, Ll/u3z;->g([ILl/xsl;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public k(Ll/wpl;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/wpl<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/u3z;->d:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ll/xsl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u3z;->c:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
