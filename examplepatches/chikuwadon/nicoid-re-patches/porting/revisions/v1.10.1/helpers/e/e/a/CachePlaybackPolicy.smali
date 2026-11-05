.class final Le/e/a/CachePlaybackPolicy;
.super Ljava/lang/Object;
.source "CachePlaybackPolicy.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static acquire(Ljava/lang/String;)Z
    .registers 2

    .line 3
    const-string v0, "1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
