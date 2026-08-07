.class public Lcom/momo/mcamera/filtermanager/MMFilterConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field displayName:Ljava/lang/String;

.field filterExt:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "postprocessingUnits"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMProcessUnit;",
            ">;"
        }
    .end annotation
.end field

.field name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getDisplayName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMFilterConfig;->displayName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFilterExt()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMProcessUnit;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMFilterConfig;->filterExt:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMFilterConfig;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMFilterConfig;->displayName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFilterExt(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMProcessUnit;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMFilterConfig;->filterExt:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMFilterConfig;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
