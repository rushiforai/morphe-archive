.class public Lorg/fourthline/cling/model/meta/ManufacturerDetails;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private manufacturer:Ljava/lang/String;

.field private manufacturerURI:Ljava/net/URI;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lorg/fourthline/cling/model/meta/ManufacturerDetails;->manufacturer:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/model/meta/ManufacturerDetails;->manufacturer:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p2}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lorg/fourthline/cling/model/meta/ManufacturerDetails;->manufacturerURI:Ljava/net/URI;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/net/URI;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lorg/fourthline/cling/model/meta/ManufacturerDetails;->manufacturer:Ljava/lang/String;

    .line 19
    iput-object p2, p0, Lorg/fourthline/cling/model/meta/ManufacturerDetails;->manufacturerURI:Ljava/net/URI;

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lorg/fourthline/cling/model/meta/ManufacturerDetails;->manufacturerURI:Ljava/net/URI;

    return-void
.end method


# virtual methods
.method public getManufacturer()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/meta/ManufacturerDetails;->manufacturer:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getManufacturerURI()Ljava/net/URI;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/meta/ManufacturerDetails;->manufacturerURI:Ljava/net/URI;

    .line 2
    .line 3
    return-object p0
.end method
