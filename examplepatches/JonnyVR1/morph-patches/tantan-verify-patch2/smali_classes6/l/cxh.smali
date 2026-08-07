.class public Ll/cxh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/d0r;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/lwh;",
        ">;",
        "Ll/d0r;"
    }
.end annotation


# instance fields
.field public a:Lv/VRelative;

.field public b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

.field public c:Landroid/view/View;

.field public d:Lv/VImage;

.field public e:Lv/VRelative;

.field public f:Lv/VText;

.field public g:Lv/VEditText;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Lv/VDraweeView;

.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Lv/VImage;

.field public m:Lv/VImage;

.field public n:Lv/VImage;

.field public o:Lv/VText;

.field public p:Ll/lwh;

.field public q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

.field public r:Z

.field public final s:Landroid/view/animation/Interpolator;

.field public final t:Landroid/view/animation/Interpolator;

.field public u:Lcom/p1/mobile/putong/data/MessageLocation;

.field public v:Lcom/p1/mobile/putong/data/Media;

.field public w:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xjg;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/xjg;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/cxh;->s:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    new-instance v0, Ll/xjg;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/xjg;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/cxh;->t:Landroid/view/animation/Interpolator;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/cxh;->w:Z

    .line 20
    .line 21
    iput-object p1, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 22
    .line 23
    return-void
.end method

