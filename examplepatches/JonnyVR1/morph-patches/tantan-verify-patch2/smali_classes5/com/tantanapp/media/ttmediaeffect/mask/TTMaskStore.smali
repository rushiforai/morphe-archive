.class public Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static ourInstance:Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;


# instance fields
.field private maskStore:Lcom/momo/mcamera/mask/MaskStore;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->ourInstance:Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/momo/mcamera/mask/MaskStore;->getInstance()Lcom/momo/mcamera/mask/MaskStore;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 9
    .line 10
    return-void
.end method

.method public static getInstance()Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->ourInstance:Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;

    .line 2
    .line 3
    return-object v0
.end method

.method private static toTTMaskModel(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/MaskModel;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/momo/mcamera/mask/MaskModel;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    new-instance v2, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;

    .line 27
    .line 28
    invoke-direct {v2, v1}, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;-><init>(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-object v0
.end method


# virtual methods
.method public addGestureMasks(Landroid/content/Context;Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/MaskStore;->getGestureMasks(Landroid/content/Context;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskStore;->getGestureMasks(Landroid/content/Context;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2}, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->getMaskModel()Lcom/momo/mcamera/mask/MaskModel;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public addMasks(Landroid/content/Context;Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/MaskStore;->getMasks(Landroid/content/Context;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskStore;->getMasks(Landroid/content/Context;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2}, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->getMaskModel()Lcom/momo/mcamera/mask/MaskModel;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public getFolderPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/MaskStore;->getFolderPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getGestureMasks(Landroid/content/Context;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskStore;->getGestureMasks(Landroid/content/Context;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->toTTMaskModel(Ljava/util/List;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getMask(Landroid/content/Context;Ljava/lang/String;)Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/MaskStore;->getMask(Landroid/content/Context;Ljava/lang/String;)Lcom/momo/mcamera/mask/MaskModel;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;-><init>(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 10
    .line 11
    .line 12
    return-object p1
.end method

.method public getMasks(Landroid/content/Context;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskStore;->getMasks(Landroid/content/Context;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->toTTMaskModel(Ljava/util/List;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public removeGestureMasks(Landroid/content/Context;Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/MaskStore;->getGestureMasks(Landroid/content/Context;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskStore;->getGestureMasks(Landroid/content/Context;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2}, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->getMaskModel()Lcom/momo/mcamera/mask/MaskModel;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public removeMasks(Landroid/content/Context;Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/MaskStore;->getMasks(Landroid/content/Context;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskStore;->getMasks(Landroid/content/Context;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2}, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskModel;->getMaskModel()Lcom/momo/mcamera/mask/MaskModel;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public setFolderPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/mask/TTMaskStore;->maskStore:Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/MaskStore;->setFolderPath(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
