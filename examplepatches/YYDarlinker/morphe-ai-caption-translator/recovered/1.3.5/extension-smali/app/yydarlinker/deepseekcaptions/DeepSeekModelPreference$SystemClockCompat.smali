.class final Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$SystemClockCompat;
.super Ljava/lang/Object;
.source "DeepSeekModelPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SystemClockCompat"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 489
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static elapsedRealtime()J
    .registers 2

    .line 491
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method
