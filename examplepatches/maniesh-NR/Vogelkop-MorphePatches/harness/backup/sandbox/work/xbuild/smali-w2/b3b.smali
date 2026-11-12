.class public final enum Lb3b;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lb3b;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lb3b;

    const/4 v1, 0x0

    const/4 v2, -0x1

    const-string v3, "SYNC_PASSPHRASE_ERROR"

    invoke-direct {v0, v3, v1, v2}, Lb3b;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lb3b;

    const/4 v2, 0x1

    const/4 v3, -0x2

    const-string v4, "DOWNLOAD_LOCATION_ERROR"

    invoke-direct {v1, v4, v2, v3}, Lb3b;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lb3b;

    const/4 v3, 0x2

    const/4 v4, -0x3

    const-string v5, "TIMEOUT_ERROR"

    invoke-direct {v2, v5, v3, v4}, Lb3b;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lb3b;

    const/4 v4, 0x3

    const/4 v5, -0x4

    const-string v6, "DOWNLOAD_NO_SPACE_ERROR"

    invoke-direct {v3, v6, v4, v5}, Lb3b;-><init>(Ljava/lang/String;II)V

    new-instance v4, Lb3b;

    const/4 v5, 0x4

    const/4 v6, -0x5

    const-string v7, "DOWNLOAD_FILE_NAME_ERROR"

    invoke-direct {v4, v7, v5, v6}, Lb3b;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lb3b;

    const/4 v6, 0x5

    const/4 v7, -0x6

    const-string v8, "DOWNLOAD_FILE_NOT_EXIST_ERROR"

    invoke-direct {v5, v8, v6, v7}, Lb3b;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v0 .. v5}, [Lb3b;

    move-result-object v0

    sput-object v0, Lb3b;->a:[Lb3b;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lb3b;
    .registers 2

    const-class v0, Lb3b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb3b;

    return-object p0
.end method

.method public static values()[Lb3b;
    .registers 1

    sget-object v0, Lb3b;->a:[Lb3b;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb3b;

    return-object v0
.end method
