.class final Le/e/a/SeriesMetadata215$Entry;
.super Ljava/lang/Object;
.source "SeriesMetadata215.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SeriesMetadata215;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field final at:J

.field final data:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lorg/json/JSONObject;)V
    .registers 4

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/SeriesMetadata215$Entry;->at:J

    iput-object p1, p0, Le/e/a/SeriesMetadata215$Entry;->data:Lorg/json/JSONObject;

    return-void
.end method
