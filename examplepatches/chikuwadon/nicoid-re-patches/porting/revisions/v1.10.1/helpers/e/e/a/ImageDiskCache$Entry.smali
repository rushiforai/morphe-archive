.class final Le/e/a/ImageDiskCache$Entry;
.super Ljava/lang/Object;
.source "ImageDiskCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ImageDiskCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Entry"
.end annotation


# instance fields
.field final file:Ljava/io/File;

.field final size:J

.field final time:J


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .registers 4

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ImageDiskCache$Entry;->file:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/ImageDiskCache$Entry;->size:J

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/ImageDiskCache$Entry;->time:J

    return-void
.end method
