.class public Lcom/tantanapp/android/injecter/facade/model/RouteMeta;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private destination:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private extra:I

.field private group:Ljava/lang/String;

.field private injectConfig:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/android/injecter/facade/annotation/Autowired;",
            ">;"
        }
    .end annotation
.end field

.field private name:Ljava/lang/String;

.field private paramsType:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private path:Ljava/lang/String;

.field private priority:I

.field private rawType:Ljavax/lang/model/element/Element;

.field private type:Lcom/tantanapp/android/injecter/facade/enums/RouteType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 31
    iput v0, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->priority:I

    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/android/injecter/facade/annotation/Route;Ljava/lang/Class;Lcom/tantanapp/android/injecter/facade/enums/RouteType;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/android/injecter/facade/annotation/Route;",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/tantanapp/android/injecter/facade/enums/RouteType;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/tantanapp/android/injecter/facade/annotation/Route;->name()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    invoke-interface {p1}, Lcom/tantanapp/android/injecter/facade/annotation/Route;->path()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v5

    .line 9
    invoke-interface {p1}, Lcom/tantanapp/android/injecter/facade/annotation/Route;->group()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v6

    .line 13
    invoke-interface {p1}, Lcom/tantanapp/android/injecter/facade/annotation/Route;->priority()I

    .line 14
    .line 15
    .line 16
    move-result v8

    .line 17
    invoke-interface {p1}, Lcom/tantanapp/android/injecter/facade/annotation/Route;->extras()I

    .line 18
    .line 19
    .line 20
    move-result v9

    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v7, 0x0

    .line 23
    move-object v0, p0

    .line 24
    move-object v3, p2

    .line 25
    move-object v1, p3

    .line 26
    invoke-direct/range {v0 .. v9}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;-><init>(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljavax/lang/model/element/Element;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/android/injecter/facade/annotation/Route;Ljavax/lang/model/element/Element;Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/android/injecter/facade/annotation/Route;",
            "Ljavax/lang/model/element/Element;",
            "Lcom/tantanapp/android/injecter/facade/enums/RouteType;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 32
    invoke-interface {p1}, Lcom/tantanapp/android/injecter/facade/annotation/Route;->name()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Lcom/tantanapp/android/injecter/facade/annotation/Route;->path()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1}, Lcom/tantanapp/android/injecter/facade/annotation/Route;->group()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1}, Lcom/tantanapp/android/injecter/facade/annotation/Route;->priority()I

    move-result v8

    invoke-interface {p1}, Lcom/tantanapp/android/injecter/facade/annotation/Route;->extras()I

    move-result v9

    const/4 v3, 0x0

    move-object v0, p0

    move-object v2, p2

    move-object v1, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v9}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;-><init>(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljavax/lang/model/element/Element;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)V

    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljavax/lang/model/element/Element;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/android/injecter/facade/enums/RouteType;",
            "Ljavax/lang/model/element/Element;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;II)V"
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->type:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 35
    iput-object p4, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->name:Ljava/lang/String;

    .line 36
    iput-object p3, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->destination:Ljava/lang/Class;

    .line 37
    iput-object p2, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->rawType:Ljavax/lang/model/element/Element;

    .line 38
    iput-object p5, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->path:Ljava/lang/String;

    .line 39
    iput-object p6, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->group:Ljava/lang/String;

    .line 40
    iput-object p7, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->paramsType:Ljava/util/Map;

    .line 41
    iput p8, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->priority:I

    .line 42
    iput p9, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->extra:I

    return-void
.end method

.method public static build(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;II)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/android/injecter/facade/enums/RouteType;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "II)",
            "Lcom/tantanapp/android/injecter/facade/model/RouteMeta;"
        }
    .end annotation

    .line 17
    new-instance v0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v2, 0x0

    move-object v1, p0

    move-object v3, p1

    move-object v5, p2

    move-object v6, p3

    move v8, p4

    move v9, p5

    invoke-direct/range {v0 .. v9}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;-><init>(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljavax/lang/model/element/Element;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)V

    return-object v0
.end method

.method public static build(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/android/injecter/facade/enums/RouteType;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;II)",
            "Lcom/tantanapp/android/injecter/facade/model/RouteMeta;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v4, 0x0

    .line 5
    move-object v1, p0

    .line 6
    move-object v3, p1

    .line 7
    move-object v5, p2

    .line 8
    move-object v6, p3

    .line 9
    move-object v7, p4

    .line 10
    move v8, p5

    .line 11
    move/from16 v9, p6

    .line 12
    .line 13
    invoke-direct/range {v0 .. v9}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;-><init>(Lcom/tantanapp/android/injecter/facade/enums/RouteType;Ljavax/lang/model/element/Element;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;II)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method


# virtual methods
.method public getDestination()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->destination:Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExtra()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->extra:I

    .line 2
    .line 3
    return p0
.end method

.method public getGroup()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->group:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getParamsType()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->paramsType:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPriority()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->priority:I

    .line 2
    .line 3
    return p0
.end method

.method public getRawType()Ljavax/lang/model/element/Element;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->rawType:Ljavax/lang/model/element/Element;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Lcom/tantanapp/android/injecter/facade/enums/RouteType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->type:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDestination(Ljava/lang/Class;)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/tantanapp/android/injecter/facade/model/RouteMeta;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->destination:Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method

.method public setExtra(I)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->extra:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setGroup(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->group:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPath(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPriority(I)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->priority:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setRawType(Ljavax/lang/model/element/Element;)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->rawType:Ljavax/lang/model/element/Element;

    .line 2
    .line 3
    return-object p0
.end method

.method public setType(Lcom/tantanapp/android/injecter/facade/enums/RouteType;)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->type:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RouteMeta{type="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->type:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", rawType="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->rawType:Ljavax/lang/model/element/Element;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", destination="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->destination:Ljava/lang/Class;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", path=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->path:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', group=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->group:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', priority="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->priority:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", extra="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->extra:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", paramsType="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->paramsType:Ljava/util/Map;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", name=\'"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->name:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p0, "\'}"

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0
.end method
