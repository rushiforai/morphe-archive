.class public final Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;
.super Lapp/morphe/patcher/Fingerprint;
.source "Fingerprints.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;",
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
.field public static final INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;-><init>()V

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdFingerprint;

    return-void
.end method

.method private constructor <init>()V
    .registers 16

    .line 85
    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdParentFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/CurrentVideoIdParentFingerprint;

    move-object v2, v0

    check-cast v2, Lapp/morphe/patcher/Fingerprint;

    const/4 v0, 0x2

    .line 86
    new-array v1, v0, [Lcom/android/tools/smali/dexlib2/AccessFlags;

    sget-object v3, Lcom/android/tools/smali/dexlib2/AccessFlags;->PUBLIC:Lcom/android/tools/smali/dexlib2/AccessFlags;

    const/4 v4, 0x0

    aput-object v3, v1, v4

    sget-object v3, Lcom/android/tools/smali/dexlib2/AccessFlags;->FINAL:Lcom/android/tools/smali/dexlib2/AccessFlags;

    const/4 v5, 0x1

    aput-object v3, v1, v5

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 88
    const-string v3, "L"

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const/4 v3, 0x4

    .line 90
    new-array v3, v3, [Lapp/morphe/patcher/InstructionFilter;

    sget-object v11, Lcom/android/tools/smali/dexlib2/Opcode;->INVOKE_INTERFACE:Lcom/android/tools/smali/dexlib2/Opcode;

    const/16 v13, 0x27

    const/4 v14, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v10, "Ljava/lang/String;"

    const/4 v12, 0x0

    invoke-static/range {v7 .. v14}, Lapp/morphe/patcher/InstructionFilterKt;->methodCall$default(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/android/tools/smali/dexlib2/Opcode;Lapp/morphe/patcher/InstructionLocation;ILjava/lang/Object;)Lapp/morphe/patcher/MethodCallFilter;

    move-result-object v7

    aput-object v7, v3, v4

    .line 91
    sget-object v4, Lcom/android/tools/smali/dexlib2/Opcode;->MOVE_RESULT_OBJECT:Lcom/android/tools/smali/dexlib2/Opcode;

    new-instance v7, Lapp/morphe/patcher/InstructionLocation$MatchAfterImmediately;

    invoke-direct {v7}, Lapp/morphe/patcher/InstructionLocation$MatchAfterImmediately;-><init>()V

    check-cast v7, Lapp/morphe/patcher/InstructionLocation;

    invoke-static {v4, v7}, Lapp/morphe/patcher/InstructionFilterKt;->opcode(Lcom/android/tools/smali/dexlib2/Opcode;Lapp/morphe/patcher/InstructionLocation;)Lapp/morphe/patcher/OpcodeFilter;

    move-result-object v4

    aput-object v4, v3, v5

    .line 94
    new-instance v4, Lapp/morphe/patcher/InstructionLocation$MatchAfterWithin;

    const/4 v5, 0x6

    invoke-direct {v4, v5}, Lapp/morphe/patcher/InstructionLocation$MatchAfterWithin;-><init>(I)V

    check-cast v4, Lapp/morphe/patcher/InstructionLocation;

    .line 92
    const-string v5, "Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"

    const/4 v7, 0x0

    invoke-static {v5, v7, v4, v0, v7}, Lapp/morphe/patcher/InstructionFilterKt;->methodCall$default(Ljava/lang/String;Ljava/util/List;Lapp/morphe/patcher/InstructionLocation;ILjava/lang/Object;)Lapp/morphe/patcher/MethodCallFilter;

    move-result-object v4

    aput-object v4, v3, v0

    .line 96
    sget-object v0, Lcom/android/tools/smali/dexlib2/Opcode;->RETURN_VOID:Lcom/android/tools/smali/dexlib2/Opcode;

    new-instance v4, Lapp/morphe/patcher/InstructionLocation$MatchAfterImmediately;

    invoke-direct {v4}, Lapp/morphe/patcher/InstructionLocation$MatchAfterImmediately;-><init>()V

    check-cast v4, Lapp/morphe/patcher/InstructionLocation;

    invoke-static {v0, v4}, Lapp/morphe/patcher/InstructionFilterKt;->opcode(Lcom/android/tools/smali/dexlib2/Opcode;Lapp/morphe/patcher/InstructionLocation;)Lapp/morphe/patcher/OpcodeFilter;

    move-result-object v0

    const/4 v4, 0x3

    aput-object v0, v3, v4

    .line 89
    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    const/16 v10, 0xc2

    const/4 v11, 0x0

    const/4 v3, 0x0

    .line 84
    const-string v5, "V"

    move-object v4, v1

    move-object v1, p0

    invoke-direct/range {v1 .. v11}, Lapp/morphe/patcher/Fingerprint;-><init>(Lapp/morphe/patcher/Fingerprint;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function2;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method
