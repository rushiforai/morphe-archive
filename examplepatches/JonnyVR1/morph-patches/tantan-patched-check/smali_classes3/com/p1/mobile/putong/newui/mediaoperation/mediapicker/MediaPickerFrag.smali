.class public Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;
.super Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;
.source "SourceFile"


# instance fields
.field public I:Landroid/widget/RelativeLayout;

.field public J:Landroid/widget/ImageView;

.field public K:Landroid/widget/TextView;

.field public L:Landroid/widget/ImageView;

.field public M:Lv/VLinear;

.field public N:Landroid/widget/FrameLayout;

.field public O:Lv/VRecyclerView;

.field public P:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/folder/FolderSelectView;

.field public Q:Landroid/widget/RelativeLayout;

.field public R:Landroid/widget/TextView;

.field public S:Lv/VButton;

.field public T:Ll/iwi;

.field public U:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Ll/ewi;",
            ">;"
        }
    .end annotation
.end field

.field public V:Ljava/lang/String;

.field public W:Ll/qyx;

.field public X:Ll/wzx;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->U:Ll/vg60;

    .line 9
    .line 10
    return-void
.end method

.method private G5()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->J:Landroid/widget/ImageView;

    .line 2
    .line 3
    new-instance v1, Ll/tyx;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/tyx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Q:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    new-instance v1, Ll/ezx;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/ezx;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->isRadio()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const/16 v0, 0x8

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance v0, Ll/hzx;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/hzx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->K:Landroid/widget/TextView;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->L:Landroid/widget/ImageView;

    .line 48
    .line 49
    const/4 v2, 0x2

    .line 50
    new-array v2, v2, [Landroid/view/View;

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    aput-object v0, v2, v3

    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    aput-object v1, v2, v0

    .line 57
    .line 58
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/izx;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/izx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->P:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/folder/FolderSelectView;

    .line 71
    .line 72
    new-instance v1, Ll/jzx;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/jzx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method private synthetic J5(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic K5(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->A5()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->M4()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic L5(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->d6()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->P:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/folder/FolderSelectView;

    .line 5
    .line 6
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->B5()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->j6()V

    .line 17
    .line 18
    .line 19
    :goto_0
    const-string p0, "e_album_list"

    .line 20
    .line 21
    const-string p1, "p_camera_local_album"

    .line 22
    .line 23
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private synthetic M5(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/xyx;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/xyx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private synthetic Q5(Ll/ewi;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/ewi;->b:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->V:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private Z5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->B:Ll/jh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jh0;->I()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic c5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->K5(Landroid/view/View;)V

    return-void
.end method

.method private c6()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->K:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedFolder:Ll/ewi;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, Lcom/p1/mobile/putong/common/R$string;->Z:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v1, v1, Ll/ewi;->a:Ljava/lang/String;

    .line 21
    .line 22
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 26
    .line 27
    iget-object v1, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedFolder:Ll/ewi;

    .line 28
    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    iget-object v0, v1, Ll/ewi;->c:Ll/vg60;

    .line 35
    .line 36
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->B:Ll/jh0;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/jh0;->J(Ll/vg60;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic d5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->T5(Ll/vg60;)V

    return-void
.end method

.method public static synthetic e5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Ll/ewi;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->V5(Ll/ewi;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private e6()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->U:Ll/vg60;

    .line 4
    .line 5
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    new-instance v2, Ll/fzx;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/fzx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/ewi;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->setSelectedFolder(Ll/ewi;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->c6()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic f5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->J5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->M5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->O5()V

    return-void
.end method

.method public static synthetic i5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->W5(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic j5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->R5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k5(Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private k6()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->K:Landroid/widget/TextView;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedFolder:Ll/ewi;

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget v1, Lcom/p1/mobile/putong/common/R$string;->Z:I

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object p0, v1, Ll/ewi;->a:Ljava/lang/String;

    .line 28
    .line 29
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic l5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Ll/bvx;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S5(Ll/bvx;Ljava/util/List;)V

    return-void
.end method

.method private l6()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->U:Ll/vg60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    new-instance v1, Ll/gzx;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/gzx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/ewi;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedFolder:Ll/ewi;

    .line 19
    .line 20
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedFolder:Ll/ewi;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ll/ewi;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->setSelectedFolder(Ll/ewi;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->k6()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic m5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->U5()V

    return-void
.end method

.method public static synthetic n5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->L5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o5()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/a;->h(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic p5(Ljava/util/List;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    new-instance v1, Ll/dzx;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/dzx;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static synthetic q5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Ll/ewi;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Q5(Ll/ewi;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r5(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s5(Ljava/lang/String;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic t5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->P5(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic u5(Ll/v2i0;)Ll/ewi;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ewi;->b(Ll/v2i0;)Ll/ewi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic v5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->C5()V

    return-void
.end method

.method public static synthetic w5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->N5(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A5()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final B5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->P:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/folder/FolderSelectView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->L:Landroid/widget/ImageView;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setRotation(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public C()Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    return-object p0
.end method

.method public final C5()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_3

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    new-instance v1, Ll/bvx;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const/4 v5, 0x1

    .line 31
    const/16 v6, 0x50

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    const/4 v4, 0x1

    .line 35
    invoke-direct/range {v1 .. v6}, Ll/bvx;-><init>(Landroid/content/Context;ZZZI)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 39
    .line 40
    iget-object v2, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->videoPickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 41
    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/bvx;->t()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->imagePickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 50
    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/bvx;->u()Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    goto :goto_0

    .line 58
    :cond_2
    invoke-virtual {v1}, Ll/bvx;->r()Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->g6(Ll/bvx;Lrx/c;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->h6(Lrx/c;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const/4 v0, 0x0

    .line 77
    const/4 v2, 0x0

    .line 78
    invoke-virtual {p0, v0, v2, v1}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 79
    .line 80
    .line 81
    :cond_3
    :goto_1
    return-void
.end method

.method public D5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->alreadySelectedImages:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->I5(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 11
    .line 12
    iget-object v1, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->selectedFolderPath:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->V:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->imagePickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 21
    .line 22
    iget v1, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->imageCropProportion:F

    .line 23
    .line 24
    iput v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->imageCropProportion:F

    .line 25
    .line 26
    iget v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->imageCropWidth:I

    .line 27
    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->imageCropWidth:I

    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public E5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->T:Ll/iwi;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/iwi;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ll/iwi;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->T:Ll/iwi;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final F5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->initialShowSelectFold:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->j6()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->B5()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public H5(Landroid/os/Bundle;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;
    .locals 0

    .line 1
    const-string p0, "params_object"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 8
    .line 9
    return-object p0
.end method

.method public final I5(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->clearAllSelectedMedia()V

    .line 11
    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->addSelectedMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->m6()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic N5(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->B5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic O5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->U:Ll/vg60;

    .line 11
    .line 12
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->C5()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic P5(Landroid/os/Bundle;)V
    .locals 12

    .line 1
    invoke-static {}, Ll/wzx;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    new-instance v2, Ll/wzx;

    .line 10
    .line 11
    invoke-direct {v2}, Ll/wzx;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->X:Ll/wzx;

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 17
    .line 18
    iget-object v3, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->videoPickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 19
    .line 20
    if-nez v3, :cond_0

    .line 21
    .line 22
    move v6, v0

    .line 23
    move v5, v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->imagePickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    move v5, v0

    .line 30
    move v6, v1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    move v5, v1

    .line 33
    move v6, v5

    .line 34
    :goto_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget-object v4, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->M:Lv/VLinear;

    .line 39
    .line 40
    new-instance v7, Ll/vyx;

    .line 41
    .line 42
    invoke-direct {v7, p0}, Ll/vyx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 43
    .line 44
    .line 45
    const/4 v10, 0x0

    .line 46
    const/4 v11, 0x0

    .line 47
    const/4 v8, 0x0

    .line 48
    const/4 v9, 0x0

    .line 49
    invoke-virtual/range {v2 .. v11}, Ll/wzx;->e(Landroid/app/Activity;Landroid/view/View;ZZLl/x20;Ll/y20;Ll/l6e;Ll/k6e;Ll/j6e;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    .line 58
    .line 59
    filled-new-array {v2}, [Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance v0, Ll/wyx;

    .line 76
    .line 77
    invoke-direct {v0, p0}, Ll/wyx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public Q4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Y5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R5(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getFirstMedia()Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->C()Lcom/p1/mobile/android/app/Frag;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->H2(Landroid/content/Context;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->j(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->g(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getCurrentMaxCount(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->f(I)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getFirstMedia()Lcom/p1/mobile/putong/data/Media;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->i(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->a()Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/4 v0, 0x1

    .line 63
    invoke-virtual {p1, p0, v0}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic S5(Ll/bvx;Ljava/util/List;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ll/vg60;

    .line 17
    .line 18
    invoke-direct {v0, p2, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 22
    .line 23
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->B:Ll/jh0;

    .line 24
    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ll/jh0;->J(Ll/vg60;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 36
    .line 37
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 46
    .line 47
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->B:Ll/jh0;

    .line 53
    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    invoke-virtual {v1, v0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 61
    .line 62
    .line 63
    :cond_1
    :goto_0
    iget-boolean p2, p1, Ll/bvx;->g:Z

    .line 64
    .line 65
    if-eqz p2, :cond_2

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-eqz p2, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const/4 p2, 0x0

    .line 86
    invoke-virtual {p0, p2, v2, p1}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 87
    .line 88
    .line 89
    :cond_2
    return-void
.end method

.method public T4(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final synthetic T5(Ll/vg60;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->U:Ll/vg60;

    .line 25
    .line 26
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->U:Ll/vg60;

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->e6()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->U:Ll/vg60;

    .line 41
    .line 42
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 43
    .line 44
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->X5(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->l6()V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 53
    .line 54
    iget-boolean p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->initialShowSelectFold:Z

    .line 55
    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->d6()V

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_1
    return-void
.end method

.method public U4()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->H5(Landroid/os/Bundle;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic U5()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->O:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public V4(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Ll/s0y;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->F:Ll/s0y;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 7
    .line 8
    packed-switch p1, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    :pswitch_0
    goto :goto_0

    .line 12
    :pswitch_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->a5()V

    .line 13
    .line 14
    .line 15
    return-object v1

    .line 16
    :pswitch_2
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/bn5;->A2()Ll/s0y;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :pswitch_3
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 24
    .line 25
    invoke-interface {p0}, Ll/bn5;->d()Ll/s0y;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :pswitch_4
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 31
    .line 32
    invoke-interface {p0}, Ll/bn5;->L0()Ll/s0y;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :pswitch_5
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 38
    .line 39
    invoke-interface {p0}, Ll/bn5;->t2()Ll/s0y;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :pswitch_6
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 45
    .line 46
    invoke-interface {p0}, Ll/bn5;->R0()Ll/s0y;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :pswitch_7
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 52
    .line 53
    invoke-interface {p0}, Ll/bn5;->l5()Ll/s0y;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_0
    :goto_0
    return-object v1

    .line 59
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_6
        :pswitch_0
        :pswitch_3
        :pswitch_6
        :pswitch_7
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public final synthetic V5(Ll/ewi;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/ewi;->b:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->V:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic W5(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 16
    .line 17
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 36
    .line 37
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public X4()Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->O:Lv/VRecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public X5(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ewi;",
            ">;",
            "Ljava/util/List<",
            "Ll/ewi;",
            ">;)",
            "Ljava/util/List<",
            "Ll/ewi;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-lez p0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ge p0, v0, :cond_1

    .line 19
    .line 20
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/ewi;

    .line 25
    .line 26
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-interface {p1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ll/ewi;

    .line 41
    .line 42
    iget v2, v1, Ll/ewi;->d:I

    .line 43
    .line 44
    iget v3, v0, Ll/ewi;->d:I

    .line 45
    .line 46
    add-int/2addr v2, v3

    .line 47
    iput v2, v1, Ll/ewi;->d:I

    .line 48
    .line 49
    invoke-interface {p1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ll/ewi;

    .line 58
    .line 59
    iget-object v1, v1, Ll/ewi;->c:Ll/vg60;

    .line 60
    .line 61
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 62
    .line 63
    iget-object v0, v0, Ll/ewi;->c:Ll/vg60;

    .line 64
    .line 65
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    :goto_1
    add-int/lit8 p0, p0, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    return-object p1
.end method

.method public Y5()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMinImageSelectCount()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-ge v0, v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->R:Landroid/widget/TextView;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->R:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    sget v3, Ll/b9c0;->c:I

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->R:Landroid/widget/TextView;

    .line 65
    .line 66
    const/4 v1, 0x0

    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->R:Landroid/widget/TextView;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    sget v3, Ll/b9c0;->f:I

    .line 81
    .line 82
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 97
    .line 98
    .line 99
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->b6()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public Z4(Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 5

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 7
    .line 8
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {v0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->unCheckMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 21
    .line 22
    new-instance v1, Ll/mzx;

    .line 23
    .line 24
    invoke-direct {v1, p2}, Ll/mzx;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 33
    .line 34
    new-instance v1, Ll/nzx;

    .line 35
    .line 36
    invoke-direct {v1, p2}, Ll/nzx;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 43
    .line 44
    iget-object p2, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-eqz p2, :cond_1

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Z5()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    new-instance p2, Ljava/util/HashMap;

    .line 57
    .line 58
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 59
    .line 60
    .line 61
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 62
    .line 63
    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    const/4 p1, 0x0

    .line 67
    move v0, p1

    .line 68
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 77
    .line 78
    if-ge v0, v1, :cond_4

    .line 79
    .line 80
    iget-object v1, v2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 87
    .line 88
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 89
    .line 90
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 91
    .line 92
    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    iget-object v3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 97
    .line 98
    if-eqz v2, :cond_2

    .line 99
    .line 100
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 101
    .line 102
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    check-cast v2, Ljava/lang/Integer;

    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-eq v0, v2, :cond_3

    .line 113
    .line 114
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 115
    .line 116
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 126
    .line 127
    invoke-interface {p2, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_2
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 132
    .line 133
    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-eqz v2, :cond_3

    .line 138
    .line 139
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 140
    .line 141
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 142
    .line 143
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    check-cast v2, Ljava/lang/Integer;

    .line 148
    .line 149
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-eq v0, v2, :cond_3

    .line 154
    .line 155
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 156
    .line 157
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 167
    .line 168
    invoke-interface {p2, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    :cond_3
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_4
    iget-object v0, v2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedFolder:Ll/ewi;

    .line 175
    .line 176
    if-nez v0, :cond_5

    .line 177
    .line 178
    iget-object v0, v2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_5
    iget-object v0, v0, Ll/ewi;->c:Ll/vg60;

    .line 182
    .line 183
    :goto_3
    iget-object v1, v0, Ll/vg60;->a:Ljava/util/List;

    .line 184
    .line 185
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-ge p1, v1, :cond_8

    .line 190
    .line 191
    iget-object v1, v0, Ll/vg60;->a:Ljava/util/List;

    .line 192
    .line 193
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 198
    .line 199
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 200
    .line 201
    invoke-interface {p2, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v2

    .line 205
    if-eqz v2, :cond_6

    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->B:Ll/jh0;

    .line 208
    .line 209
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 210
    .line 211
    .line 212
    goto :goto_4

    .line 213
    :cond_6
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 214
    .line 215
    invoke-interface {p2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-eqz v1, :cond_7

    .line 220
    .line 221
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->B:Ll/jh0;

    .line 222
    .line 223
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 224
    .line 225
    .line 226
    :cond_7
    :goto_4
    add-int/lit8 p1, p1, 0x1

    .line 227
    .line 228
    goto :goto_3

    .line 229
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 230
    .line 231
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    add-int/lit8 p1, p1, 0x1

    .line 236
    .line 237
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 238
    .line 239
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxVideoSelectCount()I

    .line 240
    .line 241
    .line 242
    move-result p2

    .line 243
    if-eq p1, p2, :cond_a

    .line 244
    .line 245
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 246
    .line 247
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    add-int/lit8 p1, p1, 0x1

    .line 252
    .line 253
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 254
    .line 255
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxImageSelectCount()I

    .line 256
    .line 257
    .line 258
    move-result p2

    .line 259
    if-ne p1, p2, :cond_9

    .line 260
    .line 261
    goto :goto_5

    .line 262
    :cond_9
    return-void

    .line 263
    :cond_a
    :goto_5
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Z5()V

    .line 264
    .line 265
    .line 266
    return-void
.end method

.method public final a6()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->f6()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->b6()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->isRadio()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-ne v0, v1, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->R:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-ne v0, v1, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Q:Landroid/widget/RelativeLayout;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 52
    .line 53
    iget v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 54
    .line 55
    const/16 v2, 0xa

    .line 56
    .line 57
    if-eq v0, v2, :cond_2

    .line 58
    .line 59
    const/16 v2, 0xd

    .line 60
    .line 61
    if-eq v0, v2, :cond_2

    .line 62
    .line 63
    const/16 v2, 0xb

    .line 64
    .line 65
    if-ne v0, v2, :cond_3

    .line 66
    .line 67
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Q:Landroid/widget/RelativeLayout;

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 70
    .line 71
    .line 72
    :cond_3
    return-void
.end method

.method public final b6()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getCurrentCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->submitButtonTitle:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->submitButtonTitle:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getCurrentCount()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v0, "%s %d"

    .line 38
    .line 39
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final d6()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->E5()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->T:Ll/iwi;

    .line 5
    .line 6
    new-instance v1, Ll/azx;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/azx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/iwi;->K(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->P:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/folder/FolderSelectView;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->T:Ll/iwi;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/folder/FolderSelectView;->b(Ll/jic0;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->T:Ll/iwi;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->U:Ll/vg60;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ll/iwi;->J(Ll/vg60;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kzx;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/kzx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/lzx;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/lzx;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final f6()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->needAllSelectedMediaPreview:Z

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->R:Landroid/widget/TextView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->R:Landroid/widget/TextView;

    .line 14
    .line 15
    new-instance v1, Ll/uyx;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/uyx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/16 p0, 0x8

    .line 25
    .line 26
    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->G5()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Y5()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->a6()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->y5()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Z5()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->F5()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final g6(Ll/bvx;Lrx/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bvx;",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance v0, Ll/bzx;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/bzx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Ll/bvx;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final h6(Lrx/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->k:Ll/qcj;

    .line 14
    .line 15
    invoke-static {v0}, Ll/bvx;->n(Ll/qcj;)Lrx/c$d;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/yyx;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/yyx;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance v0, Ll/zyx;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/zyx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public i6(Ll/ewi;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->setSelectedFolder(Ll/ewi;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->c6()V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/czx;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ll/czx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->l4(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->B5()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->T:Ll/iwi;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/iwi;->I()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->x5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {p2, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 13
    .line 14
    iget-boolean p2, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->isNewUIAb:Z

    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->J:Landroid/widget/ImageView;

    .line 19
    .line 20
    sget v0, Ll/cbc0;->b0:I

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->L:Landroid/widget/ImageView;

    .line 26
    .line 27
    sget v0, Ll/cbc0;->v0:I

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->K:Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget v0, Ll/b9c0;->d:I

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-object p1
.end method

.method public final j6()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->P:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/folder/FolderSelectView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->L:Landroid/widget/ImageView;

    .line 8
    .line 9
    const/high16 v0, 0x43340000    # 180.0f

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setRotation(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final m6()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 9
    .line 10
    new-instance v1, Ll/ozx;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/ozx;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Z5()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->D5()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "extra_images"

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    const/4 v2, 0x1

    .line 8
    if-ne p1, v2, :cond_0

    .line 9
    .line 10
    if-ne p2, v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p3, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->I5(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Q4()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->F:Ll/s0y;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->F:Ll/s0y;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 41
    .line 42
    invoke-interface {p1, p2, v0, p0, p3}, Ll/s0y;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Landroid/content/Intent;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    if-ne p1, v2, :cond_1

    .line 47
    .line 48
    const/16 v2, 0x22b

    .line 49
    .line 50
    if-ne p2, v2, :cond_1

    .line 51
    .line 52
    invoke-virtual {p3, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->I5(Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->O4()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    const/16 v0, 0x2710

    .line 66
    .line 67
    if-ne p1, v0, :cond_2

    .line 68
    .line 69
    if-ne p2, v1, :cond_2

    .line 70
    .line 71
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_2

    .line 76
    .line 77
    const-string p1, "camera_images_path"

    .line 78
    .line 79
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eqz p2, :cond_2

    .line 88
    .line 89
    check-cast p1, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-nez p2, :cond_2

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->B:Ll/jh0;

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Ll/jh0;->K(Ljava/util/ArrayList;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    return-void
.end method

.method public q0()Lcom/p1/mobile/putong/data/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getSelectedVideo()Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 8
    .line 9
    return-object p0
.end method

.method public x()Ljava/util/Map;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->A:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public x5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pzx;->b(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final y5()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->z5()Ll/qyx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->W:Ll/qyx;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0, v1}, Ll/qyx;->a(Landroid/content/Context;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {v0, v2, v1}, Landroid/view/View;->measure(II)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->O:Lv/VRecyclerView;

    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    add-int/2addr v1, v3

    .line 43
    invoke-static {v2, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 47
    .line 48
    const/4 v2, -0x1

    .line 49
    const/4 v3, -0x2

    .line 50
    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 51
    .line 52
    .line 53
    const/16 v2, 0x50

    .line 54
    .line 55
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->N:Landroid/widget/FrameLayout;

    .line 58
    .line 59
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    return-void
.end method

.method public z5()Ll/qyx;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 4
    .line 5
    const/4 v0, 0x3

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/bn5;->G2()Ll/qyx;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method