.method private A()V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cxh;->d:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/swh;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/swh;-><init>(Ll/cxh;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/cxh;->h:Lv/VText;

    .line 12
    .line 13
    iget-object v1, p0, Ll/cxh;->i:Lv/VImage;

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    new-array v2, v2, [Landroid/view/View;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    aput-object v0, v2, v3

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    aput-object v1, v2, v0

    .line 23
    .line 24
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance v2, Ll/twh;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Ll/twh;-><init>(Ll/cxh;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/cxh;->n:Lv/VImage;

    .line 37
    .line 38
    new-instance v2, Ll/uwh;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/uwh;-><init>(Ll/cxh;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/cxh;->m:Lv/VImage;

    .line 47
    .line 48
    new-instance v2, Ll/vwh;

    .line 49
    .line 50
    invoke-direct {v2, p0}, Ll/vwh;-><init>(Ll/cxh;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/cxh;->l:Lv/VImage;

    .line 57
    .line 58
    new-instance v2, Ll/wwh;

    .line 59
    .line 60
    invoke-direct {v2, p0}, Ll/wwh;-><init>(Ll/cxh;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/cxh;->f:Lv/VText;

    .line 67
    .line 68
    new-instance v2, Ll/xwh;

    .line 69
    .line 70
    invoke-direct {v2, p0}, Ll/xwh;-><init>(Ll/cxh;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Ll/cxh;->g:Lv/VEditText;

    .line 77
    .line 78
    new-instance v2, Ll/b4h;

    .line 79
    .line 80
    const/16 v4, 0x1e

    .line 81
    .line 82
    invoke-direct {v2, v4}, Ll/b4h;-><init>(I)V

    .line 83
    .line 84
    .line 85
    new-array v0, v0, [Landroid/text/InputFilter;

    .line 86
    .line 87
    aput-object v2, v0, v3

    .line 88
    .line 89
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 93
    .line 94
    new-instance v1, Ll/cxh$a;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/cxh$a;-><init>(Ll/cxh;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/cxh;->o:Lv/VText;

    .line 103
    .line 104
    new-instance v1, Ll/ywh;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Ll/ywh;-><init>(Ll/cxh;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/owh;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/owh;-><init>(Ll/cxh;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cxh;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/cn40;->f0(Lcom/p1/mobile/android/app/Act;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 8
    .line 9
    iget-object p0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const v3, 0x3f3aee42

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x7

    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "p_camera_album_picture_preview"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withMediaPreviewPageId(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/16 v1, 0x42

    .line 71
    .line 72
    invoke-virtual {p1, v0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 76
    .line 77
    sget p1, Ll/a8c0;->i:I

    .line 78
    .line 79
    sget v0, Ll/a8c0;->e:I

    .line 80
    .line 81
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private W()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->m:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "source_page"

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {v0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "e_set_my_state_post"

    .line 16
    .line 17
    const-string v2, "p_set_my_state_post"

    .line 18
    .line 19
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/cxh;->o:Lv/VText;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/cxh;->T(Lcom/p1/mobile/putong/data/Emotion;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/4 v1, 0x0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 65
    .line 66
    iget-object v2, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 67
    .line 68
    iget-wide v3, v2, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 69
    .line 70
    const-wide/16 v5, 0x0

    .line 71
    .line 72
    cmpl-double v3, v3, v5

    .line 73
    .line 74
    if-nez v3, :cond_0

    .line 75
    .line 76
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 77
    .line 78
    cmpl-double v2, v2, v5

    .line 79
    .line 80
    if-eqz v2, :cond_1

    .line 81
    .line 82
    :cond_0
    iput-object v0, p0, Ll/cxh;->u:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 83
    .line 84
    iget-object v0, p0, Ll/cxh;->f:Lv/VText;

    .line 85
    .line 86
    const/4 v2, 0x0

    .line 87
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/cxh;->f:Lv/VText;

    .line 91
    .line 92
    iget-object v2, p0, Ll/cxh;->u:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 93
    .line 94
    iget-object v2, v2, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    iput-object v1, p0, Ll/cxh;->u:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 101
    .line 102
    iget-object v0, p0, Ll/cxh;->f:Lv/VText;

    .line 103
    .line 104
    const/4 v2, 0x4

    .line 105
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 106
    .line 107
    .line 108
    :goto_0
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 111
    .line 112
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-nez v0, :cond_2

    .line 119
    .line 120
    iget-object v0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 121
    .line 122
    iget-object v2, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 123
    .line 124
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 125
    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 132
    .line 133
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 142
    .line 143
    .line 144
    :cond_2
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 145
    .line 146
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 147
    .line 148
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_3

    .line 153
    .line 154
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 155
    .line 156
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 157
    .line 158
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 159
    .line 160
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-lez v0, :cond_3

    .line 165
    .line 166
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 167
    .line 168
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->k:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 169
    .line 170
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 171
    .line 172
    check-cast v0, Ljava/util/ArrayList;

    .line 173
    .line 174
    invoke-virtual {p0, v0}, Ll/cxh;->U(Ljava/util/ArrayList;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_3
    iput-object v1, p0, Ll/cxh;->v:Lcom/p1/mobile/putong/data/Media;

    .line 179
    .line 180
    iget-object p0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 181
    .line 182
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->e2()Landroid/graphics/drawable/GradientDrawable;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->o2(Landroid/graphics/drawable/GradientDrawable;)V

    .line 187
    .line 188
    .line 189
    :cond_4
    return-void
.end method

.method private Z(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cxh;->s:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cxh;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    neg-int p1, p1

    .line 6
    int-to-float p1, p1

    .line 7
    const/4 v1, 0x1

    .line 8
    new-array v2, v1, [F

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    aput p1, v2, v3

    .line 12
    .line 13
    const-string p1, "translationY"

    .line 14
    .line 15
    invoke-static {p0, p1, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    filled-new-array {p0}, [Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-wide/16 v2, 0x122

    .line 24
    .line 25
    invoke-static {v1, v0, v2, v3, p0}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic a(Ll/cxh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cxh;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/cxh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cxh;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/cxh;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cxh;->E()V

    return-void
.end method

.method public static synthetic d(Ll/cxh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cxh;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/cxh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cxh;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/cxh;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cxh;->L(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic i(Ll/cxh;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cxh;->O()V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    const-string p0, "\u5f00\u542f\u5b9a\u4f4d\u670d\u52a1\uff0c\u83b7\u53d6\u7cbe\u51c6\u5b9a\u4f4d"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic k(Ll/cxh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cxh;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/cxh;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cxh;->M(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method

.method public static synthetic m(Ll/cxh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cxh;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/cxh;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cxh;->P()V

    return-void
.end method

.method public static synthetic p(Ll/cxh;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cxh;->C(I)V

    return-void
.end method

.method public static synthetic q(Ll/cxh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cxh;->J(Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cxh;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    const v2, 0x3faf4b80

    .line 15
    .line 16
    .line 17
    mul-float/2addr v1, v2

    .line 18
    float-to-int v1, v1

    .line 19
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 20
    .line 21
    iget-object v1, p0, Ll/cxh;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/cxh;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 27
    .line 28
    new-instance v1, Ll/pkh;

    .line 29
    .line 30
    const/high16 v2, 0x41c00000    # 24.0f

    .line 31
    .line 32
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    int-to-float v2, v2

    .line 37
    invoke-direct {v1, v2}, Ll/pkh;-><init>(F)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/cxh;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-virtual {v0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/cxh;->v()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 53
    .line 54
    new-instance v1, Ll/mwh;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/mwh;-><init>(Ll/cxh;)V

    .line 57
    .line 58
    .line 59
    const-wide/16 v2, 0xc8

    .line 60
    .line 61
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/cmg;->E()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_0

    .line 69
    .line 70
    iget-object v0, p0, Ll/cxh;->l:Lv/VImage;

    .line 71
    .line 72
    const/4 v1, 0x0

    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/cxh;->m:Lv/VImage;

    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/cxh;->n:Lv/VImage;

    .line 82
    .line 83
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    :cond_0
    return-void
.end method

.method private y()Landroid/graphics/drawable/GradientDrawable;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/k9c0;->a:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v2, Ll/k9c0;->a:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget-object p0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget v2, Ll/k9c0;->a:I

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    filled-new-array {v0, v1, p0}, [I

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 42
    .line 43
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 44
    .line 45
    invoke-direct {v0, v1, p0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 46
    .line 47
    .line 48
    const/high16 p0, 0x41c00000    # 24.0f

    .line 49
    .line 50
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    int-to-float v1, v1

    .line 55
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    int-to-float v2, v2

    .line 60
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    int-to-float v3, v3

    .line 65
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    int-to-float p0, p0

    .line 70
    const/16 v4, 0x8

    .line 71
    .line 72
    new-array v4, v4, [F

    .line 73
    .line 74
    const/4 v5, 0x0

    .line 75
    aput v1, v4, v5

    .line 76
    .line 77
    const/4 v1, 0x1

    .line 78
    aput v2, v4, v1

    .line 79
    .line 80
    const/4 v1, 0x2

    .line 81
    aput v3, v4, v1

    .line 82
    .line 83
    const/4 v1, 0x3

    .line 84
    aput p0, v4, v1

    .line 85
    .line 86
    const/4 p0, 0x4

    .line 87
    const/4 v1, 0x0

    .line 88
    aput v1, v4, p0

    .line 89
    .line 90
    const/4 p0, 0x5

    .line 91
    aput v1, v4, p0

    .line 92
    .line 93
    const/4 p0, 0x6

    .line 94
    aput v1, v4, p0

    .line 95
    .line 96
    const/4 p0, 0x7

    .line 97
    aput v1, v4, p0

    .line 98
    .line 99
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 100
    .line 101
    .line 102
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 105
    .line 106
    .line 107
    return-object v0
.end method


# virtual methods
.method public final B(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cxh;->a:Lv/VRelative;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    const v1, 0x44418000    # 774.0f

    .line 9
    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    int-to-float v1, v1

    .line 16
    div-float/2addr v0, v1

    .line 17
    const/high16 v1, 0x42a60000    # 83.0f

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v1, v1

    .line 24
    mul-float/2addr v1, v0

    .line 25
    float-to-int v1, v1

    .line 26
    iget-object v2, p0, Ll/cxh;->e:Lv/VRelative;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 33
    .line 34
    add-int/2addr p1, v1

    .line 35
    iput p1, v2, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 36
    .line 37
    iget-object p1, p0, Ll/cxh;->e:Lv/VRelative;

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/cxh;->g:Lv/VEditText;

    .line 43
    .line 44
    const/16 v1, 0x14

    .line 45
    .line 46
    invoke-virtual {p0, p1, v0, v1}, Ll/cxh;->X(Landroid/view/View;FI)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/cxh;->h:Lv/VText;

    .line 50
    .line 51
    const/16 v1, 0x3b

    .line 52
    .line 53
    invoke-virtual {p0, p1, v0, v1}, Ll/cxh;->X(Landroid/view/View;FI)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/cxh;->j:Lv/VDraweeView;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 63
    .line 64
    const/high16 v1, 0x42d80000    # 108.0f

    .line 65
    .line 66
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    int-to-float v1, v1

    .line 71
    mul-float/2addr v1, v0

    .line 72
    float-to-int v0, v1

    .line 73
    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 74
    .line 75
    iput v0, p1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 76
    .line 77
    iget-object v0, p0, Ll/cxh;->j:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/cxh;->e:Lv/VRelative;

    .line 83
    .line 84
    const/4 p1, 0x0

    .line 85
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic C(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cxh;->B(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic E()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cxh;->Q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic F(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->finish()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->m:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->F2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 9
    .line 10
    iget-object p0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic L(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object p1, p0, Ll/cxh;->f:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x2

    .line 8
    aget-object p1, p1, v0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    return v0

    .line 21
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iget-object v1, p0, Ll/cxh;->f:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget-object v2, p0, Ll/cxh;->f:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    sub-int/2addr v1, v2

    .line 38
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    sub-int/2addr v1, p1

    .line 43
    int-to-float p1, v1

    .line 44
    cmpl-float p1, p2, p1

    .line 45
    .line 46
    if-lez p1, :cond_2

    .line 47
    .line 48
    iget-object p1, p0, Ll/cxh;->f:Lv/VText;

    .line 49
    .line 50
    const/4 p2, 0x4

    .line 51
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Ll/cxh;->u:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 56
    .line 57
    :cond_2
    return v0
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cxh;->S(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const-string p0, "\u7f51\u7edc\u5f02\u5e38"

    .line 10
    .line 11
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/orb0;->I()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object p1, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->m:Ljava/lang/String;

    .line 32
    .line 33
    const-string v0, "source_page"

    .line 34
    .line 35
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    filled-new-array {p1}, [Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v0, "e_set_my_state_post"

    .line 44
    .line 45
    const-string v1, "p_set_my_state_post"

    .line 46
    .line 47
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    new-instance p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 51
    .line 52
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    iput-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 72
    .line 73
    :cond_2
    iget-object v1, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 76
    .line 77
    iput-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 78
    .line 79
    iget-object v1, p0, Ll/cxh;->u:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 80
    .line 81
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_3

    .line 86
    .line 87
    iget-object v1, p0, Ll/cxh;->u:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 88
    .line 89
    iput-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 90
    .line 91
    :cond_3
    new-instance v1, Lcom/p1/mobile/putong/data/TextTheme;

    .line 92
    .line 93
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/TextTheme;-><init>()V

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 97
    .line 98
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 99
    .line 100
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 101
    .line 102
    iput-object v2, v1, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 103
    .line 104
    invoke-static {}, Ll/cmg;->E()Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-eqz v2, :cond_4

    .line 109
    .line 110
    iget-object v2, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 111
    .line 112
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 113
    .line 114
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 115
    .line 116
    iput-object v2, v1, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 117
    .line 118
    :cond_4
    iput-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 119
    .line 120
    iget-object v1, p0, Ll/cxh;->v:Lcom/p1/mobile/putong/data/Media;

    .line 121
    .line 122
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_5

    .line 127
    .line 128
    new-instance v1, Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .line 132
    .line 133
    iget-object v2, p0, Ll/cxh;->v:Lcom/p1/mobile/putong/data/Media;

    .line 134
    .line 135
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    iput-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 139
    .line 140
    :cond_5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-nez v1, :cond_6

    .line 145
    .line 146
    iget-object v1, p0, Ll/cxh;->p:Ll/lwh;

    .line 147
    .line 148
    new-instance v2, Ll/axh;

    .line 149
    .line 150
    invoke-direct {v2, p0, p1}, Ll/axh;-><init>(Ll/cxh;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1, v0, v2}, Ll/lwh;->g0(Ljava/lang/String;Ll/x20;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_6
    invoke-virtual {p0, p1}, Ll/cxh;->S(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public final synthetic O()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 7
    .line 8
    iget-object p0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic P()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 7
    .line 8
    iget-object p0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Q()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 6
    .line 7
    const-string v2, "android.permission.ACCESS_COARSE_LOCATION"

    .line 8
    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/pwh;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/pwh;-><init>(Ll/cxh;)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Ll/qwh;

    .line 33
    .line 34
    invoke-direct {v2}, Ll/qwh;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public R()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    new-instance v1, Ll/nwh;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/nwh;-><init>(Ll/cxh;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0x190

    .line 9
    .line 10
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cxh;->g:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cxh;->p:Ll/lwh;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/lwh;->k0(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->finish()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/data/Emotion;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cxh;->j:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cxh;->h:Lv/VText;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public U(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cxh;->y()Landroid/graphics/drawable/GradientDrawable;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->o2(Landroid/graphics/drawable/GradientDrawable;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/cxh;->c:Landroid/view/View;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    iput-object p1, p0, Ll/cxh;->v:Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    iget-object p1, p0, Ll/cxh;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->setAutoPlay(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/cxh;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 31
    .line 32
    iget-object v1, p0, Ll/cxh;->v:Lcom/p1/mobile/putong/data/Media;

    .line 33
    .line 34
    iget-object p0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 35
    .line 36
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->l:Z

    .line 37
    .line 38
    xor-int/2addr p0, v0

    .line 39
    invoke-virtual {p1, v1, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->f(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 4
    .line 5
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->j:Lcom/p1/mobile/putong/data/Emotion;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 10
    .line 11
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ll/cxh;->T(Lcom/p1/mobile/putong/data/Emotion;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 17
    .line 18
    check-cast v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cxh;->U(Ljava/util/ArrayList;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 34
    .line 35
    iput-object v0, p0, Ll/cxh;->u:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 36
    .line 37
    iget-object v0, p0, Ll/cxh;->f:Lv/VText;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/cxh;->f:Lv/VText;

    .line 44
    .line 45
    iget-object v1, p0, Ll/cxh;->u:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget-object v0, p0, Ll/cxh;->f:Lv/VText;

    .line 54
    .line 55
    const/4 v1, 0x4

    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    iget-object p0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-void
.end method

.method public X(Landroid/view/View;FI)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 6
    .line 7
    int-to-float p3, p3

    .line 8
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    int-to-float p3, p3

    .line 13
    mul-float/2addr p3, p2

    .line 14
    float-to-int p2, p3

    .line 15
    iput p2, p0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public Y()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cxh;->p:Ll/lwh;

    .line 2
    .line 3
    iget-object v0, v0, Ll/lwh;->c:Lcom/p1/mobile/putong/data/DoublePair;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MessageLocation;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/cxh;->u:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 17
    .line 18
    iget-object v1, p0, Ll/cxh;->p:Ll/lwh;

    .line 19
    .line 20
    iget-object v2, v1, Ll/lwh;->a:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v2, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v3, v1, Ll/lwh;->b:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v3, v0, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, v1, Ll/lwh;->c:Lcom/p1/mobile/putong/data/DoublePair;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 31
    .line 32
    iget-object v0, p0, Ll/cxh;->f:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/cxh;->f:Lv/VText;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Ll/cxh;->u:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 46
    .line 47
    iget-object v1, p0, Ll/cxh;->f:Lv/VText;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/cxh;->f:Lv/VText;

    .line 53
    .line 54
    const/4 v0, 0x4

    .line 55
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public h(II)V
    .locals 1

    .line 1
    if-lez p1, :cond_2

    .line 2
    .line 3
    iget-boolean p2, p0, Ll/cxh;->r:Z

    .line 4
    .line 5
    if-nez p2, :cond_2

    .line 6
    .line 7
    iget-object p2, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 8
    .line 9
    invoke-static {p2}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eq p1, p2, :cond_2

    .line 14
    .line 15
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 16
    .line 17
    const/16 v0, 0x1e

    .line 18
    .line 19
    if-lt p2, v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/bnl0;->w0()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    div-int/lit8 p2, p2, 0x2

    .line 26
    .line 27
    if-le p1, p2, :cond_0

    .line 28
    .line 29
    div-int/lit8 p1, p1, 0x2

    .line 30
    .line 31
    :cond_0
    iget-boolean p2, p0, Ll/cxh;->w:Z

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    if-nez p2, :cond_1

    .line 35
    .line 36
    iput-boolean v0, p0, Ll/cxh;->w:Z

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/cxh;->s(I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iput-boolean v0, p0, Ll/cxh;->r:Z

    .line 42
    .line 43
    invoke-direct {p0, p1}, Ll/cxh;->Z(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    if-nez p1, :cond_3

    .line 48
    .line 49
    iget-boolean p1, p0, Ll/cxh;->r:Z

    .line 50
    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    iput-boolean p1, p0, Ll/cxh;->r:Z

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/cxh;->z()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    iget-object p1, p0, Ll/cxh;->e:Lv/VRelative;

    .line 61
    .line 62
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_4

    .line 67
    .line 68
    iget-object p1, p0, Ll/cxh;->a:Lv/VRelative;

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    div-int/lit8 p1, p1, 0x3

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ll/cxh;->B(I)V

    .line 77
    .line 78
    .line 79
    :cond_4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lwh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cxh;->w(Ll/lwh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cxh;->u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/cxh;->r()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/cxh;->A()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/cxh;->W()V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public final s(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cxh;->a:Lv/VRelative;

    .line 2
    .line 3
    new-instance v1, Ll/rwh;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/rwh;-><init>(Ll/cxh;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dxh;->b(Ll/cxh;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public v()V
    .locals 2

    .line 1
    new-instance v0, Ll/f0r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cxh;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ll/f0r;->g(Ll/d0r;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v1, Ll/kqg;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Ll/kqg;-><init>(Ll/f0r;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public w(Ll/lwh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cxh;->p:Ll/lwh;

    .line 2
    .line 3
    return-void
.end method

.method public x()V
    .locals 4

    .line 1
    new-instance v0, Ll/zwh;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zwh;-><init>(Ll/cxh;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/rkh;->a(Ll/x20;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 13
    .line 14
    new-instance v1, Landroid/content/Intent;

    .line 15
    .line 16
    iget-object v2, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 17
    .line 18
    const-class v3, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 19
    .line 20
    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 21
    .line 22
    .line 23
    const/16 v2, 0x2724

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 29
    .line 30
    sget v1, Ll/a8c0;->i:I

    .line 31
    .line 32
    sget v2, Ll/a8c0;->e:I

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/cxh;->q:Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 38
    .line 39
    iget-object p0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public z()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cxh;->s:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cxh;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    new-array v2, v1, [F

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v4, 0x0

    .line 10
    aput v3, v2, v4

    .line 11
    .line 12
    const-string v3, "translationY"

    .line 13
    .line 14
    invoke-static {p0, v3, v2}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    filled-new-array {p0}, [Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-wide/16 v2, 0x186

    .line 23
    .line 24
    invoke-static {v1, v0, v2, v3, p0}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 29
    .line 30
    .line 31
    return-void
.end method
