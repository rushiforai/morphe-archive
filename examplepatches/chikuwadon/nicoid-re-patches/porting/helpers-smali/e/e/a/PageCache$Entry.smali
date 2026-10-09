.class final Le/e/a/PageCache$Entry;
.super Ljava/lang/Object;
.source "PageCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PageCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Entry"
.end annotation


# instance fields
.field final at:J

.field final data:[B


# direct methods
.method constructor <init>([BJ)V
    .registers 4
    .param p1, "data"    # [B
    .param p2, "at"    # J

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PageCache$Entry;->data:[B

    iput-wide p2, p0, Le/e/a/PageCache$Entry;->at:J

    return-void
.end method
