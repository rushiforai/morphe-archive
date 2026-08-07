.class public Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/view/View;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VDraweeView;

.field public k:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/wgp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/wgp0;->R()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;->h:Lv/VText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;->j:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/p3m0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;->j:Lv/VDraweeView;

    .line 2
    .line 3
    sget-object v0, Ll/zft;->v:Ljava/lang/String;

    .line 4
    .line 5
    const v1, 0x43bb8000    # 375.0f

    .line 6
    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/high16 v2, 0x433a0000    # 186.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const-string v3, "context_livingAct"

    .line 19
    .line 20
    invoke-static {v3, p0, v0, v1, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public k0(I)V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->v:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;->e:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    if-le p1, v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Ll/wgp0;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;->h:Lv/VText;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->title:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;->g:Lv/VDraweeView;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

    .line 16
    .line 17
    sget v2, Ll/qa00;->A:I

    .line 18
    .line 19
    const-string v3, "context_livingAct"

    .line 20
    .line 21
    invoke-static {v3, v0, v1, v2, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;->i:Lv/VText;

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v2, "ID:"

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->publicRoomId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;->k:Lv/VDraweeView;

    .line 46
    .line 47
    new-instance v1, Ll/o3m0;

    .line 48
    .line 49
    invoke-direct {v1, p2}, Ll/o3m0;-><init>(Ll/wgp0;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;->k:Lv/VDraweeView;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelIcon:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v3, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoTitleGradeItem;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
