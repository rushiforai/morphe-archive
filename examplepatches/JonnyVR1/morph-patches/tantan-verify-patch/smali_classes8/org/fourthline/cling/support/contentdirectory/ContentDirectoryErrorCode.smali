.class public final enum Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

.field public static final enum CANNOT_PROCESS:Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

.field public static final enum NO_SUCH_OBJECT:Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

.field public static final enum UNSUPPORTED_SORT_CRITERIA:Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;


# instance fields
.field private code:I

.field private description:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 2
    .line 3
    const/16 v1, 0x2bd

    .line 4
    .line 5
    const-string v2, "The specified ObjectID is invalid"

    .line 6
    .line 7
    const-string v3, "NO_SUCH_OBJECT"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v0, v3, v4, v1, v2}, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->NO_SUCH_OBJECT:Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 14
    .line 15
    new-instance v1, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 16
    .line 17
    const/16 v2, 0x2c5

    .line 18
    .line 19
    const-string v3, "Unsupported or invalid sort criteria"

    .line 20
    .line 21
    const-string v4, "UNSUPPORTED_SORT_CRITERIA"

    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    invoke-direct {v1, v4, v5, v2, v3}, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v1, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->UNSUPPORTED_SORT_CRITERIA:Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 28
    .line 29
    new-instance v2, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 30
    .line 31
    const/16 v3, 0x2d0

    .line 32
    .line 33
    const-string v4, "Cannot process the request"

    .line 34
    .line 35
    const-string v5, "CANNOT_PROCESS"

    .line 36
    .line 37
    const/4 v6, 0x2

    .line 38
    invoke-direct {v2, v5, v6, v3, v4}, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sput-object v2, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->CANNOT_PROCESS:Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 42
    .line 43
    filled-new-array {v0, v1, v2}, [Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->$VALUES:[Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 48
    .line 49
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->code:I

    .line 5
    .line 6
    iput-object p4, p0, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->description:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static getByCode(I)Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;
    .locals 5

    .line 1
    invoke-static {}, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->values()[Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

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
    invoke-virtual {v3}, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->getCode()I

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

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->$VALUES:[Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->code:I

    .line 2
    .line 3
    return p0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/contentdirectory/ContentDirectoryErrorCode;->description:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
