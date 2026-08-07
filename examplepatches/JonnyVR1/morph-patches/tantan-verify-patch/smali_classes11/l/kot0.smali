.class public final Ll/kot0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/glt0;

.field public b:Ll/nqt0;

.field public c:Ll/pcw0;

.field public d:Ll/zqt0;

.field public e:Ll/w8w0;


# direct methods
.method public synthetic constructor <init>(Ll/jot0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Ll/dlt0;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/kot0;->a:Ll/glt0;

    .line 2
    .line 3
    const-class v1, Ll/glt0;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/kot0;->b:Ll/nqt0;

    .line 9
    .line 10
    const-class v1, Ll/nqt0;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/kot0;->c:Ll/pcw0;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ll/pcw0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/pcw0;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/kot0;->c:Ll/pcw0;

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Ll/kot0;->d:Ll/zqt0;

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    new-instance v0, Ll/zqt0;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/zqt0;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/kot0;->d:Ll/zqt0;

    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Ll/kot0;->e:Ll/w8w0;

    .line 38
    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    new-instance v0, Ll/w8w0;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/w8w0;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ll/kot0;->e:Ll/w8w0;

    .line 47
    .line 48
    :cond_2
    new-instance v1, Ll/ont0;

    .line 49
    .line 50
    iget-object v2, p0, Ll/kot0;->a:Ll/glt0;

    .line 51
    .line 52
    iget-object v3, p0, Ll/kot0;->b:Ll/nqt0;

    .line 53
    .line 54
    iget-object v4, p0, Ll/kot0;->c:Ll/pcw0;

    .line 55
    .line 56
    iget-object v5, p0, Ll/kot0;->d:Ll/zqt0;

    .line 57
    .line 58
    iget-object v6, p0, Ll/kot0;->e:Ll/w8w0;

    .line 59
    .line 60
    const/4 v7, 0x0

    .line 61
    invoke-direct/range {v1 .. v7}, Ll/ont0;-><init>(Ll/glt0;Ll/nqt0;Ll/pcw0;Ll/zqt0;Ll/w8w0;Ll/nnt0;)V

    .line 62
    .line 63
    .line 64
    return-object v1
.end method

.method public final b(Ll/glt0;)Ll/kot0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kot0;->a:Ll/glt0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ll/nqt0;)Ll/kot0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kot0;->b:Ll/nqt0;

    .line 2
    .line 3
    return-object p0
.end method
