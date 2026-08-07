.class public Lorg/fourthline/cling/controlpoint/event/Search;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected mxSeconds:I

.field protected searchType:Lorg/fourthline/cling/model/message/header/UpnpHeader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lorg/fourthline/cling/model/message/header/STAllHeader;

    invoke-direct {v0}, Lorg/fourthline/cling/model/message/header/STAllHeader;-><init>()V

    iput-object v0, p0, Lorg/fourthline/cling/controlpoint/event/Search;->searchType:Lorg/fourthline/cling/model/message/header/UpnpHeader;

    .line 24
    sget-object v0, Lorg/fourthline/cling/model/message/header/MXHeader;->DEFAULT_VALUE:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lorg/fourthline/cling/controlpoint/event/Search;->mxSeconds:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Lorg/fourthline/cling/model/message/header/STAllHeader;

    invoke-direct {v0}, Lorg/fourthline/cling/model/message/header/STAllHeader;-><init>()V

    iput-object v0, p0, Lorg/fourthline/cling/controlpoint/event/Search;->searchType:Lorg/fourthline/cling/model/message/header/UpnpHeader;

    .line 32
    sget-object v0, Lorg/fourthline/cling/model/message/header/MXHeader;->DEFAULT_VALUE:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 33
    iput p1, p0, Lorg/fourthline/cling/controlpoint/event/Search;->mxSeconds:I

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/message/header/UpnpHeader;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/fourthline/cling/model/message/header/STAllHeader;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/fourthline/cling/model/message/header/STAllHeader;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/fourthline/cling/controlpoint/event/Search;->searchType:Lorg/fourthline/cling/model/message/header/UpnpHeader;

    .line 10
    .line 11
    sget-object v0, Lorg/fourthline/cling/model/message/header/MXHeader;->DEFAULT_VALUE:Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lorg/fourthline/cling/controlpoint/event/Search;->mxSeconds:I

    .line 18
    .line 19
    iput-object p1, p0, Lorg/fourthline/cling/controlpoint/event/Search;->searchType:Lorg/fourthline/cling/model/message/header/UpnpHeader;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/message/header/UpnpHeader;I)V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lorg/fourthline/cling/model/message/header/STAllHeader;

    invoke-direct {v0}, Lorg/fourthline/cling/model/message/header/STAllHeader;-><init>()V

    iput-object v0, p0, Lorg/fourthline/cling/controlpoint/event/Search;->searchType:Lorg/fourthline/cling/model/message/header/UpnpHeader;

    .line 27
    sget-object v0, Lorg/fourthline/cling/model/message/header/MXHeader;->DEFAULT_VALUE:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 28
    iput-object p1, p0, Lorg/fourthline/cling/controlpoint/event/Search;->searchType:Lorg/fourthline/cling/model/message/header/UpnpHeader;

    .line 29
    iput p2, p0, Lorg/fourthline/cling/controlpoint/event/Search;->mxSeconds:I

    return-void
.end method


# virtual methods
.method public getMxSeconds()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/controlpoint/event/Search;->mxSeconds:I

    .line 2
    .line 3
    return p0
.end method

.method public getSearchType()Lorg/fourthline/cling/model/message/header/UpnpHeader;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/controlpoint/event/Search;->searchType:Lorg/fourthline/cling/model/message/header/UpnpHeader;

    .line 2
    .line 3
    return-object p0
.end method
