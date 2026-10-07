.class final Le/e/a/Followup3$Job;
.super Ljava/lang/Object;
.source "Followup3.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Followup3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Job"
.end annotation


# instance fields
.field connection:Ljava/net/HttpURLConnection;

.field loader:Ljava/lang/Object;

.field start:J

.field swipe:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/Followup3$Job;->start:J

    iput-object p1, p0, Le/e/a/Followup3$Job;->loader:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/Followup3$Job;->swipe:Ljava/lang/Object;

    return-void
.end method
