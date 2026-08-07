.class public interface abstract Ll/l610;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public now()J
    .locals 4
    .annotation build Ll/w6e;
    .end annotation

    .line 1
    invoke-interface {p0}, Ll/l610;->nowNanos()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/32 v2, 0xf4240

    .line 6
    .line 7
    .line 8
    div-long/2addr v0, v2

    .line 9
    return-wide v0
.end method

.method public abstract nowNanos()J
    .annotation build Ll/w6e;
    .end annotation
.end method
