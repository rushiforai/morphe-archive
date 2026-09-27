.class public final Lapp/yydarlinker/patches/shared/Constants;
.super Ljava/lang/Object;
.source "Constants.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lapp/yydarlinker/patches/shared/Constants;",
        "",
        "<init>",
        "()V",
        "YOUTUBE",
        "Lapp/morphe/patcher/patch/Compatibility;",
        "getYOUTUBE",
        "()Lapp/morphe/patcher/patch/Compatibility;",
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
.field public static final INSTANCE:Lapp/yydarlinker/patches/shared/Constants;

.field private static final YOUTUBE:Lapp/morphe/patcher/patch/Compatibility;


# direct methods
.method static constructor <clinit>()V
    .registers 14

    new-instance v0, Lapp/yydarlinker/patches/shared/Constants;

    invoke-direct {v0}, Lapp/yydarlinker/patches/shared/Constants;-><init>()V

    sput-object v0, Lapp/yydarlinker/patches/shared/Constants;->INSTANCE:Lapp/yydarlinker/patches/shared/Constants;

    .line 11
    sget-object v5, Lapp/morphe/patcher/patch/ApkFileType;->APK_REQUIRED:Lapp/morphe/patcher/patch/ApkFileType;

    .line 14
    const-string v0, "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6"

    .line 15
    const-string v1, "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    .line 13
    invoke-static {v0}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    .line 18
    new-instance v8, Lapp/morphe/patcher/patch/AppTarget;

    const/16 v0, 0x1c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v12, 0x2

    const/4 v13, 0x0

    const-string v9, "21.07.247"

    const/4 v10, 0x0

    invoke-direct/range {v8 .. v13}, Lapp/morphe/patcher/patch/AppTarget;-><init>(Ljava/lang/String;ZLjava/lang/Integer;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 17
    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    .line 8
    new-instance v1, Lapp/morphe/patcher/patch/Compatibility;

    const v0, 0xff0033

    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v9, 0x4

    const/4 v10, 0x0

    .line 8
    const-string v2, "com.google.android.youtube"

    const-string v3, "YouTube"

    const/4 v4, 0x0

    invoke-direct/range {v1 .. v10}, Lapp/morphe/patcher/patch/Compatibility;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lapp/morphe/patcher/patch/ApkFileType;Ljava/lang/Integer;Ljava/util/Set;Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v1, Lapp/yydarlinker/patches/shared/Constants;->YOUTUBE:Lapp/morphe/patcher/patch/Compatibility;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getYOUTUBE()Lapp/morphe/patcher/patch/Compatibility;
    .registers 1

    .line 8
    sget-object p0, Lapp/yydarlinker/patches/shared/Constants;->YOUTUBE:Lapp/morphe/patcher/patch/Compatibility;

    return-object p0
.end method
