.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public A:Lcom/tantan/library/svga/SVGAnimationView;

.field public B:Landroid/view/View;

.field public C:Lv/VDraweeView;

.field public D:Lv/VDraweeView;

.field public E:Landroid/widget/TextView;

.field public F:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;

.field public G:Ll/xrs;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VImage;

.field public f:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public g:Lv/VDraweeView;

.field public h:Landroid/view/View;

.field public i:Lcom/tantan/library/svga/SVGAnimationView;

.field public j:Landroid/view/View;

.field public k:Lv/VDraweeView;

.field public l:Lv/VDraweeView;

.field public m:Landroid/widget/TextView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;

.field public o:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public p:Lv/VDraweeView;

.field public q:Landroid/view/View;

.field public r:Lcom/tantan/library/svga/SVGAnimationView;

.field public s:Landroid/view/View;

.field public t:Lv/VDraweeView;

.field public u:Lv/VDraweeView;

.field public v:Landroid/widget/TextView;

.field public w:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;

.field public x:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public y:Lv/VDraweeView;

.field public z:Landroid/view/View;


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

.method public static synthetic h0(Ll/xrs;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->category:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xrs;->Y3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->m0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->namedUserId:Ljava/lang/String;

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


# virtual methods
.method public final l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sos;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->G:Ll/xrs;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->gifts:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/xrs;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->G:Ll/xrs;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xrs;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;Ll/xrs;)V
    .locals 12
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->G:Ll/xrs;

    .line 2
    .line 3
    new-instance v3, Ll/oos;

    .line 4
    .line 5
    invoke-direct {v3, p2, p1}, Ll/oos;-><init>(Ll/xrs;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->d:Landroid/widget/TextView;

    .line 12
    .line 13
    new-instance v3, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->category:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 19
    .line 20
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->name:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v4, "("

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->tab:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallTab;

    .line 31
    .line 32
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallTab;->progress:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallProgress;

    .line 33
    .line 34
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallProgress;->current:I

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v4, "/"

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->tab:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallTab;

    .line 45
    .line 46
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallTab;->progress:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallProgress;

    .line 47
    .line 48
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallProgress;->total:I

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v4, ")"

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;)V

    .line 66
    .line 67
    .line 68
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->g:Lv/VDraweeView;

    .line 69
    .line 70
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->l:Lv/VDraweeView;

    .line 71
    .line 72
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->k:Lv/VDraweeView;

    .line 73
    .line 74
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->j:Landroid/view/View;

    .line 75
    .line 76
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->m:Landroid/widget/TextView;

    .line 77
    .line 78
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;

    .line 79
    .line 80
    iget-object v9, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 81
    .line 82
    iget-object v10, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->h:Landroid/view/View;

    .line 83
    .line 84
    iget-object v11, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 85
    .line 86
    const/4 v2, 0x0

    .line 87
    move-object v0, p0

    .line 88
    move-object v1, p1

    .line 89
    invoke-virtual/range {v0 .. v11}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;ILv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Landroid/view/View;Landroid/widget/TextView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Landroid/view/View;)V

    .line 90
    .line 91
    .line 92
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->p:Lv/VDraweeView;

    .line 93
    .line 94
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->u:Lv/VDraweeView;

    .line 95
    .line 96
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->t:Lv/VDraweeView;

    .line 97
    .line 98
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->s:Landroid/view/View;

    .line 99
    .line 100
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->v:Landroid/widget/TextView;

    .line 101
    .line 102
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->w:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;

    .line 103
    .line 104
    iget-object v9, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->r:Lcom/tantan/library/svga/SVGAnimationView;

    .line 105
    .line 106
    iget-object v10, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->q:Landroid/view/View;

    .line 107
    .line 108
    iget-object v11, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->o:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 109
    .line 110
    const/4 v2, 0x1

    .line 111
    invoke-virtual/range {v0 .. v11}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;ILv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Landroid/view/View;Landroid/widget/TextView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Landroid/view/View;)V

    .line 112
    .line 113
    .line 114
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->y:Lv/VDraweeView;

    .line 115
    .line 116
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->D:Lv/VDraweeView;

    .line 117
    .line 118
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->C:Lv/VDraweeView;

    .line 119
    .line 120
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->B:Landroid/view/View;

    .line 121
    .line 122
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->E:Landroid/widget/TextView;

    .line 123
    .line 124
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->F:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;

    .line 125
    .line 126
    iget-object v9, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->A:Lcom/tantan/library/svga/SVGAnimationView;

    .line 127
    .line 128
    iget-object v10, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->z:Landroid/view/View;

    .line 129
    .line 130
    iget-object v11, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->x:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 131
    .line 132
    const/4 v2, 0x2

    .line 133
    invoke-virtual/range {v0 .. v11}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;ILv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Landroid/view/View;Landroid/widget/TextView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Landroid/view/View;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->o:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->x:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->k:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->t:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->C:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->r:Lcom/tantan/library/svga/SVGAnimationView;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->A:Lcom/tantan/library/svga/SVGAnimationView;

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->l0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->gifts:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "context_livingAct"

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 13
    .line 14
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->g:Lv/VDraweeView;

    .line 18
    .line 19
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->category:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 20
    .line 21
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->cardBgUrl:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v0, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->gifts:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-le v0, v2, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->o:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 35
    .line 36
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->p:Lv/VDraweeView;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->category:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 42
    .line 43
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->cardBgUrl:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, v0, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->gifts:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const/4 v3, 0x2

    .line 55
    if-le v0, v3, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->x:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 58
    .line 59
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;->y:Lv/VDraweeView;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->category:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->cardBgUrl:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v1, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method public final q0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;ILv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Landroid/view/View;Landroid/widget/TextView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->gifts:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-le v0, p2, :cond_8

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {p11, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    new-instance p11, Ll/pos;

    .line 15
    .line 16
    invoke-direct {p11, p0, p1, p2}, Ll/pos;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;I)V

    .line 17
    .line 18
    .line 19
    invoke-static {p3, p11}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->gifts:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 29
    .line 30
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->users:Ljava/util/List;

    .line 31
    .line 32
    new-instance p11, Ll/qos;

    .line 33
    .line 34
    invoke-direct {p11, p2}, Ll/qos;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p3, p11}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;

    .line 42
    .line 43
    iget-object p11, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->category:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 44
    .line 45
    iget-object p11, p11, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->avatarBorderColor:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p11

    .line 51
    if-nez p11, :cond_0

    .line 52
    .line 53
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p11

    .line 57
    if-eqz p11, :cond_0

    .line 58
    .line 59
    move p11, v0

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    move p11, v1

    .line 62
    :goto_0
    invoke-static {p6, p11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    if-eqz p11, :cond_1

    .line 66
    .line 67
    iget-object p11, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->category:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 68
    .line 69
    iget-object p11, p11, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->avatarBorderColor:Ljava/lang/String;

    .line 70
    .line 71
    const/16 v2, 0x1e

    .line 72
    .line 73
    invoke-static {p11, v2}, Ll/n3d0;->c(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    .line 74
    .line 75
    .line 76
    move-result-object p11

    .line 77
    invoke-virtual {p6, p11}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p6

    .line 84
    invoke-static {p5, p6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p6

    .line 91
    const-string p11, "context_livingAct"

    .line 92
    .line 93
    if-eqz p6, :cond_2

    .line 94
    .line 95
    iget-object p6, p3, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;->avatar:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {p11, p5, p6}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    new-instance p6, Ll/ros;

    .line 101
    .line 102
    invoke-direct {p6, p0, p3}, Ll/ros;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallGiftListItemView;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)V

    .line 103
    .line 104
    .line 105
    invoke-static {p5, p6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->icon:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {p11, p4, p3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->name:Ljava/lang/String;

    .line 114
    .line 115
    const/4 p5, 0x5

    .line 116
    invoke-static {p3, p5}, Ll/xau;->s(Ljava/lang/String;I)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-virtual {p7, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    iget p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->grade:I

    .line 124
    .line 125
    invoke-virtual {p8, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;->j0(I)V

    .line 126
    .line 127
    .line 128
    iget p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->grade:I

    .line 129
    .line 130
    if-lez p3, :cond_3

    .line 131
    .line 132
    move p3, v0

    .line 133
    goto :goto_1

    .line 134
    :cond_3
    move p3, v1

    .line 135
    :goto_1
    invoke-static {p8, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iget p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->grade:I

    .line 139
    .line 140
    if-gtz p3, :cond_4

    .line 141
    .line 142
    move p3, v0

    .line 143
    goto :goto_2

    .line 144
    :cond_4
    move p3, v1

    .line 145
    :goto_2
    invoke-static {p10, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->grade:I

    .line 149
    .line 150
    if-gtz p3, :cond_5

    .line 151
    .line 152
    move p3, v0

    .line 153
    goto :goto_3

    .line 154
    :cond_5
    move p3, v1

    .line 155
    :goto_3
    invoke-static {p4, p3}, Ll/n3d0;->i(Lv/VDraweeView;Z)V

    .line 156
    .line 157
    .line 158
    iget p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->grade:I

    .line 159
    .line 160
    if-lez p3, :cond_6

    .line 161
    .line 162
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->category:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 163
    .line 164
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->cardBgSvgaUrl:Ljava/lang/String;

    .line 165
    .line 166
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 167
    .line 168
    .line 169
    move-result p3

    .line 170
    if-nez p3, :cond_6

    .line 171
    .line 172
    move v1, v0

    .line 173
    :cond_6
    invoke-static {p9, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->grade:I

    .line 177
    .line 178
    if-lez p2, :cond_7

    .line 179
    .line 180
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->category:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 181
    .line 182
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->cardBgSvgaUrl:Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    if-nez p2, :cond_7

    .line 189
    .line 190
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-static {p0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftList;->category:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 199
    .line 200
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->cardBgSvgaUrl:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    const/4 p1, -0x1

    .line 207
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-virtual {p0, p9}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 212
    .line 213
    .line 214
    :cond_7
    return-void

    .line 215
    :cond_8
    invoke-static {p11, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 216
    .line 217
    .line 218
    return-void
.end method
