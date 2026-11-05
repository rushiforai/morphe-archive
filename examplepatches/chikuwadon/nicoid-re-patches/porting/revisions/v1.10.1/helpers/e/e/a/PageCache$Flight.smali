.class final Le/e/a/PageCache$Flight;
.super Ljava/lang/Object;
.source "PageCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PageCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Flight"
.end annotation


# instance fields
.field data:[B

.field done:Z

.field final epoch:J

.field error:Ljava/io/IOException;


# direct methods
.method constructor <init>(J)V
    .registers 3
    .param p1, "epoch"    # J

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Le/e/a/PageCache$Flight;->epoch:J

    return-void
.end method
