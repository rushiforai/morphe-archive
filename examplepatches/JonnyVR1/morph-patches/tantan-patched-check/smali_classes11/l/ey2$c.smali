.class public Ll/ey2$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ey2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public final a:J

.field public final b:J

.field public final c:J

.field public d:J

.field public e:J

.field public f:J

.field public g:J

.field public h:J


# direct methods
.method public constructor <init>(JJJJJJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/ey2$c;->a:J

    .line 5
    .line 6
    iput-wide p3, p0, Ll/ey2$c;->b:J

    .line 7
    .line 8
    iput-wide p5, p0, Ll/ey2$c;->d:J

    .line 9
    .line 10
    iput-wide p7, p0, Ll/ey2$c;->e:J

    .line 11
    .line 12
    iput-wide p9, p0, Ll/ey2$c;->f:J

    .line 13
    .line 14
    iput-wide p11, p0, Ll/ey2$c;->g:J

    .line 15
    .line 16
    iput-wide p13, p0, Ll/ey2$c;->c:J

    .line 17
    .line 18
    invoke-static/range {p3 .. p14}, Ll/ey2$c;->h(JJJJJJ)J

    .line 19
    .line 20
    .line 21
    move-result-wide p1

    .line 22
    iput-wide p1, p0, Ll/ey2$c;->h:J

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Ll/ey2$c;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ey2$c;->l()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic b(Ll/ey2$c;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ey2$c;->j()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic c(Ll/ey2$c;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ey2$c;->i()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic d(Ll/ey2$c;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ey2$c;->k()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic e(Ll/ey2$c;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ey2$c;->m()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic f(Ll/ey2$c;JJ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ey2$c;->o(JJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Ll/ey2$c;JJ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ey2$c;->p(JJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static h(JJJJJJ)J
    .locals 4

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    add-long v2, p6, v0

    .line 4
    .line 5
    cmp-long v2, v2, p8

    .line 6
    .line 7
    if-gez v2, :cond_1

    .line 8
    .line 9
    add-long v2, p2, v0

    .line 10
    .line 11
    cmp-long v2, v2, p4

    .line 12
    .line 13
    if-ltz v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sub-long/2addr p0, p2

    .line 17
    sub-long v2, p8, p6

    .line 18
    .line 19
    long-to-float v2, v2

    .line 20
    sub-long/2addr p4, p2

    .line 21
    long-to-float p2, p4

    .line 22
    div-float/2addr v2, p2

    .line 23
    long-to-float p0, p0

    .line 24
    mul-float/2addr p0, v2

    .line 25
    float-to-long p0, p0

    .line 26
    const-wide/16 p2, 0x14

    .line 27
    .line 28
    div-long p2, p0, p2

    .line 29
    .line 30
    add-long/2addr p0, p6

    .line 31
    sub-long/2addr p0, p10

    .line 32
    sub-long p4, p0, p2

    .line 33
    .line 34
    sub-long/2addr p8, v0

    .line 35
    invoke-static/range {p4 .. p9}, Ll/bmk0;->r(JJJ)J

    .line 36
    .line 37
    .line 38
    move-result-wide p0

    .line 39
    return-wide p0

    .line 40
    :cond_1
    :goto_0
    return-wide p6
.end method


# virtual methods
.method public final i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey2$c;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final j()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey2$c;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final k()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey2$c;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final l()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey2$c;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final m()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey2$c;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final n()V
    .locals 12

    .line 1
    iget-wide v0, p0, Ll/ey2$c;->b:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/ey2$c;->d:J

    .line 4
    .line 5
    iget-wide v4, p0, Ll/ey2$c;->e:J

    .line 6
    .line 7
    iget-wide v6, p0, Ll/ey2$c;->f:J

    .line 8
    .line 9
    iget-wide v8, p0, Ll/ey2$c;->g:J

    .line 10
    .line 11
    iget-wide v10, p0, Ll/ey2$c;->c:J

    .line 12
    .line 13
    invoke-static/range {v0 .. v11}, Ll/ey2$c;->h(JJJJJJ)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Ll/ey2$c;->h:J

    .line 18
    .line 19
    return-void
.end method

.method public final o(JJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ey2$c;->e:J

    .line 2
    .line 3
    iput-wide p3, p0, Ll/ey2$c;->g:J

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ey2$c;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final p(JJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ey2$c;->d:J

    .line 2
    .line 3
    iput-wide p3, p0, Ll/ey2$c;->f:J

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ey2$c;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
