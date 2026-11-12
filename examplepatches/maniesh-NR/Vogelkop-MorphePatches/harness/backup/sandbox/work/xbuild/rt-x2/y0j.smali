.class public abstract Ly0j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:J

.field public final b:S


# direct methods
.method public constructor <init>(I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0x12c

    iput-short p1, p0, Ly0j;->b:S

    const-wide/16 v0, -0x12c

    iput-wide v0, p0, Ly0j;->a:J

    return-void
.end method


# virtual methods
.method public abstract a(Landroid/view/View;)V
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 8

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Ly0j;->a:J

    sub-long v2, v0, v2

    iget-short v4, p0, Ly0j;->b:S

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-gez v2, :cond_10

    return-void

    :cond_10
    iput-wide v0, p0, Ly0j;->a:J

    invoke-virtual {p0, p1}, Ly0j;->a(Landroid/view/View;)V

    return-void
.end method
