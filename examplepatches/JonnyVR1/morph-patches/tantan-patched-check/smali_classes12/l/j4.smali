.class public abstract Ll/j4;
.super Ll/kt2;
.source "SourceFile"

# interfaces
.implements Ll/ham;


# instance fields
.field private D:J

.field private E:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/kt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/j4;->D:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/j4;->E:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public c(ILl/hfj;Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/kt2;->c(ILl/hfj;Z)V

    .line 2
    .line 3
    .line 4
    iget-wide p1, p0, Ll/j4;->D:J

    .line 5
    .line 6
    const-wide/16 v0, -0x1

    .line 7
    .line 8
    cmp-long p1, p1, v0

    .line 9
    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    iget-wide p1, p0, Ll/j4;->E:J

    .line 13
    .line 14
    cmp-long p1, p1, v0

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-wide p1, p0, Ll/j4;->E:J

    .line 22
    .line 23
    cmp-long p1, p1, v0

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide p1

    .line 31
    iput-wide p1, p0, Ll/j4;->E:J

    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    return-void
.end method
