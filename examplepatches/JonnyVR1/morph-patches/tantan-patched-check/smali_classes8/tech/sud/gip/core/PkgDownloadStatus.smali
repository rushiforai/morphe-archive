.class public final enum Ltech/sud/gip/core/PkgDownloadStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Ltech/sud/gip/core/PkgDownloadStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Ltech/sud/gip/core/PkgDownloadStatus;

.field public static final enum PKG_DOWNLOAD_CANCELED:Ltech/sud/gip/core/PkgDownloadStatus;

.field public static final enum PKG_DOWNLOAD_CHECK_FILE:Ltech/sud/gip/core/PkgDownloadStatus;

.field public static final enum PKG_DOWNLOAD_COMPLETED:Ltech/sud/gip/core/PkgDownloadStatus;

.field public static final enum PKG_DOWNLOAD_DOWNLOADING:Ltech/sud/gip/core/PkgDownloadStatus;

.field public static final enum PKG_DOWNLOAD_PAUSE:Ltech/sud/gip/core/PkgDownloadStatus;

.field public static final enum PKG_DOWNLOAD_STARTED:Ltech/sud/gip/core/PkgDownloadStatus;

.field public static final enum PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;


# direct methods
.method private static synthetic $values()[Ltech/sud/gip/core/PkgDownloadStatus;
    .locals 7

    .line 1
    sget-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 2
    .line 3
    sget-object v1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_STARTED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 4
    .line 5
    sget-object v2, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_DOWNLOADING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 6
    .line 7
    sget-object v3, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CHECK_FILE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 8
    .line 9
    sget-object v4, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_PAUSE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 10
    .line 11
    sget-object v5, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_COMPLETED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 12
    .line 13
    sget-object v6, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CANCELED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [Ltech/sud/gip/core/PkgDownloadStatus;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ltech/sud/gip/core/PkgDownloadStatus;

    .line 2
    .line 3
    const-string v1, "PKG_DOWNLOAD_WAITING"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Ltech/sud/gip/core/PkgDownloadStatus;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 10
    .line 11
    new-instance v0, Ltech/sud/gip/core/PkgDownloadStatus;

    .line 12
    .line 13
    const-string v1, "PKG_DOWNLOAD_STARTED"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Ltech/sud/gip/core/PkgDownloadStatus;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_STARTED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 20
    .line 21
    new-instance v0, Ltech/sud/gip/core/PkgDownloadStatus;

    .line 22
    .line 23
    const-string v1, "PKG_DOWNLOAD_DOWNLOADING"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Ltech/sud/gip/core/PkgDownloadStatus;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_DOWNLOADING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 30
    .line 31
    new-instance v0, Ltech/sud/gip/core/PkgDownloadStatus;

    .line 32
    .line 33
    const-string v1, "PKG_DOWNLOAD_CHECK_FILE"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Ltech/sud/gip/core/PkgDownloadStatus;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CHECK_FILE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 40
    .line 41
    new-instance v0, Ltech/sud/gip/core/PkgDownloadStatus;

    .line 42
    .line 43
    const-string v1, "PKG_DOWNLOAD_PAUSE"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Ltech/sud/gip/core/PkgDownloadStatus;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_PAUSE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 50
    .line 51
    new-instance v0, Ltech/sud/gip/core/PkgDownloadStatus;

    .line 52
    .line 53
    const-string v1, "PKG_DOWNLOAD_COMPLETED"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, Ltech/sud/gip/core/PkgDownloadStatus;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_COMPLETED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 60
    .line 61
    new-instance v0, Ltech/sud/gip/core/PkgDownloadStatus;

    .line 62
    .line 63
    const-string v1, "PKG_DOWNLOAD_CANCELED"

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-direct {v0, v1, v2}, Ltech/sud/gip/core/PkgDownloadStatus;-><init>(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CANCELED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 70
    .line 71
    invoke-static {}, Ltech/sud/gip/core/PkgDownloadStatus;->$values()[Ltech/sud/gip/core/PkgDownloadStatus;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->$VALUES:[Ltech/sud/gip/core/PkgDownloadStatus;

    .line 76
    .line 77
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ltech/sud/gip/core/PkgDownloadStatus;
    .locals 1

    .line 1
    const-class v0, Ltech/sud/gip/core/PkgDownloadStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ltech/sud/gip/core/PkgDownloadStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Ltech/sud/gip/core/PkgDownloadStatus;
    .locals 1

    .line 1
    sget-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->$VALUES:[Ltech/sud/gip/core/PkgDownloadStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, [Ltech/sud/gip/core/PkgDownloadStatus;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Ltech/sud/gip/core/PkgDownloadStatus;

    .line 8
    .line 9
    return-object v0
.end method
