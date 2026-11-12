.class public final enum Lnl3;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final b:Lulp;

.field public static final enum c:Lnl3;

.field public static final enum d:Lnl3;

.field public static final enum e:Lnl3;

.field public static final enum f:Lnl3;

.field public static final synthetic g:[Lnl3;

.field public static final synthetic h:Lh58;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 12

    new-instance v0, Lnl3;

    sget-object v1, Lb3b;->a:[Lb3b;

    const/4 v1, -0x1

    const-string v2, "SYNC_PASSPHRASE_ERROR"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lnl3;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lnl3;

    const/4 v2, -0x2

    const-string v4, "DOWNLOAD_LOCATION_ERROR"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lnl3;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lnl3;

    const/4 v4, -0x3

    const-string v6, "TIMEOUT_ERROR"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v4}, Lnl3;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lnl3;->c:Lnl3;

    move v4, v3

    new-instance v3, Lnl3;

    const/4 v6, 0x3

    const/4 v8, -0x4

    const-string v9, "DOWNLOAD_NO_SPACE_ERROR"

    invoke-direct {v3, v9, v6, v8}, Lnl3;-><init>(Ljava/lang/String;II)V

    move v6, v4

    new-instance v4, Lnl3;

    const/4 v8, 0x4

    const/4 v9, -0x5

    const-string v10, "DOWNLOAD_FILE_NAME_ERROR"

    invoke-direct {v4, v10, v8, v9}, Lnl3;-><init>(Ljava/lang/String;II)V

    move v8, v5

    new-instance v5, Lnl3;

    const/4 v9, 0x5

    const/4 v10, -0x6

    const-string v11, "DOWNLOAD_FILE_NOT_EXIST_ERROR"

    invoke-direct {v5, v11, v9, v10}, Lnl3;-><init>(Ljava/lang/String;II)V

    move v9, v6

    new-instance v6, Lnl3;

    const-string v10, "UNKNOWN_ERROR"

    const/4 v11, 0x6

    invoke-direct {v6, v10, v11, v9}, Lnl3;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lnl3;->d:Lnl3;

    move v9, v7

    new-instance v7, Lnl3;

    const-string v10, "NATIVE_ERROR"

    const/4 v11, 0x7

    invoke-direct {v7, v10, v11, v8}, Lnl3;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lnl3;->e:Lnl3;

    new-instance v8, Lnl3;

    const-string v10, "NO_BOOKMARKS_FILE_ERROR"

    const/16 v11, 0x8

    invoke-direct {v8, v10, v11, v9}, Lnl3;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lnl3;->f:Lnl3;

    filled-new-array/range {v0 .. v8}, [Lnl3;

    move-result-object v0

    sput-object v0, Lnl3;->g:[Lnl3;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lnl3;->h:Lh58;

    new-instance v0, Lulp;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lulp;-><init>(B)V

    sput-object v0, Lnl3;->b:Lulp;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lnl3;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnl3;
    .registers 2

    const-class v0, Lnl3;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnl3;

    return-object p0
.end method

.method public static values()[Lnl3;
    .registers 1

    sget-object v0, Lnl3;->g:[Lnl3;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnl3;

    return-object v0
.end method
