.class public final Lapp/yydarlinker/patches/deepseekcaptions/PlayerTypeEnumFingerprint;
.super Lapp/morphe/patcher/Fingerprint;
.source "Fingerprints.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lapp/yydarlinker/patches/deepseekcaptions/PlayerTypeEnumFingerprint;",
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
.field public static final INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/PlayerTypeEnumFingerprint;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/PlayerTypeEnumFingerprint;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/PlayerTypeEnumFingerprint;-><init>()V

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/PlayerTypeEnumFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/PlayerTypeEnumFingerprint;

    return-void
.end method

.method private constructor <init>()V
    .registers 17

    const/4 v0, 0x2

    .line 21
    new-array v0, v0, [Lcom/android/tools/smali/dexlib2/AccessFlags;

    const/4 v1, 0x0

    sget-object v2, Lcom/android/tools/smali/dexlib2/AccessFlags;->STATIC:Lcom/android/tools/smali/dexlib2/AccessFlags;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/android/tools/smali/dexlib2/AccessFlags;->CONSTRUCTOR:Lcom/android/tools/smali/dexlib2/AccessFlags;

    aput-object v2, v0, v1

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 32
    const-string v14, "INLINE_MINIMAL"

    .line 33
    const-string v15, "VIRTUAL_REALITY_FULLSCREEN"

    const-string v5, "WATCH_WHILE_PICTURE_IN_PICTURE"

    const-string v6, "NONE"

    const-string v7, "HIDDEN"

    const-string v8, "WATCH_WHILE_MINIMIZED"

    const-string v9, "WATCH_WHILE_MAXIMIZED"

    const-string v10, "WATCH_WHILE_FULLSCREEN"

    const-string v11, "WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN"

    const-string v12, "WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED"

    const-string v13, "WATCH_WHILE_SLIDING_MINIMIZED_DISMISSED"

    filled-new-array/range {v5 .. v15}, [Ljava/lang/String;

    move-result-object v0

    .line 22
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/16 v10, 0x2e

    const/4 v11, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    move-object/from16 v3, p0

    .line 20
    invoke-direct/range {v3 .. v11}, Lapp/morphe/patcher/Fingerprint;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function2;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method
