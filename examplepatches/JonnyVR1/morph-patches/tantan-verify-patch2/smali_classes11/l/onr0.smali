.class public final Ll/onr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/unr0;


# instance fields
.field public final a:Ll/ofr0;

.field public final b:Ll/nfr0;

.field public c:J

.field public d:J


# direct methods
.method public constructor <init>(Ll/ofr0;Ll/nfr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/onr0;->a:Ll/ofr0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/onr0;->b:Ll/nfr0;

    .line 7
    .line 8
    const-wide/16 p1, -0x1

    .line 9
    .line 10
    iput-wide p1, p0, Ll/onr0;->c:J

    .line 11
    .line 12
    iput-wide p1, p0, Ll/onr0;->d:J

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/onr0;->b:Ll/nfr0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/nfr0;->a:[J

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, p1, p2, v1, v1}, Ll/mpw0;->r([JJZZ)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    aget-wide p1, v0, p1

    .line 11
    .line 12
    iput-wide p1, p0, Ll/onr0;->d:J

    .line 13
    .line 14
    return-void
.end method

.method public final b(Ll/qer0;)J
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/onr0;->d:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p1, v0, v2

    .line 6
    .line 7
    const-wide/16 v2, -0x1

    .line 8
    .line 9
    if-ltz p1, :cond_0

    .line 10
    .line 11
    const-wide/16 v4, 0x2

    .line 12
    .line 13
    add-long/2addr v0, v4

    .line 14
    iput-wide v2, p0, Ll/onr0;->d:J

    .line 15
    .line 16
    neg-long p0, v0

    .line 17
    return-wide p0

    .line 18
    :cond_0
    return-wide v2
.end method

.method public final c(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/onr0;->c:J

    .line 2
    .line 3
    return-void
.end method

.method public final zze()Ll/bgr0;
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/onr0;->c:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/mfr0;

    .line 16
    .line 17
    iget-wide v1, p0, Ll/onr0;->c:J

    .line 18
    .line 19
    iget-object p0, p0, Ll/onr0;->a:Ll/ofr0;

    .line 20
    .line 21
    invoke-direct {v0, p0, v1, v2}, Ll/mfr0;-><init>(Ll/ofr0;J)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method
