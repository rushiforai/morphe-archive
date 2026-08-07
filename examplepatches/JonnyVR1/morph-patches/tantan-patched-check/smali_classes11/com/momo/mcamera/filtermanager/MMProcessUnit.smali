.class public Lcom/momo/mcamera/filtermanager/MMProcessUnit;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final FILTER_DECORATION:Ljava/lang/String; = "[Decoration]"

.field public static final UnitTextureLocationOverSourceImage:I = 0x0

.field public static final UnitTextureLocationUnderSourceImage:I = 0x1

.field public static final serialVersionUID:J = 0x7c4267854214e663L


# instance fields
.field private bak:Ljava/lang/String;

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

.field private mTextLocation:I

.field private mTexturePath1:Ljava/lang/String;

.field private mTexturePath2:Ljava/lang/String;

.field private resourceName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "resourceName"
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mTextLocation:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getBak()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->bak:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

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
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mFilterMap:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFilterName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mFilterName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResourceName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->resourceName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextLocation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mTextLocation:I

    .line 2
    .line 3
    return p0
.end method

.method public getTexturePath1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mTexturePath1:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTexturePath2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mTexturePath2:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isDecoration()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mFilterName:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mFilterName:Ljava/lang/String;

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

.method public setBak(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->bak:Ljava/lang/String;

    .line 2
    .line 3
    return-void
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
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mFilterMap:Ljava/util/HashMap;

    .line 2
    .line 3
    return-void
.end method

.method public setFilterName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mFilterName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setResourceName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->resourceName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTextLocation(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mTextLocation:I

    .line 2
    .line 3
    return-void
.end method

.method public setTexturePath1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mTexturePath1:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTexturePath2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mTexturePath2:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MMProcessUnit{mTextLocation="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mTextLocation:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", mFilterName=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mFilterName:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', mFilterMap="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mFilterMap:Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", mTexturePath1=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mTexturePath1:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', mTexturePath2=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMProcessUnit;->mTexturePath2:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p0, "\'}"

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
