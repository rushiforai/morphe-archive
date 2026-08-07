.class public Lcom/immomo/mediacore/model/PathModel;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public owner:Z

.field public streamName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/mediacore/model/PathModel;->streamName:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/immomo/mediacore/model/PathModel;->owner:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public toJson()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/gson/Gson;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 4
    .line 5
    .line 6
    const-class v1, Lcom/immomo/mediacore/model/PathModel;

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;Ljava/lang/reflect/Type;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
