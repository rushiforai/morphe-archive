.class public final Lapp/yydarlinker/patches/deepseekcaptions/PlayerTimeReferenceFingerprint;
.super Lapp/morphe/patcher/Fingerprint;
.source "Fingerprints.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lapp/yydarlinker/patches/deepseekcaptions/PlayerTimeReferenceFingerprint;",
        "Lapp/morphe/patcher/Fingerprint;",
        "<init>",
        "()V",
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
.field public static final INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/PlayerTimeReferenceFingerprint;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/PlayerTimeReferenceFingerprint;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/PlayerTimeReferenceFingerprint;-><init>()V

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/PlayerTimeReferenceFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/PlayerTimeReferenceFingerprint;

    return-void
.end method

.method private constructor <init>()V
    .registers 14

    .line 68
    sget-object v0, Lapp/morphe/patcher/OpcodesFilter;->Companion:Lapp/morphe/patcher/OpcodesFilter$Companion;

    const/4 v1, 0x2

    .line 69
    new-array v1, v1, [Lcom/android/tools/smali/dexlib2/Opcode;

    const/4 v2, 0x0

    sget-object v3, Lcom/android/tools/smali/dexlib2/Opcode;->INVOKE_DIRECT_RANGE:Lcom/android/tools/smali/dexlib2/Opcode;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    .line 70
    sget-object v3, Lcom/android/tools/smali/dexlib2/Opcode;->IGET_OBJECT:Lcom/android/tools/smali/dexlib2/Opcode;

    aput-object v3, v1, v2

    .line 68
    invoke-virtual {v0, v1}, Lapp/morphe/patcher/OpcodesFilter$Companion;->opcodesToFilters([Lcom/android/tools/smali/dexlib2/Opcode;)Ljava/util/List;

    move-result-object v8

    .line 72
    const-string v0, "Media progress reported outside media playback: "

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    const/16 v11, 0x27

    const/4 v12, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v10, 0x0

    move-object v4, p0

    .line 67
    invoke-direct/range {v4 .. v12}, Lapp/morphe/patcher/Fingerprint;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function2;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method
