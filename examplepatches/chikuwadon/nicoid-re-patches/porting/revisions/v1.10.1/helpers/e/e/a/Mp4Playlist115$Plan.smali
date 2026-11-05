.class final Le/e/a/Mp4Playlist115$Plan;
.super Ljava/lang/Object;
.source "Mp4Playlist115.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Mp4Playlist115;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Plan"
.end annotation


# instance fields
.field bytes:J

.field final segments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Le/e/a/Mp4Playlist115$Segment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 3

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/Mp4Playlist115$Plan;->segments:Ljava/util/List;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Le/e/a/Mp4Playlist115$Plan;->bytes:J

    return-void
.end method
