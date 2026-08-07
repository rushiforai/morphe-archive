.class public final Ll/lir0;
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
    iput-object v0, p0, Ll/lir0;->a:Ll/bgw0;

    .line 11
    .line 12
    new-instance v0, Ll/dgr0;

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    const-string v2, "image/heif"

    .line 16
    .line 17
    invoke-direct {v0, v1, v1, v2}, Ll/dgr0;-><init>(IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/lir0;->b:Ll/dgr0;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a(Ll/qer0;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/lir0;->a:Ll/bgw0;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Ll/bgw0;->h(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/lir0;->a:Ll/bgw0;

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
    iget-object p0, p0, Ll/lir0;->a:Ll/bgw0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/bgw0;->J()J

    .line 22
    .line 23
    .line 24
    move-result-wide p0

    .line 25
    int-to-long v0, p2

    .line 26
    cmp-long p0, p0, v0

    .line 27
    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    return v2
.end method

.method public final c(JJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lir0;->b:Ll/dgr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/dgr0;->c(JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Ll/fer0;

    .line 3
    .line 4
    const/4 v1, 0x4

    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Ll/fer0;->j(IZ)Z

    .line 7
    .line 8
    .line 9
    const v0, 0x66747970

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Ll/lir0;->a(Ll/qer0;I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const v0, 0x68656963

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1, v0}, Ll/lir0;->a(Ll/qer0;I)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    return v2
.end method

.method public final e(Ll/ser0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lir0;->b:Ll/dgr0;

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
    iget-object p0, p0, Ll/lir0;->b:Ll/dgr0;

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
