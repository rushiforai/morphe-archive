.class public final Lnicoid/network238/kotlin/time/Duration$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/time/Duration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/kotlin/time/Duration$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getINFINITE-UwyO8pc()J
    .registers 3

    .line 59
    # getter for: Lnicoid/network238/kotlin/time/Duration;->INFINITE:J
    invoke-static {}, Lnicoid/network238/kotlin/time/Duration;->access$getINFINITE$cp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final getNEG_INFINITE-UwyO8pc$kotlin_stdlib()J
    .registers 3

    .line 60
    # getter for: Lnicoid/network238/kotlin/time/Duration;->NEG_INFINITE:J
    invoke-static {}, Lnicoid/network238/kotlin/time/Duration;->access$getNEG_INFINITE$cp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final getZERO-UwyO8pc()J
    .registers 3

    .line 56
    # getter for: Lnicoid/network238/kotlin/time/Duration;->ZERO:J
    invoke-static {}, Lnicoid/network238/kotlin/time/Duration;->access$getZERO$cp()J

    move-result-wide v0

    return-wide v0
.end method
