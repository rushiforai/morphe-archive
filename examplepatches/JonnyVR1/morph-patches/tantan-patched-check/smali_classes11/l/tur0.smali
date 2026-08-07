.class public final Ll/tur0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# instance fields
.field public final a:Ll/bgw0;

.field public final b:Ll/dgr0;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/tur0;->a:Ll/bgw0;

    .line 11
    .line 12
    new-instance v0, Ll/dgr0;

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    const-string v2, "image/webp"

    .line 16
    .line 17
    invoke-direct {v0, v1, v1, v2}, Ll/dgr0;-><init>(IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/tur0;->b:Ll/dgr0;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final c(JJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tur0;->b:Ll/dgr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/dgr0;->c(JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tur0;->a:Ll/bgw0;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Ll/bgw0;->h(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/tur0;->a:Ll/bgw0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast p1, Ll/fer0;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p1, v0, v2, v1, v2}, Ll/fer0;->c([BIIZ)Z

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/tur0;->a:Ll/bgw0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/bgw0;->J()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    const-wide/32 v5, 0x52494646

    .line 26
    .line 27
    .line 28
    cmp-long v0, v3, v5

    .line 29
    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1, v1, v2}, Ll/fer0;->j(IZ)Z

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/tur0;->a:Ll/bgw0;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/bgw0;->h(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/tur0;->a:Ll/bgw0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1, v0, v2, v1, v2}, Ll/fer0;->c([BIIZ)Z

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/tur0;->a:Ll/bgw0;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/bgw0;->J()J

    .line 52
    .line 53
    .line 54
    move-result-wide p0

    .line 55
    const-wide/32 v0, 0x57454250

    .line 56
    .line 57
    .line 58
    cmp-long p0, p0, v0

    .line 59
    .line 60
    if-nez p0, :cond_0

    .line 61
    .line 62
    const/4 p0, 0x1

    .line 63
    return p0

    .line 64
    :cond_0
    return v2
.end method

.method public final e(Ll/ser0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tur0;->b:Ll/dgr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgr0;->e(Ll/ser0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tur0;->b:Ll/dgr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dgr0;->f(Ll/qer0;Ll/yfr0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
