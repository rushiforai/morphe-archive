.class public final Ll/qri$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ey2$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qri;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/xri;

.field public final b:I

.field public final c:Ll/tri$a;


# direct methods
.method public constructor <init>(Ll/xri;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qri$b;->a:Ll/xri;

    .line 5
    .line 6
    iput p2, p0, Ll/qri$b;->b:I

    .line 7
    .line 8
    new-instance p1, Ll/tri$a;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/tri$a;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/qri$b;->c:Ll/tri$a;

    .line 14
    .line 15
    return-void
.end method

.method public synthetic constructor <init>(Ll/xri;ILl/qri$a;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2}, Ll/qri$b;-><init>(Ll/xri;I)V

    return-void
.end method


# virtual methods
.method public a(Ll/asf;J)Ll/ey2$e;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0, p1}, Ll/qri$b;->c(Ll/asf;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-interface {p1}, Ll/asf;->k()J

    .line 10
    .line 11
    .line 12
    move-result-wide v4

    .line 13
    iget-object v6, p0, Ll/qri$b;->a:Ll/xri;

    .line 14
    .line 15
    iget v6, v6, Ll/xri;->c:I

    .line 16
    .line 17
    const/4 v7, 0x6

    .line 18
    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    .line 19
    .line 20
    .line 21
    move-result v6

    .line 22
    invoke-interface {p1, v6}, Ll/asf;->m(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/qri$b;->c(Ll/asf;)J

    .line 26
    .line 27
    .line 28
    move-result-wide v6

    .line 29
    invoke-interface {p1}, Ll/asf;->k()J

    .line 30
    .line 31
    .line 32
    move-result-wide p0

    .line 33
    cmp-long v8, v2, p2

    .line 34
    .line 35
    if-gtz v8, :cond_0

    .line 36
    .line 37
    cmp-long v8, v6, p2

    .line 38
    .line 39
    if-lez v8, :cond_0

    .line 40
    .line 41
    invoke-static {v4, v5}, Ll/ey2$e;->e(J)Ll/ey2$e;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_0
    cmp-long p2, v6, p2

    .line 47
    .line 48
    if-gtz p2, :cond_1

    .line 49
    .line 50
    invoke-static {v6, v7, p0, p1}, Ll/ey2$e;->f(JJ)Ll/ey2$e;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_1
    invoke-static {v2, v3, v0, v1}, Ll/ey2$e;->d(JJ)Ll/ey2$e;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public final c(Ll/asf;)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    invoke-interface {p1}, Ll/asf;->k()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-interface {p1}, Ll/asf;->getLength()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const-wide/16 v4, 0x6

    .line 10
    .line 11
    sub-long/2addr v2, v4

    .line 12
    cmp-long v0, v0, v2

    .line 13
    .line 14
    if-gez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/qri$b;->a:Ll/xri;

    .line 17
    .line 18
    iget v1, p0, Ll/qri$b;->b:I

    .line 19
    .line 20
    iget-object v2, p0, Ll/qri$b;->c:Ll/tri$a;

    .line 21
    .line 22
    invoke-static {p1, v0, v1, v2}, Ll/tri;->h(Ll/asf;Ll/xri;ILl/tri$a;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-interface {p1, v0}, Ll/asf;->m(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-interface {p1}, Ll/asf;->k()J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    invoke-interface {p1}, Ll/asf;->getLength()J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    sub-long/2addr v2, v4

    .line 42
    cmp-long v0, v0, v2

    .line 43
    .line 44
    if-ltz v0, :cond_1

    .line 45
    .line 46
    invoke-interface {p1}, Ll/asf;->getLength()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    invoke-interface {p1}, Ll/asf;->k()J

    .line 51
    .line 52
    .line 53
    move-result-wide v2

    .line 54
    sub-long/2addr v0, v2

    .line 55
    long-to-int v0, v0

    .line 56
    invoke-interface {p1, v0}, Ll/asf;->m(I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/qri$b;->a:Ll/xri;

    .line 60
    .line 61
    iget-wide p0, p0, Ll/xri;->j:J

    .line 62
    .line 63
    return-wide p0

    .line 64
    :cond_1
    iget-object p0, p0, Ll/qri$b;->c:Ll/tri$a;

    .line 65
    .line 66
    iget-wide p0, p0, Ll/tri$a;->a:J

    .line 67
    .line 68
    return-wide p0
.end method
