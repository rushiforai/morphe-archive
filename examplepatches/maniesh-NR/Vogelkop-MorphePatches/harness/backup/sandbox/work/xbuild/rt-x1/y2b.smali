.class public final enum Ly2b;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final b:Lix5;

.field public static final enum c:Ly2b;

.field public static final enum d:Ly2b;

.field public static final enum e:Ly2b;

.field public static final synthetic f:[Ly2b;

.field public static final synthetic g:Lh58;


# instance fields
.field public final a:I


# direct methods
.method static constructor <clinit>()V
    .registers 15

    new-instance v0, Ly2b;

    sget-object v1, Lb3b;->a:[Lb3b;

    const/4 v1, -0x1

    const-string v2, "SYNC_PASSPHRASE_ERROR"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Ly2b;-><init>(Ljava/lang/String;II)V

    sput-object v0, Ly2b;->c:Ly2b;

    new-instance v1, Ly2b;

    const/4 v2, -0x2

    const-string v4, "DOWNLOAD_LOCATION_ERROR"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Ly2b;-><init>(Ljava/lang/String;II)V

    new-instance v2, Ly2b;

    const/4 v4, -0x3

    const-string v6, "TIMEOUT_ERROR"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v4}, Ly2b;-><init>(Ljava/lang/String;II)V

    sput-object v2, Ly2b;->d:Ly2b;

    move v4, v3

    new-instance v3, Ly2b;

    const/4 v6, -0x4

    const-string v8, "DOWNLOAD_NO_SPACE_ERROR"

    const/4 v9, 0x3

    invoke-direct {v3, v8, v9, v6}, Ly2b;-><init>(Ljava/lang/String;II)V

    move v6, v4

    new-instance v4, Ly2b;

    const/4 v8, -0x5

    const-string v10, "DOWNLOAD_FILE_NAME_ERROR"

    const/4 v11, 0x4

    invoke-direct {v4, v10, v11, v8}, Ly2b;-><init>(Ljava/lang/String;II)V

    move v8, v5

    new-instance v5, Ly2b;

    const/4 v10, -0x6

    const-string v12, "DOWNLOAD_FILE_NOT_EXIST_ERROR"

    const/4 v13, 0x5

    invoke-direct {v5, v12, v13, v10}, Ly2b;-><init>(Ljava/lang/String;II)V

    move v10, v6

    new-instance v6, Ly2b;

    const-string v12, "UNKNOWN_ERROR"

    const/4 v14, 0x6

    invoke-direct {v6, v12, v14, v10}, Ly2b;-><init>(Ljava/lang/String;II)V

    sput-object v6, Ly2b;->e:Ly2b;

    move v10, v7

    new-instance v7, Ly2b;

    const-string v12, "IO_ERROR"

    const/4 v14, 0x7

    invoke-direct {v7, v12, v14, v8}, Ly2b;-><init>(Ljava/lang/String;II)V

    new-instance v8, Ly2b;

    const-string v12, "BAD_FORMAT"

    const/16 v14, 0x8

    invoke-direct {v8, v12, v14, v10}, Ly2b;-><init>(Ljava/lang/String;II)V

    move v10, v9

    new-instance v9, Ly2b;

    const-string v12, "MAX_FILE_SIZE"

    const/16 v14, 0x9

    invoke-direct {v9, v12, v14, v10}, Ly2b;-><init>(Ljava/lang/String;II)V

    new-instance v10, Ly2b;

    const-string v12, "IMPORT_ALREADY_ACTIVE"

    const/16 v14, 0xa

    invoke-direct {v10, v12, v14, v11}, Ly2b;-><init>(Ljava/lang/String;II)V

    new-instance v11, Ly2b;

    const-string v12, "NUM_PASSWORDS_EXCEEDED"

    const/16 v14, 0xb

    invoke-direct {v11, v12, v14, v13}, Ly2b;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v0 .. v11}, [Ly2b;

    move-result-object v0

    sput-object v0, Ly2b;->f:[Ly2b;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Ly2b;->g:Lh58;

    new-instance v0, Lix5;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lix5;-><init>(B)V

    sput-object v0, Ly2b;->b:Lix5;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Ly2b;->a:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ly2b;
    .registers 2

    const-class v0, Ly2b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ly2b;

    return-object p0
.end method

.method public static values()[Ly2b;
    .registers 1

    sget-object v0, Ly2b;->f:[Ly2b;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ly2b;

    return-object v0
.end method
