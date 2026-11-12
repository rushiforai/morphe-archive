.class public final Lcom/opera/android/browser/FraudProtectionService;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lu59;


# direct methods
.method public constructor <init>(Lu59;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/FraudProtectionService;->a:Lu59;

    return-void
.end method


# virtual methods
.method public final getDaysSinceFirstLaunch()I
    .registers 5

    iget-object p0, p0, Lcom/opera/android/browser/FraudProtectionService;->a:Lu59;

    invoke-virtual {p0}, Lu59;->H()Lt59;

    move-result-object p0

    iget-wide v0, p0, Lt59;->b:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_10

    const/4 p0, -0x1

    return p0

    :cond_10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    const-wide/32 v0, 0x5265c00

    div-long/2addr v2, v0

    long-to-int p0, v2

    return p0
.end method
