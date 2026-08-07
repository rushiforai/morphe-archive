.class public final Ll/ky3$c;
.super Ll/lj40;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ky3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public i:J


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ThreadFactory;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/lj40;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/ky3$c;->i:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public m()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ky3$c;->i:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public n(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ky3$c;->i:J

    .line 2
    .line 3
    return-void
.end method
