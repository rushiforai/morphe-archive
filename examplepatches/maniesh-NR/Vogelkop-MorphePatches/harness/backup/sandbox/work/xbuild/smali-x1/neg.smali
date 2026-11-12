.class public final Lneg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:Z

.field public c:J


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lneg;->a:J

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    iget-boolean v0, p0, Lneg;->b:Z

    if-nez v0, :cond_13

    iget-wide v0, p0, Lneg;->c:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lneg;->a:J

    sub-long/2addr v2, v4

    add-long/2addr v2, v0

    iput-wide v2, p0, Lneg;->c:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lneg;->b:Z

    :cond_13
    return-void
.end method
