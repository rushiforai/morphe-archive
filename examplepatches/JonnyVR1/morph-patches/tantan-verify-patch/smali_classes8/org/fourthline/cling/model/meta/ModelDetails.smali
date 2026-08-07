.class public Lorg/fourthline/cling/model/meta/ModelDetails;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private modelDescription:Ljava/lang/String;

.field private modelName:Ljava/lang/String;

.field private modelNumber:Ljava/lang/String;

.field private modelURI:Ljava/net/URI;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelName:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelDescription:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelName:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelDescription:Ljava/lang/String;

    .line 25
    iput-object p3, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelNumber:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
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
    iput-object p1, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelName:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelDescription:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelNumber:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p4}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelURI:Ljava/net/URI;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URI;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelName:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelDescription:Ljava/lang/String;

    .line 29
    iput-object p3, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelNumber:Ljava/lang/String;

    .line 30
    iput-object p4, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelURI:Ljava/net/URI;

    return-void
.end method


# virtual methods
.method public getModelDescription()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelDescription:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getModelName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getModelNumber()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelNumber:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getModelURI()Ljava/net/URI;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/meta/ModelDetails;->modelURI:Ljava/net/URI;

    .line 2
    .line 3
    return-object p0
.end method
