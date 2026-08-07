.class public Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# static fields
.field public static e:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static f:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lkotlin/Triple<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

.field public d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->e:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->f:Lrx/subjects/b;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Z1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Landroid/os/Bundle;

    .line 9
    .line 10
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "params_object"

    .line 14
    .line 15
    invoke-virtual {p0, v1, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 16
    .line 17
    .line 18
    const-string p1, "extra_bundle"

    .line 19
    .line 20
    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method private Z1(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/ycc0;->o0:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "extra_bundle"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

    .line 42
    .line 43
    invoke-direct {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string v0, "params_object"

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    sget v0, Ll/ycc0;->o0:I

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

    .line 80
    .line 81
    const-string v1, "MediaPickerFrag"

    .line 82
    .line 83
    invoke-virtual {p1, v0, p0, v1}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Landroidx/fragment/app/k;->j()I

    .line 87
    .line 88
    .line 89
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public checkRunningCondition()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->ensurePlugin()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/toh0;->t(Landroid/content/Intent;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public ensurePlugin()Z
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/uqb0;->j0:Ll/dg00;

    .line 10
    .line 11
    const-string v0, "account"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/dg00;->z(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-static {}, Ll/uqb0;->J0()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public finish()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget v1, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->finishInAnim:I

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    sget v1, Ll/w7c0;->a:I

    .line 17
    .line 18
    iget v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->finishOutAnim:I

    .line 19
    .line 20
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/jec0;->f:I

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-virtual {p1, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public initSubscription()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jyx;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/jyx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/bn5;->f()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 29
    .line 30
    new-instance v0, Ll/pf60;

    .line 31
    .line 32
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 33
    .line 34
    invoke-interface {v1}, Ll/bn5;->e()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    const-string v1, "male"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-string v1, "female"

    .line 44
    .line 45
    :goto_0
    const-string v2, "page_gender"

    .line 46
    .line 47
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    filled-new-array {v0}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 13
    .line 14
    iget v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 15
    .line 16
    const/16 v1, 0x9

    .line 17
    .line 18
    if-ne v0, v1, :cond_2

    .line 19
    .line 20
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const-string v0, "extra_images"

    .line 27
    .line 28
    invoke-virtual {p3, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/util/List;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-lez v1, :cond_2

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 52
    .line 53
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 54
    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 58
    .line 59
    const-string p2, "file://"

    .line 60
    .line 61
    const-string p3, ""

    .line 62
    .line 63
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    new-instance p2, Ljava/io/File;

    .line 68
    .line 69
    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2}, Ljava/io/File;->length()J

    .line 73
    .line 74
    .line 75
    move-result-wide v0

    .line 76
    const-wide/32 v2, 0x100000

    .line 77
    .line 78
    .line 79
    cmp-long p3, v0, v2

    .line 80
    .line 81
    if-gez p3, :cond_0

    .line 82
    .line 83
    const-string p1, "\u4f60\u7684\u89c6\u9891\u957f\u5ea6\u592a\u77ed\u4e86"

    .line 84
    .line 85
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->finish()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_0
    invoke-virtual {p2}, Ljava/io/File;->length()J

    .line 93
    .line 94
    .line 95
    move-result-wide v0

    .line 96
    const-wide/32 v2, 0x1e00000

    .line 97
    .line 98
    .line 99
    cmp-long p3, v0, v2

    .line 100
    .line 101
    if-lez p3, :cond_1

    .line 102
    .line 103
    const-string p1, "\u4f60\u7684\u89c6\u9891\u957f\u5ea6\u592a\u957f\u4e86"

    .line 104
    .line 105
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->finish()V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_1
    new-instance p3, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v0, "data:video/mp4;base64,"

    .line 115
    .line 116
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-static {p2}, Ll/emk0;->a(Ljava/io/File;)[B

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    const/4 v0, 0x2

    .line 124
    invoke-static {p2, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    new-instance p3, Landroid/media/MediaMetadataRetriever;

    .line 136
    .line 137
    invoke-direct {p3}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p3, p1}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    const/16 p1, 0x12

    .line 144
    .line 145
    invoke-virtual {p3, p1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    const/16 v0, 0x13

    .line 150
    .line 151
    invoke-virtual {p3, v0}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p3

    .line 155
    sget-object v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->f:Lrx/subjects/b;

    .line 156
    .line 157
    new-instance v1, Lkotlin/Triple;

    .line 158
    .line 159
    invoke-direct {v1, p2, p1, p3}, Lkotlin/Triple;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    sget-object p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->f:Lrx/subjects/b;

    .line 166
    .line 167
    invoke-virtual {p1}, Lrx/subjects/b;->onCompleted()V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->finish()V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

    .line 175
    .line 176
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-eqz v0, :cond_3

    .line 181
    .line 182
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

    .line 183
    .line 184
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->onActivityResult(IILandroid/content/Intent;)V

    .line 185
    .line 186
    .line 187
    :cond_3
    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 6
    .line 7
    const/16 v2, 0x8

    .line 8
    .line 9
    if-ne v1, v2, :cond_0

    .line 10
    .line 11
    iget-wide v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->jsBridgeTimestamp:J

    .line 12
    .line 13
    new-instance v2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1, v2}, Ll/xl70;->j(JLjava/util/ArrayList;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->finish()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onCropImageResult(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 12
    .line 13
    const/16 v1, 0x9

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "data:image/png;base64,"

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ljava/io/File;

    .line 25
    .line 26
    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/emk0;->a(Ljava/io/File;)[B

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/4 v1, 0x2

    .line 34
    invoke-static {p1, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    sget-object v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->e:Lrx/subjects/b;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->e:Lrx/subjects/b;

    .line 51
    .line 52
    invoke-virtual {p1}, Lrx/subjects/b;->onCompleted()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->finish()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 68
    .line 69
    iget v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    if-eq v0, v1, :cond_1

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    if-ne v0, v1, :cond_3

    .line 76
    .line 77
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 78
    .line 79
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v1, "preprocessed"

    .line 83
    .line 84
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 89
    .line 90
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 95
    .line 96
    const-string p1, "image/jpeg"

    .line 97
    .line 98
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 99
    .line 100
    new-instance p1, Landroid/content/Intent;

    .line 101
    .line 102
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 103
    .line 104
    .line 105
    sget-object v1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 106
    .line 107
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/Picture;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

    .line 119
    .line 120
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_2

    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

    .line 127
    .line 128
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->N4(Landroid/content/Intent;)V

    .line 129
    .line 130
    .line 131
    :cond_2
    const/4 v0, -0x1

    .line 132
    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->finish()V

    .line 136
    .line 137
    .line 138
    :cond_3
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_camera_local_album"

    .line 2
    .line 3
    return-object p0
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
