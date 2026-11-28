.class public final Lnicoid/network238/kotlin/ranges/IntRange$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/ranges/IntRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/kotlin/ranges/IntRange$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getEMPTY()Lnicoid/network238/kotlin/ranges/IntRange;
    .registers 2

    .line 85
    # getter for: Lnicoid/network238/kotlin/ranges/IntRange;->EMPTY:Lnicoid/network238/kotlin/ranges/IntRange;
    invoke-static {}, Lnicoid/network238/kotlin/ranges/IntRange;->access$getEMPTY$cp()Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v0

    return-object v0
.end method
