.class public final Ll/mey0;
.super Ll/yyy0;
.source "SourceFile"


# instance fields
.field public final g:Ll/wyt0;


# direct methods
.method public constructor <init>(Ll/pey0;Ll/d0u0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ll/yyy0;-><init>(Ll/d0u0;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/wyt0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/wyt0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/mey0;->g:Ll/wyt0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final d(ILl/hwt0;Z)Ll/hwt0;
    .locals 11

    .line 1
    iget-object v0, p0, Ll/yyy0;->f:Ll/d0u0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Ll/d0u0;->d(ILl/hwt0;Z)Ll/hwt0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget p1, v1, Ll/hwt0;->c:I

    .line 8
    .line 9
    iget-object p3, p0, Ll/mey0;->g:Ll/wyt0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/yyy0;->f:Ll/d0u0;

    .line 12
    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    invoke-virtual {p0, p1, p3, v2, v3}, Ll/d0u0;->e(ILl/wyt0;J)Ll/wyt0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/wyt0;->b()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object v2, p2, Ll/hwt0;->a:Ljava/lang/Object;

    .line 26
    .line 27
    iget-object v3, p2, Ll/hwt0;->b:Ljava/lang/Object;

    .line 28
    .line 29
    iget v4, p2, Ll/hwt0;->c:I

    .line 30
    .line 31
    iget-wide v5, p2, Ll/hwt0;->d:J

    .line 32
    .line 33
    sget-object v9, Ll/e4u0;->e:Ll/e4u0;

    .line 34
    .line 35
    const/4 v10, 0x1

    .line 36
    const-wide/16 v7, 0x0

    .line 37
    .line 38
    invoke-virtual/range {v1 .. v10}, Ll/hwt0;->l(Ljava/lang/Object;Ljava/lang/Object;IJJLl/e4u0;Z)Ll/hwt0;

    .line 39
    .line 40
    .line 41
    return-object v1

    .line 42
    :cond_0
    const/4 p0, 0x1

    .line 43
    iput-boolean p0, v1, Ll/hwt0;->f:Z

    .line 44
    .line 45
    return-object v1
.end method
