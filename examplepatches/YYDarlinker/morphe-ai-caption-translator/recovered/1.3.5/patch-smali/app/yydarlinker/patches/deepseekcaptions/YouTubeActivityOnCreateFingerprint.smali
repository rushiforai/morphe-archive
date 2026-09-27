.class public final Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;
.super Lapp/morphe/patcher/Fingerprint;
.source "Fingerprints.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;",
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
.field public static final INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;-><init>()V

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;->INSTANCE:Lapp/yydarlinker/patches/deepseekcaptions/YouTubeActivityOnCreateFingerprint;

    return-void
.end method

.method private constructor <init>()V
    .registers 13

    .line 59
    const-string v0, "Landroid/os/Bundle;"

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const/16 v10, 0xe4

    const/4 v11, 0x0

    .line 55
    const-string v2, "Lcom/google/android/apps/youtube/app/watchwhile/MainActivity;"

    const-string v3, "onCreate"

    const/4 v4, 0x0

    const-string v5, "V"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v11}, Lapp/morphe/patcher/Fingerprint;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function2;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method
