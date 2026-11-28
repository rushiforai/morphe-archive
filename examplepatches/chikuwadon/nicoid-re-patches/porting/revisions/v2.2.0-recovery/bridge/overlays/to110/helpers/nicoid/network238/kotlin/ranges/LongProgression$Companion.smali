.class public final Lnicoid/network238/kotlin/ranges/LongProgression$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/ranges/LongProgression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/kotlin/ranges/LongProgression$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final fromClosedRange(JJJ)Lnicoid/network238/kotlin/ranges/LongProgression;
    .registers 14

    .line 195
    new-instance v0, Lnicoid/network238/kotlin/ranges/LongProgression;

    move-wide v1, p1

    move-wide v3, p3

    move-wide v5, p5

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/kotlin/ranges/LongProgression;-><init>(JJJ)V

    return-object v0
.end method
