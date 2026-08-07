.class public final enum Lcom/ss/bytertc/ktv/data/DownloadFileType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/ktv/data/DownloadFileType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/ktv/data/DownloadFileType;

.field public static final enum KRC:Lcom/ss/bytertc/ktv/data/DownloadFileType;

.field public static final enum LRC:Lcom/ss/bytertc/ktv/data/DownloadFileType;

.field public static final enum MIDI:Lcom/ss/bytertc/ktv/data/DownloadFileType;

.field public static final enum MUSIC:Lcom/ss/bytertc/ktv/data/DownloadFileType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 2
    .line 3
    const-string v1, "MUSIC"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/ktv/data/DownloadFileType;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/ktv/data/DownloadFileType;->MUSIC:Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 13
    .line 14
    const-string v2, "KRC"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/ss/bytertc/ktv/data/DownloadFileType;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/ktv/data/DownloadFileType;->KRC:Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 21
    .line 22
    new-instance v2, Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 23
    .line 24
    const-string v3, "LRC"

    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    invoke-direct {v2, v3, v4, v5}, Lcom/ss/bytertc/ktv/data/DownloadFileType;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/ss/bytertc/ktv/data/DownloadFileType;->LRC:Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 31
    .line 32
    new-instance v3, Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 33
    .line 34
    const-string v4, "MIDI"

    .line 35
    .line 36
    const/4 v6, 0x4

    .line 37
    invoke-direct {v3, v4, v5, v6}, Lcom/ss/bytertc/ktv/data/DownloadFileType;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/ss/bytertc/ktv/data/DownloadFileType;->MIDI:Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 41
    .line 42
    filled-new-array {v0, v1, v2, v3}, [Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/ss/bytertc/ktv/data/DownloadFileType;->$VALUES:[Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 47
    .line 48
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/ss/bytertc/ktv/data/DownloadFileType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/ktv/data/DownloadFileType;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/ktv/data/DownloadFileType;->values()[Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Lcom/ss/bytertc/ktv/data/DownloadFileType;->value()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/ktv/data/DownloadFileType;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/ktv/data/DownloadFileType;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/ktv/data/DownloadFileType;->$VALUES:[Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/ktv/data/DownloadFileType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/ktv/data/DownloadFileType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/ktv/data/DownloadFileType$1;->$SwitchMap$com$ss$bytertc$ktv$data$DownloadFileType:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p0, v0, :cond_0

    .line 20
    .line 21
    const-string p0, ""

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const-string p0, "DOWNLOAD_FILE_TYPE_MIDI"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string p0, "DOWNLOAD_FILE_TYPE_LRC"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    const-string p0, "DOWNLOAD_FILE_TYPE_KRC"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_3
    const-string p0, "DOWNLOAD_FILE_TYPE_MUSIC"

    .line 34
    .line 35
    return-object p0
.end method

.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/ktv/data/DownloadFileType;->value:I

    .line 2
    .line 3
    return p0
.end method
