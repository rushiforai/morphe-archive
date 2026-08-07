.class public final enum Lorg/fourthline/cling/support/model/dlna/DLNAOperations;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/support/model/dlna/DLNAOperations;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

.field public static final enum NONE:Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

.field public static final enum RANGE:Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

.field public static final enum TIMESEEK:Lorg/fourthline/cling/support/model/dlna/DLNAOperations;


# instance fields
.field private code:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;->NONE:Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    .line 10
    .line 11
    new-instance v1, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    .line 12
    .line 13
    const-string v2, "RANGE"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;->RANGE:Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    .line 20
    .line 21
    new-instance v2, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    .line 22
    .line 23
    const/4 v3, 0x2

    .line 24
    const/16 v4, 0x10

    .line 25
    .line 26
    const-string v5, "TIMESEEK"

    .line 27
    .line 28
    invoke-direct {v2, v5, v3, v4}, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v2, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;->TIMESEEK:Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    .line 32
    .line 33
    filled-new-array {v0, v1, v2}, [Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;->$VALUES:[Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    .line 38
    .line 39
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
    iput p3, p0, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;->code:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(I)Lorg/fourthline/cling/support/model/dlna/DLNAOperations;
    .locals 5

    .line 1
    invoke-static {}, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;->values()[Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

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
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;->getCode()I

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

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/dlna/DLNAOperations;
    .locals 1

    .line 23
    const-class v0, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/support/model/dlna/DLNAOperations;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;->$VALUES:[Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/support/model/dlna/DLNAOperations;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/support/model/dlna/DLNAOperations;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/support/model/dlna/DLNAOperations;->code:I

    .line 2
    .line 3
    return p0
.end method
