.class final Le/e/a/HistorySupport$Record;
.super Ljava/lang/Object;
.source "HistorySupport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/HistorySupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Record"
.end annotation


# instance fields
.field counts:[J

.field posted:J

.field postedText:Ljava/lang/String;

.field views:J

.field watched:J


# direct methods
.method constructor <init>()V
    .registers 2

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Le/e/a/HistorySupport$Record;->postedText:Ljava/lang/String;

    return-void
.end method
