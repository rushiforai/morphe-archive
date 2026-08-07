.class public Lcom/immomo/moment/filtermanager/MMProcessUnit;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final FILTER_DECORATION:Ljava/lang/String; = "[Decoration]"

.field public static final UnitTextureLocationOverSourceImage:I = 0x0

.field public static final serialVersionUID:J = 0x7c4267854214e663L


# instance fields
.field private mFilterMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mFilterName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "name"
    .end annotation
.end field

.field private mTexturePath1:Ljava/lang/String;

.field private resourceName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "resourceName"
    .end annotation
.end field


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

.method public constructor <init>(I)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFilterMap()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/filtermanager/MMProcessUnit;->mFilterMap:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFilterName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/filtermanager/MMProcessUnit;->mFilterName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResourceName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/filtermanager/MMProcessUnit;->resourceName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTexturePath1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/filtermanager/MMProcessUnit;->mTexturePath1:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isDecoration()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/filtermanager/MMProcessUnit;->mFilterName:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/immomo/moment/filtermanager/MMProcessUnit;->mFilterName:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "[Decoration]"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public setFilterMap(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/filtermanager/MMProcessUnit;->mFilterMap:Ljava/util/HashMap;

    .line 2
    .line 3
    return-void
.end method

.method public setFilterName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/filtermanager/MMProcessUnit;->mFilterName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setResourceName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/filtermanager/MMProcessUnit;->resourceName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTexturePath1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/filtermanager/MMProcessUnit;->mTexturePath1:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
