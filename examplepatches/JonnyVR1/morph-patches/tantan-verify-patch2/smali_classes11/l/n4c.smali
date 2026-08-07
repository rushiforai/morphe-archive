.class public final Ll/n4c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l4c;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/r45;

.field public final b:J


# direct methods
.method public constructor <init>(Ll/r45;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n4c;->a:Ll/r45;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/n4c;->b:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c(J)J
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n4c;->a:Ll/r45;

    .line 2
    .line 3
    iget-object v0, v0, Ll/r45;->e:[J

    .line 4
    .line 5
    long-to-int p1, p1

    .line 6
    aget-wide p1, v0, p1

    .line 7
    .line 8
    iget-wide v0, p0, Ll/n4c;->b:J

    .line 9
    .line 10
    sub-long/2addr p1, v0

    .line 11
    return-wide p1
.end method

.method public d(JJ)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n4c;->a:Ll/r45;

    .line 2
    .line 3
    iget-object p0, p0, Ll/r45;->d:[J

    .line 4
    .line 5
    long-to-int p1, p1

    .line 6
    aget-wide p1, p0, p1

    .line 7
    .line 8
    return-wide p1
.end method

.method public e(JJ)J
    .locals 0

    .line 1
    const-wide/16 p0, 0x0

    .line 2
    .line 3
    return-wide p0
.end method

.method public f(JJ)J
    .locals 0

    .line 1
    const-wide p0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    return-wide p0
.end method

.method public g(JJ)J
    .locals 2

    .line 1
    iget-object p3, p0, Ll/n4c;->a:Ll/r45;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/n4c;->b:J

    .line 4
    .line 5
    add-long/2addr p1, v0

    .line 6
    invoke-virtual {p3, p1, p2}, Ll/r45;->a(J)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-long p0, p0

    .line 11
    return-wide p0
.end method

.method public h(J)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n4c;->a:Ll/r45;

    .line 2
    .line 3
    iget p0, p0, Ll/r45;->a:I

    .line 4
    .line 5
    int-to-long p0, p0

    .line 6
    return-wide p0
.end method

.method public i()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public j(J)Ll/mkc0;
    .locals 6

    .line 1
    new-instance v0, Ll/mkc0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n4c;->a:Ll/r45;

    .line 4
    .line 5
    iget-object v1, p0, Ll/r45;->c:[J

    .line 6
    .line 7
    long-to-int p1, p1

    .line 8
    aget-wide v2, v1, p1

    .line 9
    .line 10
    iget-object p0, p0, Ll/r45;->b:[I

    .line 11
    .line 12
    aget p0, p0, p1

    .line 13
    .line 14
    int-to-long v4, p0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct/range {v0 .. v5}, Ll/mkc0;-><init>(Ljava/lang/String;JJ)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public l(JJ)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n4c;->a:Ll/r45;

    .line 2
    .line 3
    iget p0, p0, Ll/r45;->a:I

    .line 4
    .line 5
    int-to-long p0, p0

    .line 6
    return-wide p0
.end method
