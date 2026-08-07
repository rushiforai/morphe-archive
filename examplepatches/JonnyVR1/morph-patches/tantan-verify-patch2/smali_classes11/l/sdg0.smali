.class public abstract Ll/sdg0;
.super Ll/lid;
.source "SourceFile"

# interfaces
.implements Ll/mdg0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public d:Ll/mdg0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lid;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(I)J
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sdg0;->d:Ll/mdg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/mdg0;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ll/mdg0;->a(I)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide p0, p0, Ll/sdg0;->e:J

    .line 14
    .line 15
    add-long/2addr v0, p0

    .line 16
    return-wide v0
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sdg0;->d:Ll/mdg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/mdg0;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/mdg0;->b()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public f(J)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sdg0;->d:Ll/mdg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/mdg0;

    .line 8
    .line 9
    iget-wide v1, p0, Ll/sdg0;->e:J

    .line 10
    .line 11
    sub-long/2addr p1, v1

    .line 12
    invoke-interface {v0, p1, p2}, Ll/mdg0;->f(J)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public g(J)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Ll/myb;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sdg0;->d:Ll/mdg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/mdg0;

    .line 8
    .line 9
    iget-wide v1, p0, Ll/sdg0;->e:J

    .line 10
    .line 11
    sub-long/2addr p1, v1

    .line 12
    invoke-interface {v0, p1, p2}, Ll/mdg0;->g(J)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public i()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ah3;->i()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/sdg0;->d:Ll/mdg0;

    .line 6
    .line 7
    return-void
.end method

.method public v(JLl/mdg0;J)V
    .locals 2

    .line 1
    iput-wide p1, p0, Ll/lid;->b:J

    .line 2
    .line 3
    iput-object p3, p0, Ll/sdg0;->d:Ll/mdg0;

    .line 4
    .line 5
    const-wide v0, 0x7fffffffffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long p3, p4, v0

    .line 11
    .line 12
    if-nez p3, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-wide p1, p4

    .line 16
    :goto_0
    iput-wide p1, p0, Ll/sdg0;->e:J

    .line 17
    .line 18
    return-void
.end method
