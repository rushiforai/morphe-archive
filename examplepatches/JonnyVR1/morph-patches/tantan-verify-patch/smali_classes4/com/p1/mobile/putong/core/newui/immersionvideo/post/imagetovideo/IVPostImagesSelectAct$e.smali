.class public Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/w30;

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->H()V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;)Ll/w30;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->c:Ll/w30;

    return-object p0
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;Ll/w30;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->c:Ll/w30;

    return-void
.end method

.method private synthetic H()V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 16
    .line 17
    if-ge v1, v2, :cond_1

    .line 18
    .line 19
    iget-object v2, v3, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 28
    .line 29
    const-string v3, "profile"

    .line 30
    .line 31
    if-eq v2, v3, :cond_0

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 42
    .line 43
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v1, v3, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 60
    .line 61
    iget-object v4, v4, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    rsub-int/lit8 v4, v4, 0x9

    .line 68
    .line 69
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    add-int/2addr v4, v5

    .line 74
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    const/4 v4, 0x1

    .line 79
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->showPreviewEditBtn(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 96
    .line 97
    iget-object v3, v3, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    sget v4, Lcom/p1/mobile/putong/core/R$string;->b:I

    .line 100
    .line 101
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withSubmitButtonTitle(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    const/4 v3, 0x4

    .line 110
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withAlreadySelectedMedia(Ljava/util/List;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const/16 v2, 0x312

    .line 127
    .line 128
    invoke-virtual {v1, v0, v2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 134
    .line 135
    sget v0, Ll/x7c0;->y:I

    .line 136
    .line 137
    sget v1, Ll/x7c0;->e:I

    .line 138
    .line 139
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 140
    .line 141
    .line 142
    return-void
.end method


# virtual methods
.method public A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;

    .line 5
    .line 6
    new-instance p2, Ll/m8m;

    .line 7
    .line 8
    invoke-direct {p2, p0}, Ll/m8m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;->b(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$c;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectMediaView;

    .line 16
    .line 17
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 18
    .line 19
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {p3, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    check-cast p3, Lcom/p1/mobile/putong/data/Media;

    .line 26
    .line 27
    new-instance p4, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e$a;

    .line 28
    .line 29
    invoke-direct {p4, p0, p2}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e$a;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p3, p4}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectMediaView;->u(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$d;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/16 v0, 0x9

    .line 10
    .line 11
    if-ge p0, v0, :cond_0

    .line 12
    .line 13
    add-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    :cond_0
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-ne p2, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget p2, Ll/kec0;->k4:I

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget p2, Ll/kec0;->n4:I

    .line 27
    .line 28
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    const-string p0, "add image"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->d:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct;->h:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$e;->getItem(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    instance-of p0, p0, Ljava/lang/String;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method
