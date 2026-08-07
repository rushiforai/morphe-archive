.class public abstract Ll/hqf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/yol;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# instance fields
.field protected a:Ll/yol;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected b:J

.field protected c:Landroid/animation/TimeInterpolator;

.field protected d:J

.field protected e:J

.field protected f:Z


# direct methods
.method public constructor <init>(Ll/yol;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/hqf;->b:J

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    iput-wide v0, p0, Ll/hqf;->e:J

    .line 11
    .line 12
    iput-object p1, p0, Ll/hqf;->a:Ll/yol;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(J)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/hqf;->f:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-wide v2, p0, Ll/hqf;->e:J

    .line 8
    .line 9
    const-wide/16 v4, -0x1

    .line 10
    .line 11
    cmp-long v0, v2, v4

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iput-wide p1, p0, Ll/hqf;->e:J

    .line 16
    .line 17
    :cond_1
    iget-wide v2, p0, Ll/hqf;->e:J

    .line 18
    .line 19
    sub-long/2addr p1, v2

    .line 20
    iget-wide v2, p0, Ll/hqf;->d:J

    .line 21
    .line 22
    sub-long/2addr p1, v2

    .line 23
    const-wide/16 v2, 0x0

    .line 24
    .line 25
    cmp-long v0, p1, v2

    .line 26
    .line 27
    if-gtz v0, :cond_2

    .line 28
    .line 29
    return v1

    .line 30
    :cond_2
    iget-wide v0, p0, Ll/hqf;->b:J

    .line 31
    .line 32
    cmp-long v2, v0, v2

    .line 33
    .line 34
    const/high16 v3, 0x3f800000    # 1.0f

    .line 35
    .line 36
    if-lez v2, :cond_3

    .line 37
    .line 38
    long-to-float p1, p1

    .line 39
    long-to-float p2, v0

    .line 40
    div-float/2addr p1, p2

    .line 41
    goto :goto_0

    .line 42
    :cond_3
    move p1, v3

    .line 43
    :goto_0
    invoke-virtual {p0, p1}, Ll/hqf;->b(F)F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iget-object p2, p0, Ll/hqf;->c:Landroid/animation/TimeInterpolator;

    .line 48
    .line 49
    if-eqz p2, :cond_4

    .line 50
    .line 51
    invoke-interface {p2, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    :cond_4
    invoke-virtual {p0, p1}, Ll/hqf;->d(F)V

    .line 56
    .line 57
    .line 58
    cmpl-float p1, p1, v3

    .line 59
    .line 60
    if-ltz p1, :cond_5

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/hqf;->k()V

    .line 63
    .line 64
    .line 65
    :cond_5
    const/4 p0, 0x1

    .line 66
    return p0
.end method

.method public b(F)F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public c()Ll/hqf;
    .locals 0

    .line 1
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/hqf;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :catch_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/hqf;->c()Ll/hqf;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract d(F)V
.end method

.method public e(J)Ll/hqf;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/hqf;->b:J

    .line 2
    .line 3
    return-object p0
.end method

.method public f(J)Ll/hqf;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/hqf;->d:J

    .line 2
    .line 3
    return-object p0
.end method

.method public j()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/hqf;->f:Z

    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/hqf;->e:J

    .line 7
    .line 8
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hqf;->f:Z

    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/hqf;->e:J

    .line 7
    .line 8
    return-void
.end method
