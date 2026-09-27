.class public final Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;
.super Lapp/morphe/patcher/Fingerprint;
.source "Fingerprints.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;",
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
.field public static final INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;-><init>()V

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/TimedTextUrlFingerprint;

    return-void
.end method

.method private constructor <init>()V
    .registers 15

    const/4 v0, 0x2

    .line 39
    new-array v1, v0, [Lcom/android/tools/smali/dexlib2/AccessFlags;

    sget-object v2, Lcom/android/tools/smali/dexlib2/AccessFlags;->PUBLIC:Lcom/android/tools/smali/dexlib2/AccessFlags;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lcom/android/tools/smali/dexlib2/AccessFlags;->FINAL:Lcom/android/tools/smali/dexlib2/AccessFlags;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    .line 41
    const-string v1, "L"

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    .line 43
    new-array v0, v0, [Lapp/morphe/patcher/MethodCallFilter;

    .line 44
    sget-object v1, Lcom/android/tools/smali/dexlib2/Opcode;->INVOKE_VIRTUAL:Lcom/android/tools/smali/dexlib2/Opcode;

    .line 43
    const-string v2, "Lorg/chromium/net/CronetEngine;->newUrlRequestBuilder(Ljava/lang/String;Lorg/chromium/net/UrlRequest$Callback;Ljava/util/concurrent/Executor;)Lorg/chromium/net/UrlRequest$Builder;"

    const/4 v5, 0x0

    const/4 v7, 0x4

    invoke-static {v2, v1, v5, v7, v5}, Lapp/morphe/patcher/InstructionFilterKt;->methodCall$default(Ljava/lang/String;Lcom/android/tools/smali/dexlib2/Opcode;Lapp/morphe/patcher/InstructionLocation;ILjava/lang/Object;)Lapp/morphe/patcher/MethodCallFilter;

    move-result-object v1

    aput-object v1, v0, v3

    .line 48
    sget-object v1, Lcom/android/tools/smali/dexlib2/Opcode;->INVOKE_STATIC:Lcom/android/tools/smali/dexlib2/Opcode;

    .line 49
    const-string v2, "Lorg/chromium/net/UploadDataProviders;->create(Ljava/nio/ByteBuffer;)Lorg/chromium/net/UploadDataProvider;"

    .line 47
    invoke-static {v2, v1, v5, v7, v5}, Lapp/morphe/patcher/InstructionFilterKt;->methodCall$default(Ljava/lang/String;Lcom/android/tools/smali/dexlib2/Opcode;Lapp/morphe/patcher/InstructionLocation;ILjava/lang/Object;)Lapp/morphe/patcher/MethodCallFilter;

    move-result-object v1

    aput-object v1, v0, v4

    .line 42
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    const/16 v12, 0x30

    const/4 v13, 0x0

    .line 38
    const-string v7, "L"

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v5, p0

    invoke-direct/range {v5 .. v13}, Lapp/morphe/patcher/Fingerprint;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function2;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method
