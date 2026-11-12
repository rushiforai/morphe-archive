.class public final Lddp;
.super Lexg;
.source "SourceFile"


# instance fields
.field public final b:J


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lddp;->b:J

    return-void
.end method
