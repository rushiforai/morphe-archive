.class public Lcom/immomo/velib/anim/model/VideoEffectModel;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private avatar:Lcom/immomo/velib/anim/model/Element;

.field private elements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/Element;",
            ">;"
        }
    .end annotation
.end field

.field private height:I

.field private location:Lcom/immomo/velib/anim/model/Location;

.field private loopOn:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "loopON"
    .end annotation
.end field

.field private mixSetting:Lcom/immomo/velib/anim/model/MixSetting;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "mix_settings"
    .end annotation
.end field

.field private originVideoWidth:I

.field private postProcessing:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/PostProcessingModel;",
            ">;"
        }
    .end annotation
.end field

.field private text:Lcom/immomo/velib/anim/model/Element;

.field private video:Ljava/lang/String;

.field private videoFolder:Ljava/lang/String;

.field private width:I


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

.method public static getConfigPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, "/config.json"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static parseByPath(Ljava/lang/String;)Lcom/immomo/velib/anim/model/VideoEffectModel;
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getConfigPath(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/wnk0;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    return-object v2

    .line 17
    :cond_0
    :try_start_0
    new-instance v1, Lcom/google/gson/Gson;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    .line 20
    .line 21
    .line 22
    const-class v3, Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 23
    .line 24
    invoke-virtual {v1, v0, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/immomo/velib/anim/model/VideoEffectModel;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    move-object v2, v0

    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 34
    .line 35
    .line 36
    :goto_0
    if-eqz v2, :cond_5

    .line 37
    .line 38
    invoke-virtual {v2, p0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->setVideoFolder(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getAvatar()Lcom/immomo/velib/anim/model/Element;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getAvatar()Lcom/immomo/velib/anim/model/Element;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, p0}, Lcom/immomo/velib/anim/model/Element;->setFolder(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getText()Lcom/immomo/velib/anim/model/Element;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getText()Lcom/immomo/velib/anim/model/Element;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0, p0}, Lcom/immomo/velib/anim/model/Element;->setFolder(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getElements()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    if-eqz v0, :cond_5

    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getElements()Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_5

    .line 86
    .line 87
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    check-cast v1, Lcom/immomo/velib/anim/model/Element;

    .line 92
    .line 93
    iget v3, v2, Lcom/immomo/velib/anim/model/VideoEffectModel;->width:I

    .line 94
    .line 95
    if-nez v3, :cond_3

    .line 96
    .line 97
    const/16 v3, 0x2d0

    .line 98
    .line 99
    :cond_3
    iput v3, v1, Lcom/immomo/velib/anim/model/Element;->vWidth:I

    .line 100
    .line 101
    iget v3, v2, Lcom/immomo/velib/anim/model/VideoEffectModel;->height:I

    .line 102
    .line 103
    if-nez v3, :cond_4

    .line 104
    .line 105
    const/16 v3, 0x500

    .line 106
    .line 107
    :cond_4
    iput v3, v1, Lcom/immomo/velib/anim/model/Element;->vHeight:I

    .line 108
    .line 109
    invoke-virtual {v1, p0}, Lcom/immomo/velib/anim/model/Element;->setFolder(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_5
    return-object v2
.end method


# virtual methods
.method public getAvatar()Lcom/immomo/velib/anim/model/Element;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->avatar:Lcom/immomo/velib/anim/model/Element;

    .line 2
    .line 3
    return-object p0
.end method

.method public getElements()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/Element;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->elements:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getLocation()Lcom/immomo/velib/anim/model/Location;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->location:Lcom/immomo/velib/anim/model/Location;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMixSetting()Lcom/immomo/velib/anim/model/MixSetting;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->mixSetting:Lcom/immomo/velib/anim/model/MixSetting;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOriginVideoWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->originVideoWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getPostProcessing()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/PostProcessingModel;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->postProcessing:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getText()Lcom/immomo/velib/anim/model/Element;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->text:Lcom/immomo/velib/anim/model/Element;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->video:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoFolder()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->videoFolder:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoPath()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->videoFolder:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "/"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->video:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public isLoopOn()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->loopOn:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAvatar(Lcom/immomo/velib/anim/model/Element;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->avatar:Lcom/immomo/velib/anim/model/Element;

    .line 2
    .line 3
    return-void
.end method

.method public setElements(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/Element;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->elements:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setLocation(Lcom/immomo/velib/anim/model/Location;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->location:Lcom/immomo/velib/anim/model/Location;

    .line 2
    .line 3
    return-void
.end method

.method public setLoopOn(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->loopOn:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMixSetting(Lcom/immomo/velib/anim/model/MixSetting;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->mixSetting:Lcom/immomo/velib/anim/model/MixSetting;

    .line 2
    .line 3
    return-void
.end method

.method public setOriginVideoWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->originVideoWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setPostProcessing(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/PostProcessingModel;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->postProcessing:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setText(Lcom/immomo/velib/anim/model/Element;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->text:Lcom/immomo/velib/anim/model/Element;

    .line 2
    .line 3
    return-void
.end method

.method public setVideo(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->video:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoFolder(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->videoFolder:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/velib/anim/model/VideoEffectModel;->width:I

    .line 2
    .line 3
    return-void
.end method
