.class public final Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;
.super Ljava/lang/Object;
.source "CaptionFeaturePatches.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u000b\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u001a\u0010\n\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u0007\"\u0004\u0008\u000c\u0010\tR\u001a\u0010\r\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u0007\"\u0004\u0008\u000f\u0010\t\u00a8\u0006\u0010"
    }
    d2 = {
        "Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;",
        "",
        "<init>",
        "()V",
        "ai",
        "",
        "getAi",
        "()Z",
        "setAi",
        "(Z)V",
        "simplified",
        "getSimplified",
        "setSimplified",
        "memory",
        "getMemory",
        "setMemory",
        "app.yydarlinker:patches"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

.field private static ai:Z

.field private static memory:Z

.field private static simplified:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;-><init>()V

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getAi()Z
    .registers 1

    .line 8
    sget-boolean p0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->ai:Z

    return p0
.end method

.method public final getMemory()Z
    .registers 1

    .line 8
    sget-boolean p0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->memory:Z

    return p0
.end method

.method public final getSimplified()Z
    .registers 1

    .line 8
    sget-boolean p0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->simplified:Z

    return p0
.end method

.method public final setAi(Z)V
    .registers 2

    .line 8
    sput-boolean p1, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->ai:Z

    return-void
.end method

.method public final setMemory(Z)V
    .registers 2

    .line 8
    sput-boolean p1, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->memory:Z

    return-void
.end method

.method public final setSimplified(Z)V
    .registers 2

    .line 8
    sput-boolean p1, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeatures;->simplified:Z

    return-void
.end method
