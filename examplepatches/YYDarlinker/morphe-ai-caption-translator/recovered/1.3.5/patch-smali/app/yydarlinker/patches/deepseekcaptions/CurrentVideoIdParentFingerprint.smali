.class final Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdParentFingerprint;
.super Lapp/morphe/patcher/Fingerprint;
.source "Fingerprints.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c2\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdParentFingerprint;",
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
.field public static final INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdParentFingerprint;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdParentFingerprint;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdParentFingerprint;-><init>()V

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdParentFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdParentFingerprint;

    return-void
.end method

.method private constructor <init>()V
    .registers 14

    const/4 v0, 0x2

    .line 77
    new-array v0, v0, [Lcom/android/tools/smali/dexlib2/AccessFlags;

    const/4 v1, 0x0

    sget-object v2, Lcom/android/tools/smali/dexlib2/AccessFlags;->PUBLIC:Lcom/android/tools/smali/dexlib2/AccessFlags;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/android/tools/smali/dexlib2/AccessFlags;->FINAL:Lcom/android/tools/smali/dexlib2/AccessFlags;

    aput-object v2, v0, v1

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 79
    const-string v0, "L"

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const/4 v11, 0x6

    const/4 v12, 0x0

    const-wide/32 v7, 0x80000

    const/4 v9, 0x0

    const/4 v10, 0x0

    .line 80
    invoke-static/range {v7 .. v12}, Lapp/morphe/patcher/InstructionFilterKt;->literal$default(JLjava/util/List;Lapp/morphe/patcher/InstructionLocation;ILjava/lang/Object;)Lapp/morphe/patcher/LiteralFilter;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    const/16 v10, 0x30

    const/4 v11, 0x0

    .line 76
    const-string v5, "[L"

    const/4 v8, 0x0

    move-object v3, p0

    invoke-direct/range {v3 .. v11}, Lapp/morphe/patcher/Fingerprint;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function2;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method
