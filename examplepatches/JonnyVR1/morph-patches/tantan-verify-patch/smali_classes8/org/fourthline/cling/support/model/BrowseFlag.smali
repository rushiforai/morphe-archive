.class public final enum Lorg/fourthline/cling/support/model/BrowseFlag;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/support/model/BrowseFlag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/support/model/BrowseFlag;

.field public static final enum DIRECT_CHILDREN:Lorg/fourthline/cling/support/model/BrowseFlag;

.field public static final enum METADATA:Lorg/fourthline/cling/support/model/BrowseFlag;


# instance fields
.field private protocolString:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/BrowseFlag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "BrowseMetadata"

    .line 5
    .line 6
    const-string v3, "METADATA"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lorg/fourthline/cling/support/model/BrowseFlag;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lorg/fourthline/cling/support/model/BrowseFlag;->METADATA:Lorg/fourthline/cling/support/model/BrowseFlag;

    .line 12
    .line 13
    new-instance v1, Lorg/fourthline/cling/support/model/BrowseFlag;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "BrowseDirectChildren"

    .line 17
    .line 18
    const-string v4, "DIRECT_CHILDREN"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lorg/fourthline/cling/support/model/BrowseFlag;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lorg/fourthline/cling/support/model/BrowseFlag;->DIRECT_CHILDREN:Lorg/fourthline/cling/support/model/BrowseFlag;

    .line 24
    .line 25
    filled-new-array {v0, v1}, [Lorg/fourthline/cling/support/model/BrowseFlag;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lorg/fourthline/cling/support/model/BrowseFlag;->$VALUES:[Lorg/fourthline/cling/support/model/BrowseFlag;

    .line 30
    .line 31
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/fourthline/cling/support/model/BrowseFlag;->protocolString:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/BrowseFlag;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/BrowseFlag;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/support/model/BrowseFlag;

    .line 8
    .line 9
    return-object p0
.end method

.method public static valueOrNullOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/BrowseFlag;
    .locals 5

    .line 1
    invoke-static {}, Lorg/fourthline/cling/support/model/BrowseFlag;->values()[Lorg/fourthline/cling/support/model/BrowseFlag;

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
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/BrowseFlag;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    return-object v3

    .line 22
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/support/model/BrowseFlag;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/model/BrowseFlag;->$VALUES:[Lorg/fourthline/cling/support/model/BrowseFlag;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/support/model/BrowseFlag;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/support/model/BrowseFlag;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/BrowseFlag;->protocolString:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
