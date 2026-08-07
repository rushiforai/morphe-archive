.class public Ll/n500;
.super Ll/or2;
.source "SourceFile"


# instance fields
.field public c:J

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/or2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public e(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Ll/n500;->c:J

    .line 8
    .line 9
    iget-object p1, p0, Ll/n500;->e:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Ll/n500;->d:Ljava/lang/String;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public f(Ljava/lang/String;Ll/rz4$a;)Z
    .locals 6
    .param p2    # Ll/rz4$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/n500;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Ll/vwt;->o4()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    const-wide/16 v4, 0x3e8

    .line 16
    .line 17
    mul-long/2addr v2, v4

    .line 18
    iget-wide v4, p0, Ll/n500;->c:J

    .line 19
    .line 20
    sub-long/2addr v0, v4

    .line 21
    cmp-long p2, v0, v2

    .line 22
    .line 23
    if-gez p2, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/n500;->d:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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
