.class public final Lnicoid/network238/kotlin/ranges/IntProgression$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/ranges/IntProgression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/kotlin/ranges/IntProgression$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final fromClosedRange(III)Lnicoid/network238/kotlin/ranges/IntProgression;
    .registers 5

    .line 133
    new-instance v0, Lnicoid/network238/kotlin/ranges/IntProgression;

    invoke-direct {v0, p1, p2, p3}, Lnicoid/network238/kotlin/ranges/IntProgression;-><init>(III)V

    return-object v0
.end method
