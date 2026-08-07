.class public Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public g:Lv/VText;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VText;

.field public j:Lv/VLinear;

.field public k:Lv/VDraweeView;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VLinear;

.field public o:Lv/VDraweeView;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VLinear;

.field public s:Lv/VDraweeView;

.field public t:Lv/VText;

.field public u:Lv/VText;

.field public v:Lv/VLinear;

.field public w:Lv/VDraweeView;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "#ffffff"

    .line 5
    .line 6
    invoke-static {p1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->z:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    const-string p1, "#ffffff"

    invoke-static {p1}, Ll/n3d0;->g(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->z:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    const-string p1, "#ffffff"

    invoke-static {p1}, Ll/n3d0;->g(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->z:I

    return-void
.end method

.method public static synthetic h0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->id:I

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic i0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 2
    .line 3
    const/4 p2, 0x2

    .line 4
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic j0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 2
    .line 3
    const/4 p2, 0x3

    .line 4
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic k0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic l0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic m0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final n0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/apx;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final o0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;ZLv/VDraweeView;Lv/VText;Lv/VText;)V
    .locals 2

    .line 1
    const-string v0, "context_single_room"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->icon:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p3, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->name:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->unlocked:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "x"

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->amount:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, ""

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string v0, "\u672a\u83b7\u5f97"

    .line 40
    .line 41
    :goto_0
    invoke-virtual {p5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    const/high16 v0, 0x3f800000    # 1.0f

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->z:I

    .line 50
    .line 51
    invoke-virtual {p4, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 52
    .line 53
    .line 54
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->z:I

    .line 55
    .line 56
    invoke-virtual {p5, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p3, v1}, Lv/VDraweeView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p3, v0}, Landroid/view/View;->setAlpha(F)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->unlocked:Z

    .line 67
    .line 68
    if-eqz p0, :cond_2

    .line 69
    .line 70
    sget p0, Ll/n9c0;->p1:I

    .line 71
    .line 72
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    invoke-virtual {p4, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    .line 78
    .line 79
    sget p0, Ll/n9c0;->p1:I

    .line 80
    .line 81
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    invoke-virtual {p5, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p3, v1}, Lv/VDraweeView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p3, v0}, Landroid/view/View;->setAlpha(F)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    sget p0, Ll/n9c0;->n1:I

    .line 96
    .line 97
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    invoke-virtual {p4, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 102
    .line 103
    .line 104
    sget p0, Ll/n9c0;->n1:I

    .line 105
    .line 106
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    invoke-virtual {p5, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    .line 112
    .line 113
    new-instance p0, Landroid/graphics/ColorMatrix;

    .line 114
    .line 115
    invoke-direct {p0}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 116
    .line 117
    .line 118
    const/4 p1, 0x0

    .line 119
    invoke-virtual {p0, p1}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 120
    .line 121
    .line 122
    new-instance p1, Landroid/graphics/ColorMatrixColorFilter;

    .line 123
    .line 124
    invoke-direct {p1, p0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p3, p1}, Lv/VDraweeView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 128
    .line 129
    .line 130
    const p0, 0x3f333333    # 0.7f

    .line 131
    .line 132
    .line 133
    invoke-virtual {p3, p0}, Landroid/view/View;->setAlpha(F)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->n0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;ZLl/y20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;",
            "Z",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/16 v1, 0x8

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->cardColor:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v2, v1}, Ll/n3d0;->c(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    :goto_0
    move-object v6, v1

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    const-string v2, "#08ffffff"

    .line 14
    .line 15
    invoke-static {v2, v1}, Ll/n3d0;->c(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    goto :goto_0

    .line 20
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_4

    .line 27
    .line 28
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->k:Lv/VDraweeView;

    .line 46
    .line 47
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->l:Lv/VText;

    .line 48
    .line 49
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->m:Lv/VText;

    .line 50
    .line 51
    move-object v0, p0

    .line 52
    move v2, p2

    .line 53
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;ZLv/VDraweeView;Lv/VText;Lv/VText;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->j:Lv/VLinear;

    .line 57
    .line 58
    new-instance v2, Ll/wox;

    .line 59
    .line 60
    invoke-direct {v2, p3, p1}, Ll/wox;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->j:Lv/VLinear;

    .line 67
    .line 68
    invoke-virtual {v1, v6}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 72
    .line 73
    const/4 v2, 0x1

    .line 74
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    if-eqz v1, :cond_2

    .line 79
    .line 80
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    .line 87
    .line 88
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->o:Lv/VDraweeView;

    .line 89
    .line 90
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->p:Lv/VText;

    .line 91
    .line 92
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->q:Lv/VText;

    .line 93
    .line 94
    move-object v0, p0

    .line 95
    move v2, p2

    .line 96
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;ZLv/VDraweeView;Lv/VText;Lv/VText;)V

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->n:Lv/VLinear;

    .line 100
    .line 101
    new-instance v2, Ll/xox;

    .line 102
    .line 103
    invoke-direct {v2, p3, p1}, Ll/xox;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->n:Lv/VLinear;

    .line 110
    .line 111
    invoke-virtual {v1, v6}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 112
    .line 113
    .line 114
    :cond_2
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 115
    .line 116
    const/4 v2, 0x2

    .line 117
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    if-eqz v1, :cond_3

    .line 122
    .line 123
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 124
    .line 125
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    .line 130
    .line 131
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->s:Lv/VDraweeView;

    .line 132
    .line 133
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->t:Lv/VText;

    .line 134
    .line 135
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->u:Lv/VText;

    .line 136
    .line 137
    move-object v0, p0

    .line 138
    move v2, p2

    .line 139
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;ZLv/VDraweeView;Lv/VText;Lv/VText;)V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->r:Lv/VLinear;

    .line 143
    .line 144
    new-instance v2, Ll/yox;

    .line 145
    .line 146
    invoke-direct {v2, p3, p1}, Ll/yox;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 150
    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->r:Lv/VLinear;

    .line 153
    .line 154
    invoke-virtual {v1, v6}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 155
    .line 156
    .line 157
    :cond_3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 158
    .line 159
    const/4 v2, 0x3

    .line 160
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    if-eqz v1, :cond_4

    .line 165
    .line 166
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->gifts:Ljava/util/List;

    .line 167
    .line 168
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    .line 173
    .line 174
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->w:Lv/VDraweeView;

    .line 175
    .line 176
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->x:Lv/VText;

    .line 177
    .line 178
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->y:Lv/VText;

    .line 179
    .line 180
    move-object v0, p0

    .line 181
    move v2, p2

    .line 182
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;ZLv/VDraweeView;Lv/VText;Lv/VText;)V

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->v:Lv/VLinear;

    .line 186
    .line 187
    new-instance v2, Ll/zox;

    .line 188
    .line 189
    invoke-direct {v2, p3, p1}, Ll/zox;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;)V

    .line 190
    .line 191
    .line 192
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->v:Lv/VLinear;

    .line 196
    .line 197
    invoke-virtual {v0, v6}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 198
    .line 199
    .line 200
    :cond_4
    return-void
.end method

.method public final q0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->g:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    const/4 v4, -0x1

    .line 30
    sparse-switch v3, :sswitch_data_0

    .line 31
    .line 32
    .line 33
    :goto_0
    move v2, v4

    .line 34
    goto :goto_1

    .line 35
    :sswitch_0
    const-string v0, "unlocked"

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 v2, 0x2

    .line 45
    goto :goto_1

    .line 46
    :sswitch_1
    const-string v2, "rewarded"

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    move v2, v0

    .line 56
    goto :goto_1

    .line 57
    :sswitch_2
    const-string v0, "locked"

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    :goto_1
    const/4 v0, 0x0

    .line 67
    packed-switch v2, :pswitch_data_0

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :pswitch_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->g:Lv/VText;

    .line 72
    .line 73
    const-string v1, "\u9886\u53d6"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->g:Lv/VText;

    .line 79
    .line 80
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->z:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->g:Lv/VText;

    .line 86
    .line 87
    new-instance v0, Ll/vox;

    .line 88
    .line 89
    invoke-direct {v0, p2, p1}, Ll/vox;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :pswitch_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->g:Lv/VText;

    .line 97
    .line 98
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->g:Lv/VText;

    .line 102
    .line 103
    const-string p2, "\u5df2\u9886\u53d6"

    .line 104
    .line 105
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->g:Lv/VText;

    .line 109
    .line 110
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->z:I

    .line 111
    .line 112
    const-string p2, "66"

    .line 113
    .line 114
    invoke-static {p0, p2}, Ll/n3d0;->j(ILjava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {p0}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :pswitch_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->g:Lv/VText;

    .line 127
    .line 128
    const-string p2, "\u672a\u70b9\u4eae"

    .line 129
    .line 130
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->g:Lv/VText;

    .line 134
    .line 135
    sget p2, Ll/n9c0;->m1:I

    .line 136
    .line 137
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->g:Lv/VText;

    .line 145
    .line 146
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    nop

    .line 151
    :sswitch_data_0
    .sparse-switch
        -0x4169ccf6 -> :sswitch_2
        -0xe47b3f2 -> :sswitch_1
        -0xc92d51d -> :sswitch_0
    .end sparse-switch

    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public r0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;Ll/y20;Ll/y20;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->bgPicUrl:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "context_single_room"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;->staticUrl:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v3, 0x1

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->e:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->e:Lv/VDraweeView;

    .line 33
    .line 34
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 35
    .line 36
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;->staticUrl:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v2, v0, v4}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;->dynamicUrl:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->e:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 58
    .line 59
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 63
    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->headerUrl:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;->dynamicUrl:Ljava/lang/String;

    .line 67
    .line 68
    const/4 v4, -0x1

    .line 69
    invoke-virtual {v0, v2, v4}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    :cond_1
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->textColor:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v0}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->z:I

    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->h:Landroid/widget/TextView;

    .line 81
    .line 82
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->title:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->i:Lv/VText;

    .line 88
    .line 89
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->subTitle:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 95
    .line 96
    const-string v2, "unlocked"

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_2

    .line 103
    .line 104
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 105
    .line 106
    const-string v2, "rewarded"

    .line 107
    .line 108
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_2

    .line 113
    .line 114
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;->status:Ljava/lang/String;

    .line 115
    .line 116
    const-string v2, ""

    .line 117
    .line 118
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_3

    .line 123
    .line 124
    :cond_2
    move v1, v3

    .line 125
    :cond_3
    if-eqz v1, :cond_4

    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->e:Lv/VDraweeView;

    .line 128
    .line 129
    const/4 v2, 0x0

    .line 130
    invoke-virtual {v0, v2}, Lv/VDraweeView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->e:Lv/VDraweeView;

    .line 134
    .line 135
    const/high16 v2, 0x3f800000    # 1.0f

    .line 136
    .line 137
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->h:Landroid/widget/TextView;

    .line 141
    .line 142
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->z:I

    .line 143
    .line 144
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->i:Lv/VText;

    .line 148
    .line 149
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->z:I

    .line 150
    .line 151
    const-string v3, "80"

    .line 152
    .line 153
    invoke-static {v2, v3}, Ll/n3d0;->j(ILjava/lang/String;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v2

    .line 161
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 162
    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_4
    new-instance v0, Landroid/graphics/ColorMatrix;

    .line 166
    .line 167
    invoke-direct {v0}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 168
    .line 169
    .line 170
    const/4 v2, 0x0

    .line 171
    invoke-virtual {v0, v2}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 172
    .line 173
    .line 174
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->e:Lv/VDraweeView;

    .line 175
    .line 176
    new-instance v3, Landroid/graphics/ColorMatrixColorFilter;

    .line 177
    .line 178
    invoke-direct {v3, v0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v2, v3}, Lv/VDraweeView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->e:Lv/VDraweeView;

    .line 185
    .line 186
    const v2, 0x3f333333    # 0.7f

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->h:Landroid/widget/TextView;

    .line 193
    .line 194
    sget v2, Ll/n9c0;->w1:I

    .line 195
    .line 196
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->i:Lv/VText;

    .line 204
    .line 205
    sget v2, Ll/n9c0;->n1:I

    .line 206
    .line 207
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 212
    .line 213
    .line 214
    :goto_1
    new-instance v0, Ll/uox;

    .line 215
    .line 216
    invoke-direct {v0, p4, p1}, Ll/uox;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;)V

    .line 217
    .line 218
    .line 219
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;Ll/y20;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0, p1, v1, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;ZLl/y20;)V

    .line 226
    .line 227
    .line 228
    return-void
.end method
