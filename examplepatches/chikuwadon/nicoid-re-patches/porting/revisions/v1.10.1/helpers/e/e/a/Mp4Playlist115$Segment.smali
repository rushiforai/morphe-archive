.class final Le/e/a/Mp4Playlist115$Segment;
.super Ljava/lang/Object;
.source "Mp4Playlist115.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Mp4Playlist115;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Segment"
.end annotation


# instance fields
.field init:Z

.field iv:[B

.field key:Ljava/net/URL;

.field length:J

.field offset:J

.field sequence:J

.field url:Ljava/net/URL;


# direct methods
.method constructor <init>()V
    .registers 3

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Le/e/a/Mp4Playlist115$Segment;->length:J

    return-void
.end method
