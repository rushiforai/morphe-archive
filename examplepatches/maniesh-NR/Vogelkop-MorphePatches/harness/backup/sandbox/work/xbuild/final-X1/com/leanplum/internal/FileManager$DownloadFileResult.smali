.class public final enum Lcom/leanplum/internal/FileManager$DownloadFileResult;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/FileManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DownloadFileResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/leanplum/internal/FileManager$DownloadFileResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/leanplum/internal/FileManager$DownloadFileResult;

.field public static final enum DOWNLOADING:Lcom/leanplum/internal/FileManager$DownloadFileResult;

.field public static final enum EXISTS_IN_ASSETS:Lcom/leanplum/internal/FileManager$DownloadFileResult;

.field public static final enum NONE:Lcom/leanplum/internal/FileManager$DownloadFileResult;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lcom/leanplum/internal/FileManager$DownloadFileResult;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/FileManager$DownloadFileResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/leanplum/internal/FileManager$DownloadFileResult;->NONE:Lcom/leanplum/internal/FileManager$DownloadFileResult;

    new-instance v1, Lcom/leanplum/internal/FileManager$DownloadFileResult;

    const-string v2, "EXISTS_IN_ASSETS"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/leanplum/internal/FileManager$DownloadFileResult;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/leanplum/internal/FileManager$DownloadFileResult;->EXISTS_IN_ASSETS:Lcom/leanplum/internal/FileManager$DownloadFileResult;

    new-instance v2, Lcom/leanplum/internal/FileManager$DownloadFileResult;

    const-string v3, "DOWNLOADING"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lcom/leanplum/internal/FileManager$DownloadFileResult;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/leanplum/internal/FileManager$DownloadFileResult;->DOWNLOADING:Lcom/leanplum/internal/FileManager$DownloadFileResult;

    filled-new-array {v0, v1, v2}, [Lcom/leanplum/internal/FileManager$DownloadFileResult;

    move-result-object v0

    sput-object v0, Lcom/leanplum/internal/FileManager$DownloadFileResult;->$VALUES:[Lcom/leanplum/internal/FileManager$DownloadFileResult;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/leanplum/internal/FileManager$DownloadFileResult;
    .registers 2

    const-class v0, Lcom/leanplum/internal/FileManager$DownloadFileResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/leanplum/internal/FileManager$DownloadFileResult;

    return-object p0
.end method

.method public static values()[Lcom/leanplum/internal/FileManager$DownloadFileResult;
    .registers 1

    sget-object v0, Lcom/leanplum/internal/FileManager$DownloadFileResult;->$VALUES:[Lcom/leanplum/internal/FileManager$DownloadFileResult;

    invoke-virtual {v0}, [Lcom/leanplum/internal/FileManager$DownloadFileResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/leanplum/internal/FileManager$DownloadFileResult;

    return-object v0
.end method
