.class public Ll/dvq0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:J

.field private b:J

.field private c:J

.field private d:J

.field private final e:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Ll/dvq0;->e:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/xiaomi/push/service/ag;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/dvq0;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/dvq0;->c:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Ll/dvq0;->c:J

    .line 7
    .line 8
    return-void
.end method

.method public d(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/dvq0;->a:J

    .line 2
    .line 3
    return-void
.end method

.method public e()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/dvq0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public f(J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/dvq0;->b:J

    .line 2
    .line 3
    add-long/2addr v0, p1

    .line 4
    iput-wide v0, p0, Ll/dvq0;->b:J

    .line 5
    .line 6
    return-void
.end method

.method public g()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/dvq0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public h(J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/dvq0;->d:J

    .line 2
    .line 3
    add-long/2addr v0, p1

    .line 4
    iput-wide v0, p0, Ll/dvq0;->d:J

    .line 5
    .line 6
    return-void
.end method

.method public i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/dvq0;->d:J

    .line 2
    .line 3
    return-wide v0
.end method
