.class public Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerFrag;
.super Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public E5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->T:Ll/iwi;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/zmm;

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
    invoke-direct {v0, v1, v2}, Ll/zmm;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->T:Ll/iwi;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public Y5()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Y5()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->z:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->R:Landroid/widget/TextView;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->R:Landroid/widget/TextView;

    .line 21
    .line 22
    const v2, 0x26ffffff

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/view/View;->setSelected(Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    const/4 v0, 0x1

    .line 45
    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->R:Landroid/widget/TextView;

    .line 49
    .line 50
    const v2, -0x19000001

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroid/view/View;->setSelected(Z)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->I:Landroid/widget/RelativeLayout;

    .line 5
    .line 6
    sget v0, Ll/dbc0;->L8:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->I:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    sget v0, Ll/dbc0;->L8:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->J:Landroid/widget/ImageView;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->K:Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Ll/c9c0;->y1:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->L:Landroid/widget/ImageView;

    .line 40
    .line 41
    const/16 v0, 0xff

    .line 42
    .line 43
    invoke-static {v0, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->N:Landroid/widget/FrameLayout;

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->P:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/folder/FolderSelectView;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/folder/FolderSelectView;->a:Lv/VRecyclerView;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget v1, Ll/c9c0;->V:I

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Q:Landroid/widget/RelativeLayout;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    sget v1, Ll/c9c0;->V:I

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->Q:Landroid/widget/RelativeLayout;

    .line 89
    .line 90
    const/high16 v0, 0x42840000    # 66.0f

    .line 91
    .line 92
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->S:Lv/VButton;

    .line 100
    .line 101
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    sget v0, Ll/dbc0;->O8:I

    .line 106
    .line 107
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
