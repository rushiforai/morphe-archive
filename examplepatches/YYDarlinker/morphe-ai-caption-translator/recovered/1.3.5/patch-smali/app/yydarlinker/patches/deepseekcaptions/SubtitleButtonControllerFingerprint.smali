.class public final Lapp/yydarlinker/patches/deepseekcaptions/SubtitleButtonControllerFingerprint;
.super Lapp/morphe/patcher/Fingerprint;
.source "Fingerprints.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lapp/yydarlinker/patches/deepseekcaptions/SubtitleButtonControllerFingerprint;",
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
.field public static final INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/SubtitleButtonControllerFingerprint;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/SubtitleButtonControllerFingerprint;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/SubtitleButtonControllerFingerprint;-><init>()V

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/SubtitleButtonControllerFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/SubtitleButtonControllerFingerprint;

    return-void
.end method

.method private constructor <init>()V
    .registers 17

    const/4 v0, 0x2

    .line 106
    new-array v1, v0, [Lcom/android/tools/smali/dexlib2/AccessFlags;

    sget-object v2, Lcom/android/tools/smali/dexlib2/AccessFlags;->PUBLIC:Lcom/android/tools/smali/dexlib2/AccessFlags;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lcom/android/tools/smali/dexlib2/AccessFlags;->FINAL:Lcom/android/tools/smali/dexlib2/AccessFlags;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    .line 108
    const-string v1, "L"

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v1, 0x3

    .line 110
    new-array v1, v1, [Lapp/morphe/patcher/OpcodesFilter;

    .line 111
    sget-object v12, Lcom/android/tools/smali/dexlib2/Opcode;->IGET_OBJECT:Lcom/android/tools/smali/dexlib2/Opcode;

    const/16 v14, 0x13

    const/4 v15, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    .line 110
    const-string v11, "Lcom/google/android/libraries/youtube/common/ui/TouchImageView;"

    const/4 v13, 0x0

    invoke-static/range {v9 .. v15}, Lapp/morphe/patcher/InstructionFilterKt;->fieldAccess$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/tools/smali/dexlib2/Opcode;Lapp/morphe/patcher/InstructionLocation;ILjava/lang/Object;)Lapp/morphe/patcher/FieldAccessFilter;

    move-result-object v2

    aput-object v2, v1, v3

    .line 115
    sget-object v2, Lapp/yydarlinker/patches/shared/CaptionResourceType;->STRING:Lapp/yydarlinker/patches/shared/CaptionResourceType;

    .line 114
    const-string v3, "accessibility_captions_unavailable"

    const/4 v5, 0x0

    const/4 v7, 0x4

    invoke-static {v2, v3, v5, v7, v5}, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceLiteral$default(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;Lapp/morphe/patcher/InstructionLocation;ILjava/lang/Object;)Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;

    move-result-object v2

    aput-object v2, v1, v4

    .line 119
    sget-object v2, Lapp/yydarlinker/patches/shared/CaptionResourceType;->STRING:Lapp/yydarlinker/patches/shared/CaptionResourceType;

    .line 120
    const-string v3, "accessibility_captions_button_name"

    .line 118
    invoke-static {v2, v3, v5, v7, v5}, Lapp/yydarlinker/patches/shared/CaptionResourceMappingKt;->captionResourceLiteral$default(Lapp/yydarlinker/patches/shared/CaptionResourceType;Ljava/lang/String;Lapp/morphe/patcher/InstructionLocation;ILjava/lang/Object;)Lapp/yydarlinker/patches/shared/CaptionResourceLiteralFilter;

    move-result-object v2

    aput-object v2, v1, v0

    .line 109
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    const/16 v12, 0x30

    .line 105
    const-string v7, "V"

    const/4 v11, 0x0

    move-object/from16 v5, p0

    invoke-direct/range {v5 .. v13}, Lapp/morphe/patcher/Fingerprint;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function2;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method
