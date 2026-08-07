.class public Ll/fqw$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fqw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:Ll/fqw;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/fqw;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/fqw;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/fqw$a;->a:Ll/fqw;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ll/fqw$a;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/fqw$a;->a:Ll/fqw;

    .line 8
    .line 9
    iput-object p1, v0, Ll/fqw;->b:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Lcom/immomo/momo/mulog/exception/MULogIllegalStateException;

    .line 13
    .line 14
    const-string p1, "appId must not be null"

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/immomo/momo/mulog/exception/MULogIllegalStateException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method public b()Ll/fqw;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fqw$a;->a:Ll/fqw;

    .line 2
    .line 3
    iget-object v1, v0, Ll/fqw;->g:Ll/tof0;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    new-instance v1, Ll/tof0;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/tof0;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, v0, Ll/fqw;->g:Ll/tof0;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/fqw$a;->a:Ll/fqw;

    .line 15
    .line 16
    iget-object v1, v0, Ll/fqw;->e:Ll/fqw$e;

    .line 17
    .line 18
    if-nez v1, :cond_1

    .line 19
    .line 20
    new-instance v1, Ll/rrd;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/rrd;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, v0, Ll/fqw;->e:Ll/fqw$e;

    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Ll/fqw$a;->a:Ll/fqw;

    .line 28
    .line 29
    iget-object v1, v0, Ll/fqw;->f:Ll/fqw$d;

    .line 30
    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    new-instance v1, Ll/pqd;

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-direct {v1, v2}, Ll/pqd;-><init>(Z)V

    .line 37
    .line 38
    .line 39
    iput-object v1, v0, Ll/fqw;->f:Ll/fqw$d;

    .line 40
    .line 41
    :cond_2
    iget-object p0, p0, Ll/fqw$a;->a:Ll/fqw;

    .line 42
    .line 43
    return-object p0
.end method

.method public varargs c([Ll/ywl;)Ll/fqw$a;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/fqw$a;->a:Ll/fqw;

    .line 7
    .line 8
    iget-object v0, v0, Ll/fqw;->h:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-object p0
.end method

.method public d(Ll/tof0;)Ll/fqw$a;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/immomo/momo/mulog/exception/MULogIllegalParamsException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fqw$a;->a:Ll/fqw;

    .line 2
    .line 3
    iput-object p1, v0, Ll/fqw;->g:Ll/tof0;

    .line 4
    .line 5
    return-object p0
.end method

.method public e(Z)Ll/fqw$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fqw$a;->a:Ll/fqw;

    .line 2
    .line 3
    iput-boolean p1, v0, Ll/fqw;->a:Z

    .line 4
    .line 5
    return-object p0
.end method

.method public f(Ll/xxl;)Ll/fqw$a;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/fqw$a;->a:Ll/fqw;

    .line 4
    .line 5
    iput-object p1, v0, Ll/fqw;->d:Ll/xxl;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "requester should be set"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public g(Ljava/lang/String;)Ll/fqw$a;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/fqw$a;->a:Ll/fqw;

    .line 8
    .line 9
    iput-object p1, v0, Ll/fqw;->c:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Lcom/immomo/momo/mulog/exception/MULogIllegalStateException;

    .line 13
    .line 14
    const-string p1, "secret must not be null"

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/immomo/momo/mulog/exception/MULogIllegalStateException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method
