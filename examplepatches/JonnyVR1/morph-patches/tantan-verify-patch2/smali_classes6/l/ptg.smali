.class public Ll/ptg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:Ll/n570;

.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

.field public b:Landroid/view/View;

.field public c:Lv/VLinear;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

.field public i:Lv/VText;

.field public j:Landroid/widget/FrameLayout;

.field public k:Lv/VText;

.field public l:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VText;

.field public o:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field public p:Lv/VImage;

.field public q:Landroid/view/View;

.field public r:Lcom/p1/mobile/android/app/Act;

.field public s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

.field public t:I

.field public u:I

.field public v:I

.field public w:Lcom/p1/mobile/putong/feed/data/Moment;

.field public x:Ljava/lang/String;

.field public y:Z

.field public z:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/mtg;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x9

    .line 5
    .line 6
    iput v0, p0, Ll/ptg;->t:I

    .line 7
    .line 8
    const/high16 v0, 0x43200000    # 160.0f

    .line 9
    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Ll/ptg;->u:I

    .line 15
    .line 16
    const/high16 v0, 0x432c0000    # 172.0f

    .line 17
    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/ptg;->v:I

    .line 23
    .line 24
    iput-object p1, p0, Ll/ptg;->r:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    iput-object p3, p0, Ll/ptg;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    .line 27
    .line 28
    iget-object p1, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    iput-object p1, p0, Ll/ptg;->w:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object p1, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p1, p0, Ll/ptg;->x:Ljava/lang/String;

    .line 35
    .line 36
    iget-boolean p1, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    .line 37
    .line 38
    iput-boolean p1, p0, Ll/ptg;->y:Z

    .line 39
    .line 40
    iget p1, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->q:I

    .line 41
    .line 42
    iput p1, p0, Ll/ptg;->z:I

    .line 43
    .line 44
    iget-object p1, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->s:Ll/n570;

    .line 45
    .line 46
    iput-object p1, p0, Ll/ptg;->A:Ll/n570;

    .line 47
    .line 48
    invoke-virtual {p2}, Ll/mtg;->j()Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Ll/ptg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    .line 53
    .line 54
    invoke-virtual {p2}, Ll/mtg;->g()Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Ll/ptg;->b:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {p2}, Ll/mtg;->e()Lv/VLinear;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Ll/ptg;->c:Lv/VLinear;

    .line 65
    .line 66
    invoke-virtual {p2}, Ll/mtg;->t()Landroid/widget/LinearLayout;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Ll/ptg;->d:Landroid/widget/LinearLayout;

    .line 71
    .line 72
    invoke-virtual {p2}, Ll/mtg;->u()Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Ll/ptg;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;

    .line 77
    .line 78
    invoke-virtual {p2}, Ll/mtg;->v()Lv/VText;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Ll/ptg;->f:Lv/VText;

    .line 83
    .line 84
    invoke-virtual {p2}, Ll/mtg;->w()Lv/VText;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Ll/ptg;->g:Lv/VText;

    .line 89
    .line 90
    invoke-virtual {p2}, Ll/mtg;->r()Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Ll/ptg;->h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 95
    .line 96
    invoke-virtual {p2}, Ll/mtg;->x()Lv/VText;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Ll/ptg;->i:Lv/VText;

    .line 101
    .line 102
    invoke-virtual {p2}, Ll/mtg;->m()Landroid/widget/FrameLayout;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Ll/ptg;->j:Landroid/widget/FrameLayout;

    .line 107
    .line 108
    invoke-virtual {p2}, Ll/mtg;->l()Lv/VText;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iput-object p1, p0, Ll/ptg;->k:Lv/VText;

    .line 113
    .line 114
    invoke-virtual {p2}, Ll/mtg;->o()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Ll/ptg;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 119
    .line 120
    invoke-virtual {p2}, Ll/mtg;->q()Landroid/widget/LinearLayout;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iput-object p1, p0, Ll/ptg;->m:Landroid/widget/LinearLayout;

    .line 125
    .line 126
    invoke-virtual {p2}, Ll/mtg;->p()Lv/VText;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iput-object p1, p0, Ll/ptg;->n:Lv/VText;

    .line 131
    .line 132
    invoke-virtual {p2}, Ll/mtg;->f()Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    iput-object p1, p0, Ll/ptg;->o:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 137
    .line 138
    invoke-virtual {p2}, Ll/mtg;->n()Lv/VImage;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iput-object p1, p0, Ll/ptg;->p:Lv/VImage;

    .line 143
    .line 144
    invoke-virtual {p2}, Ll/mtg;->h()Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iput-object p1, p0, Ll/ptg;->q:Landroid/view/View;

    .line 149
    .line 150
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Dimension;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ptg;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->B:I

    .line 4
    .line 5
    mul-int/lit8 p0, p0, 0x2

    .line 6
    .line 7
    sget v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 8
    .line 9
    int-to-float v0, v0

    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    add-int/2addr p0, v0

    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 24
    .line 25
    iget v0, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 26
    .line 27
    if-lez v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/data/Dimension;

    .line 31
    .line 32
    invoke-direct {p1, p0, p0}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 33
    .line 34
    .line 35
    :goto_0
    iget v0, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 36
    .line 37
    int-to-float v0, v0

    .line 38
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 39
    .line 40
    int-to-float p1, p1

    .line 41
    div-float/2addr v0, p1

    .line 42
    const p1, 0x3f333333    # 0.7f

    .line 43
    .line 44
    .line 45
    cmpg-float p1, v0, p1

    .line 46
    .line 47
    if-gtz p1, :cond_1

    .line 48
    .line 49
    mul-int/lit8 p1, p0, 0x9

    .line 50
    .line 51
    div-int/lit8 p1, p1, 0x10

    .line 52
    .line 53
    :goto_1
    move v1, p1

    .line 54
    move p1, p0

    .line 55
    move p0, v1

    .line 56
    goto :goto_2

    .line 57
    :cond_1
    const p1, 0x3f547ae1    # 0.83f

    .line 58
    .line 59
    .line 60
    cmpg-float p1, v0, p1

    .line 61
    .line 62
    if-gtz p1, :cond_2

    .line 63
    .line 64
    mul-int/lit8 p1, p0, 0x3

    .line 65
    .line 66
    div-int/lit8 p1, p1, 0x4

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    const p1, 0x3f99999a    # 1.2f

    .line 70
    .line 71
    .line 72
    cmpl-float p1, v0, p1

    .line 73
    .line 74
    if-ltz p1, :cond_3

    .line 75
    .line 76
    mul-int/lit8 p1, p0, 0x3

    .line 77
    .line 78
    div-int/lit8 p1, p1, 0x4

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    move p1, p0

    .line 82
    :goto_2
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 83
    .line 84
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 85
    .line 86
    .line 87
    return-object v0
.end method

.method public b(Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public c(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    const/4 p0, 0x0

    throw p0
.end method
