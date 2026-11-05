.class final Le/e/a/HistoryLimit120$Pending;
.super Ljava/lang/Object;
.source "HistoryLimit120.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/HistoryLimit120;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Pending"
.end annotation


# instance fields
.field final id:Ljava/lang/String;

.field final prior:Lorg/json/JSONArray;

.field final time:J


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/json/JSONArray;)V
    .registers 5

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/HistoryLimit120$Pending;->time:J

    .line 27
    iput-object p1, p0, Le/e/a/HistoryLimit120$Pending;->id:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Le/e/a/HistoryLimit120$Pending;->prior:Lorg/json/JSONArray;

    .line 29
    return-void
.end method
