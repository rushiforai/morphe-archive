.class public Ll/hi00;
.super Ll/di5;
.source "SourceFile"


# static fields
.field public static B:I


# instance fields
.field public A:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Ljava/lang/String;

.field public l:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

.field public m:Ll/nk00;

.field public n:Ll/hj00;

.field public o:Z

.field public p:Lcom/p1/mobile/putong/data/Links;

.field public final q:Lcom/p1/mobile/android/app/Act;

.field public final r:Ll/n570;

.field public s:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final t:Ljava/lang/String;

.field public final u:Ljava/lang/String;

.field public v:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

.field public final w:Z

.field public x:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/MomentDetailExpandCommentView;

.field public y:Ll/x20;

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(ZLcom/p1/mobile/android/app/Act;Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/nk00;Ll/hj00;Ll/x20;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/di5;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/hi00;->o:Z

    .line 6
    .line 7
    new-instance v1, Ll/hi00$a;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/hi00$a;-><init>(Ll/hi00;)V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/hi00;->A:Ll/h80;

    .line 13
    .line 14
    iput-boolean p1, p0, Ll/hi00;->w:Z

    .line 15
    .line 16
    iput-object p2, p0, Ll/hi00;->q:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    iput-object p3, p0, Ll/hi00;->r:Ll/n570;

    .line 19
    .line 20
    iput-object p4, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iput-object p5, p0, Ll/hi00;->t:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p6, p0, Ll/hi00;->u:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p7, p0, Ll/hi00;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 27
    .line 28
    iput-object p8, p0, Ll/hi00;->m:Ll/nk00;

    .line 29
    .line 30
    iput-object p9, p0, Ll/hi00;->n:Ll/hj00;

    .line 31
    .line 32
    iget-object p1, p9, Ll/hj00;->v:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p1, p0, Ll/hi00;->k:Ljava/lang/String;

    .line 35
    .line 36
    sput v0, Ll/hi00;->B:I

    .line 37
    .line 38
    iput-object p10, p0, Ll/hi00;->y:Ll/x20;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic k0(Ll/hi00;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hi00;->o0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private q0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hi00;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/fi00;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/fi00;-><init>(Ll/hi00;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/hi00;->O(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentMessage;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/lit8 p0, p0, 0x2

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    add-int/lit8 p0, p0, 0x1

    .line 23
    .line 24
    sget v0, Ll/hi00;->B:I

    .line 25
    .line 26
    add-int/2addr p0, v0

    .line 27
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    sget p1, Ll/tec0;->d4:I

    .line 5
    .line 6
    iget-object p2, p0, Ll/hi00;->q:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget-object v1, p0, Ll/hi00;->m:Ll/nk00;

    .line 13
    .line 14
    iget-object v1, v1, Ll/nk00;->c:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    invoke-virtual {p2, p1, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 21
    .line 22
    iput-object p1, p0, Ll/hi00;->v:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_0
    const/16 v1, 0x8

    .line 26
    .line 27
    if-ne p2, v1, :cond_1

    .line 28
    .line 29
    sget p1, Ll/tec0;->r1:I

    .line 30
    .line 31
    iget-object p2, p0, Ll/hi00;->q:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    iget-object v1, p0, Ll/hi00;->m:Ll/nk00;

    .line 38
    .line 39
    iget-object v1, v1, Ll/nk00;->c:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {p2, p1, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/MomentDetailExpandCommentView;

    .line 46
    .line 47
    iput-object p1, p0, Ll/hi00;->x:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/MomentDetailExpandCommentView;

    .line 48
    .line 49
    return-object p1

    .line 50
    :cond_1
    const/4 v1, 0x2

    .line 51
    if-ne p2, v1, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Ll/hi00;->q:Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    sget p2, Ll/tec0;->e:I

    .line 60
    .line 61
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 66
    .line 67
    const/high16 p1, 0x41e00000    # 28.0f

    .line 68
    .line 69
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    invoke-static {p0, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 77
    .line 78
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_2
    const/4 v1, 0x5

    .line 83
    if-ne p2, v1, :cond_3

    .line 84
    .line 85
    iget-object p0, p0, Ll/hi00;->q:Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sget p2, Ll/tec0;->q1:I

    .line 92
    .line 93
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0

    .line 98
    :cond_3
    const/4 v1, 0x4

    .line 99
    if-ne p2, v1, :cond_4

    .line 100
    .line 101
    iget-object p0, p0, Ll/hi00;->q:Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    sget p2, Ll/tec0;->a2:I

    .line 108
    .line 109
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    return-object p0

    .line 114
    :cond_4
    iget-object p0, p0, Ll/hi00;->q:Lcom/p1/mobile/android/app/Act;

    .line 115
    .line 116
    const/4 v1, 0x3

    .line 117
    if-ne p2, v1, :cond_5

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    sget p2, Ll/tec0;->c2:I

    .line 124
    .line 125
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    sget p2, Ll/tec0;->p5:I

    .line 135
    .line 136
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    return-object p0
.end method

.method public O(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentMessage;II)V
    .locals 24

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v10, p1

    .line 4
    .line 5
    move-object/from16 v11, p2

    .line 6
    .line 7
    move/from16 v12, p3

    .line 8
    .line 9
    move/from16 v13, p4

    .line 10
    .line 11
    const/4 v14, 0x3

    .line 12
    const/4 v15, 0x4

    .line 13
    const/4 v0, 0x1

    .line 14
    if-nez v12, :cond_1

    .line 15
    .line 16
    move-object v2, v10

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 18
    .line 19
    iput-object v2, v1, Ll/hi00;->v:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ll/hi00;->n0(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 22
    .line 23
    .line 24
    iget-object v2, v1, Ll/hi00;->v:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 25
    .line 26
    iget-object v3, v1, Ll/hi00;->r:Ll/n570;

    .line 27
    .line 28
    iget-object v4, v1, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    iget-object v5, v1, Ll/hi00;->u:Ljava/lang/String;

    .line 31
    .line 32
    iget-boolean v6, v1, Ll/hi00;->w:Z

    .line 33
    .line 34
    iget-object v7, v1, Ll/hi00;->n:Ll/hj00;

    .line 35
    .line 36
    iget-boolean v8, v7, Ll/hj00;->w:Z

    .line 37
    .line 38
    iget-object v9, v1, Ll/hi00;->y:Ll/x20;

    .line 39
    .line 40
    iget-boolean v7, v7, Ll/hj00;->x:Z

    .line 41
    .line 42
    move-object/from16 v16, v2

    .line 43
    .line 44
    move-object/from16 v17, v3

    .line 45
    .line 46
    move-object/from16 v18, v4

    .line 47
    .line 48
    move-object/from16 v19, v5

    .line 49
    .line 50
    move/from16 v20, v6

    .line 51
    .line 52
    move/from16 v23, v7

    .line 53
    .line 54
    move/from16 v21, v8

    .line 55
    .line 56
    move-object/from16 v22, v9

    .line 57
    .line 58
    invoke-virtual/range {v16 .. v23}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->f0(Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZLl/x20;Z)V

    .line 59
    .line 60
    .line 61
    iget-boolean v2, v1, Ll/hi00;->z:Z

    .line 62
    .line 63
    if-nez v2, :cond_0

    .line 64
    .line 65
    iput-boolean v0, v1, Ll/hi00;->z:Z

    .line 66
    .line 67
    iget-object v2, v1, Ll/hi00;->v:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 68
    .line 69
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->o0()V

    .line 70
    .line 71
    .line 72
    :cond_0
    invoke-direct {v1}, Ll/hi00;->q0()V

    .line 73
    .line 74
    .line 75
    :goto_0
    move v2, v0

    .line 76
    move-object v3, v11

    .line 77
    goto/16 :goto_3

    .line 78
    .line 79
    :cond_1
    if-ne v12, v0, :cond_2

    .line 80
    .line 81
    move-object v2, v10

    .line 82
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;

    .line 83
    .line 84
    iget-object v3, v1, Ll/hi00;->r:Ll/n570;

    .line 85
    .line 86
    iget-object v4, v1, Ll/hi00;->t:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v5, v1, Ll/hi00;->n:Ll/hj00;

    .line 89
    .line 90
    iget-object v5, v5, Ll/hj00;->o:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v2, v3, v11, v4, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;->u(Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    const/4 v2, 0x5

    .line 97
    if-ne v12, v2, :cond_3

    .line 98
    .line 99
    move v2, v0

    .line 100
    move-object v0, v10

    .line 101
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;

    .line 102
    .line 103
    iget-object v3, v1, Ll/hi00;->r:Ll/n570;

    .line 104
    .line 105
    move-object v4, v3

    .line 106
    iget-object v3, v1, Ll/hi00;->t:Ljava/lang/String;

    .line 107
    .line 108
    iget-object v5, v1, Ll/hi00;->n:Ll/hj00;

    .line 109
    .line 110
    iget-object v5, v5, Ll/hj00;->o:Ljava/lang/String;

    .line 111
    .line 112
    iget-object v6, v11, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 113
    .line 114
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 115
    .line 116
    move-object v7, v4

    .line 117
    move-object v4, v5

    .line 118
    move-object v5, v6

    .line 119
    invoke-virtual {v1, v5}, Ll/di5;->T(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Links;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    iget-object v8, v11, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 124
    .line 125
    move-object v9, v7

    .line 126
    iget-object v7, v8, Lcom/p1/mobile/putong/feed/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 127
    .line 128
    iget-object v2, v1, Ll/di5;->g:Ljava/util/Map;

    .line 129
    .line 130
    iget-object v8, v8, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 131
    .line 132
    invoke-interface {v2, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    check-cast v2, Ljava/lang/Boolean;

    .line 137
    .line 138
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 139
    .line 140
    .line 141
    move-result v8

    .line 142
    move-object v1, v9

    .line 143
    add-int/lit8 v9, v13, -0x1

    .line 144
    .line 145
    move-object/from16 v2, p0

    .line 146
    .line 147
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->l(Ll/n570;Ll/di5;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;Ljava/lang/String;ZI)V

    .line 148
    .line 149
    .line 150
    move-object v1, v2

    .line 151
    move-object v3, v11

    .line 152
    :goto_1
    const/4 v2, 0x1

    .line 153
    goto/16 :goto_3

    .line 154
    .line 155
    :cond_3
    if-ne v12, v15, :cond_5

    .line 156
    .line 157
    instance-of v0, v10, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;

    .line 158
    .line 159
    if-eqz v0, :cond_4

    .line 160
    .line 161
    move-object v0, v10

    .line 162
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;

    .line 163
    .line 164
    iget-object v2, v1, Ll/hi00;->r:Ll/n570;

    .line 165
    .line 166
    iget-object v4, v1, Ll/hi00;->t:Ljava/lang/String;

    .line 167
    .line 168
    iget-object v3, v1, Ll/hi00;->n:Ll/hj00;

    .line 169
    .line 170
    iget-object v5, v3, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 171
    .line 172
    iget-object v6, v1, Ll/hi00;->u:Ljava/lang/String;

    .line 173
    .line 174
    move-object v3, v11

    .line 175
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->q0(Ll/di5;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    :cond_4
    move-object/from16 v3, p2

    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_5
    if-ne v12, v14, :cond_6

    .line 182
    .line 183
    move-object v0, v10

    .line 184
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentParentDetailsView;

    .line 185
    .line 186
    iget-object v2, v1, Ll/hi00;->r:Ll/n570;

    .line 187
    .line 188
    iget-object v4, v1, Ll/hi00;->t:Ljava/lang/String;

    .line 189
    .line 190
    iget-object v3, v1, Ll/hi00;->n:Ll/hj00;

    .line 191
    .line 192
    iget-object v5, v3, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 193
    .line 194
    iget-object v6, v1, Ll/hi00;->u:Ljava/lang/String;

    .line 195
    .line 196
    move-object/from16 v3, p2

    .line 197
    .line 198
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->q0(Ll/di5;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    goto :goto_1

    .line 202
    :cond_6
    move-object/from16 v3, p2

    .line 203
    .line 204
    const/4 v0, 0x2

    .line 205
    if-ne v12, v0, :cond_9

    .line 206
    .line 207
    iget-boolean v0, v1, Ll/hi00;->o:Z

    .line 208
    .line 209
    invoke-static {v10, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 210
    .line 211
    .line 212
    move-object v0, v10

    .line 213
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 214
    .line 215
    iget-object v2, v1, Ll/hi00;->t:Ljava/lang/String;

    .line 216
    .line 217
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    iget-object v4, v1, Ll/hi00;->q:Lcom/p1/mobile/android/app/Act;

    .line 230
    .line 231
    if-eqz v2, :cond_7

    .line 232
    .line 233
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->a4:I

    .line 234
    .line 235
    invoke-virtual {v4, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    goto :goto_2

    .line 240
    :cond_7
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->h4:I

    .line 241
    .line 242
    invoke-virtual {v4, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    :goto_2
    iget-boolean v4, v1, Ll/hi00;->w:Z

    .line 247
    .line 248
    if-eqz v4, :cond_8

    .line 249
    .line 250
    iget-object v2, v1, Ll/hi00;->q:Lcom/p1/mobile/android/app/Act;

    .line 251
    .line 252
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->d3:I

    .line 253
    .line 254
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    :cond_8
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 259
    .line 260
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    .line 262
    .line 263
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 264
    .line 265
    sget v4, Ll/lbc0;->a3:I

    .line 266
    .line 267
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 268
    .line 269
    .line 270
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 271
    .line 272
    iget-object v4, v1, Ll/hi00;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 273
    .line 274
    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 275
    .line 276
    .line 277
    move-result-object v4

    .line 278
    sget v5, Ll/k9c0;->m0:I

    .line 279
    .line 280
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 281
    .line 282
    .line 283
    move-result v4

    .line 284
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 285
    .line 286
    .line 287
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 288
    .line 289
    const/4 v2, 0x1

    .line 290
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 291
    .line 292
    .line 293
    goto :goto_3

    .line 294
    :cond_9
    const/4 v2, 0x1

    .line 295
    const/16 v0, 0x8

    .line 296
    .line 297
    if-ne v12, v0, :cond_b

    .line 298
    .line 299
    move-object v4, v10

    .line 300
    check-cast v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/MomentDetailExpandCommentView;

    .line 301
    .line 302
    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/MomentDetailExpandCommentView;->b(Ll/hi00;)V

    .line 303
    .line 304
    .line 305
    iget-object v5, v1, Ll/hi00;->p:Lcom/p1/mobile/putong/data/Links;

    .line 306
    .line 307
    invoke-static {v5}, Ll/di5;->W(Lcom/p1/mobile/putong/data/Links;)Z

    .line 308
    .line 309
    .line 310
    move-result v5

    .line 311
    const/4 v6, 0x0

    .line 312
    if-eqz v5, :cond_a

    .line 313
    .line 314
    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 315
    .line 316
    .line 317
    const/4 v0, -0x2

    .line 318
    invoke-static {v4, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 319
    .line 320
    .line 321
    goto :goto_3

    .line 322
    :cond_a
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    .line 323
    .line 324
    .line 325
    invoke-static {v4, v6}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 326
    .line 327
    .line 328
    :cond_b
    :goto_3
    if-eq v12, v2, :cond_d

    .line 329
    .line 330
    if-eq v12, v15, :cond_d

    .line 331
    .line 332
    if-ne v12, v14, :cond_c

    .line 333
    .line 334
    goto :goto_4

    .line 335
    :cond_c
    return-void

    .line 336
    :cond_d
    :goto_4
    iget-object v0, v1, Ll/hi00;->A:Ll/h80;

    .line 337
    .line 338
    invoke-virtual {v0, v10, v3, v13}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 339
    .line 340
    .line 341
    return-void
.end method

.method public U(I)Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget-object v1, p0, Ll/di5;->c:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 15
    .line 16
    add-int/lit8 p1, p1, -0x1

    .line 17
    .line 18
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 23
    .line 24
    return-object p0
.end method

.method public d0(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/di5;->g:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/di5;->h:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/hi00;->o:Z

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    sub-int/2addr v1, v0

    .line 19
    :goto_0
    if-ltz v1, :cond_1

    .line 20
    .line 21
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 34
    .line 35
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, v2, v3}, Ll/di5;->Z(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 v1, 0x0

    .line 47
    move v2, v1

    .line 48
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-ge v2, v3, :cond_3

    .line 53
    .line 54
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 59
    .line 60
    invoke-virtual {p0, v3}, Ll/di5;->i0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 61
    .line 62
    .line 63
    iget-object v4, p0, Ll/di5;->e:Ljava/util/Map;

    .line 64
    .line 65
    iget-object v5, v3, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    check-cast v4, Ljava/util/List;

    .line 72
    .line 73
    invoke-virtual {p0, v3, v4, v1}, Ll/di5;->Q(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/util/List;Z)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-eqz v4, :cond_2

    .line 82
    .line 83
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-lez v4, :cond_2

    .line 88
    .line 89
    add-int/lit8 v4, v2, 0x1

    .line 90
    .line 91
    invoke-interface {p1, v4, v3}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    add-int/2addr v3, v0

    .line 99
    add-int/2addr v2, v3

    .line 100
    goto :goto_1

    .line 101
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_3
    invoke-super {p0, p1}, Ll/di5;->d0(Ljava/util/List;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sub-int/2addr v0, p1

    .line 8
    const/4 p1, 0x2

    .line 9
    if-ge v0, p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hi00;->p0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hi00;->U(I)Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x2

    .line 14
    return p0

    .line 15
    :cond_1
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x1

    .line 22
    add-int/2addr v0, v1

    .line 23
    if-ne p1, v0, :cond_2

    .line 24
    .line 25
    const/16 p0, 0x8

    .line 26
    .line 27
    return p0

    .line 28
    :cond_2
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    invoke-static {v0}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_5

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/hi00;->U(I)Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/di5;->a0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_3

    .line 45
    .line 46
    const/4 p0, 0x5

    .line 47
    return p0

    .line 48
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_4

    .line 53
    .line 54
    const/4 p0, 0x4

    .line 55
    return p0

    .line 56
    :cond_4
    const/4 p0, 0x3

    .line 57
    return p0

    .line 58
    :cond_5
    return v1
.end method

.method public h0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hi00;->n:Ll/hj00;

    .line 2
    .line 3
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/hj00;->H1(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)I
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 6
    .line 7
    new-instance v0, Ll/gi00;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/gi00;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    add-int/lit8 p0, p0, 0x2

    .line 17
    .line 18
    return p0
.end method

.method public final m0(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;
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
    iget-object v0, p0, Ll/hi00;->r:Ll/n570;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/n570;->p()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/hi00;->r:Ll/n570;

    .line 16
    .line 17
    iget-object p0, p0, Ll/n570;->b:Ll/qn00;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/qn00;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public final n0(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    invoke-static {v0}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    invoke-static {v0}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    :cond_0
    invoke-static {}, Ll/cmg;->n0()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_f

    .line 46
    .line 47
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_f

    .line 54
    .line 55
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 56
    .line 57
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 58
    .line 59
    if-eqz v0, :cond_f

    .line 60
    .line 61
    :cond_1
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_b

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    if-eq v0, v1, :cond_2

    .line 73
    .line 74
    new-instance v0, Ll/co00;

    .line 75
    .line 76
    invoke-direct {v0}, Ll/co00;-><init>()V

    .line 77
    .line 78
    .line 79
    goto/16 :goto_3

    .line 80
    .line 81
    :cond_2
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 84
    .line 85
    const/4 v2, 0x0

    .line 86
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 91
    .line 92
    instance-of v3, v0, Lcom/p1/mobile/putong/data/Video;

    .line 93
    .line 94
    if-eqz v3, :cond_3

    .line 95
    .line 96
    new-instance v0, Ll/ko00;

    .line 97
    .line 98
    invoke-direct {v0}, Ll/ko00;-><init>()V

    .line 99
    .line 100
    .line 101
    goto/16 :goto_3

    .line 102
    .line 103
    :cond_3
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Audio;

    .line 104
    .line 105
    if-eqz v0, :cond_4

    .line 106
    .line 107
    new-instance v0, Ll/yn00;

    .line 108
    .line 109
    invoke-direct {v0}, Ll/yn00;-><init>()V

    .line 110
    .line 111
    .line 112
    goto/16 :goto_3

    .line 113
    .line 114
    :cond_4
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz v0, :cond_5

    .line 119
    .line 120
    const-string v3, "type=\"img\""

    .line 121
    .line 122
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_5

    .line 127
    .line 128
    move v0, v1

    .line 129
    goto :goto_0

    .line 130
    :cond_5
    move v0, v2

    .line 131
    :goto_0
    iget-object v3, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 132
    .line 133
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    if-eqz v3, :cond_6

    .line 140
    .line 141
    iget-object v3, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 142
    .line 143
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    if-nez v3, :cond_7

    .line 150
    .line 151
    :cond_6
    iget-object v3, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 152
    .line 153
    invoke-static {v3}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    if-eqz v3, :cond_7

    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_7
    move v1, v2

    .line 161
    :goto_1
    iget-object v2, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 162
    .line 163
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 164
    .line 165
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    if-eqz v2, :cond_8

    .line 170
    .line 171
    iget-object v2, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 172
    .line 173
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 174
    .line 175
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {v2}, Ll/pu20;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    if-nez v2, :cond_8

    .line 186
    .line 187
    new-instance v0, Ll/ho00;

    .line 188
    .line 189
    invoke-direct {v0}, Ll/ho00;-><init>()V

    .line 190
    .line 191
    .line 192
    goto :goto_3

    .line 193
    :cond_8
    if-nez v1, :cond_a

    .line 194
    .line 195
    if-eqz v0, :cond_9

    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_9
    new-instance v0, Ll/co00;

    .line 199
    .line 200
    invoke-direct {v0}, Ll/co00;-><init>()V

    .line 201
    .line 202
    .line 203
    goto :goto_3

    .line 204
    :cond_a
    :goto_2
    new-instance v0, Ll/ao00;

    .line 205
    .line 206
    invoke-direct {v0}, Ll/ao00;-><init>()V

    .line 207
    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_b
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 211
    .line 212
    invoke-static {v0}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_c

    .line 217
    .line 218
    new-instance v0, Ll/zn00;

    .line 219
    .line 220
    invoke-direct {v0}, Ll/zn00;-><init>()V

    .line 221
    .line 222
    .line 223
    goto :goto_3

    .line 224
    :cond_c
    iget-object v0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 225
    .line 226
    invoke-static {v0}, Ll/ksg;->s0(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    if-eqz v0, :cond_d

    .line 231
    .line 232
    new-instance v0, Ll/go00;

    .line 233
    .line 234
    invoke-direct {v0}, Ll/go00;-><init>()V

    .line 235
    .line 236
    .line 237
    goto :goto_3

    .line 238
    :cond_d
    new-instance v0, Ll/io00;

    .line 239
    .line 240
    invoke-direct {v0}, Ll/io00;-><init>()V

    .line 241
    .line 242
    .line 243
    :goto_3
    invoke-static {}, Ll/cmg;->n0()Z

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    if-eqz v1, :cond_e

    .line 248
    .line 249
    iget-object v1, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 250
    .line 251
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    if-eqz v1, :cond_e

    .line 256
    .line 257
    iget-object v1, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 258
    .line 259
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 260
    .line 261
    if-eqz v1, :cond_e

    .line 262
    .line 263
    new-instance v0, Ll/jo00;

    .line 264
    .line 265
    invoke-direct {v0}, Ll/jo00;-><init>()V

    .line 266
    .line 267
    .line 268
    :cond_e
    iget-object v1, p0, Ll/hi00;->u:Ljava/lang/String;

    .line 269
    .line 270
    invoke-virtual {v0, v1}, Ll/fo00;->f(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    iget-object v1, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 274
    .line 275
    invoke-virtual {p0, v1}, Ll/hi00;->m0(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {v0, v1}, Ll/fo00;->g(Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 280
    .line 281
    .line 282
    iget-object p0, p0, Ll/hi00;->n:Ll/hj00;

    .line 283
    .line 284
    iget-boolean v1, p0, Ll/hj00;->w:Z

    .line 285
    .line 286
    iget-boolean p0, p0, Ll/hj00;->x:Z

    .line 287
    .line 288
    invoke-virtual {v0, v1, p0}, Ll/fo00;->e(ZZ)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->setMomentHeaderInsertProxy(Ll/fo00;)V

    .line 292
    .line 293
    .line 294
    :cond_f
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/hi00;->v:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget-object p0, p0, Ll/hi00;->v:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->e0()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 20
    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Ll/hi00;->v:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Ll/hi00;->v:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->d0()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 38
    .line 39
    if-ne p1, v0, :cond_2

    .line 40
    .line 41
    iget-object p1, p0, Ll/hi00;->v:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Ll/hi00;->v:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->t0()V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hi00;->A:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hi00;->A:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public p0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hi00;->p:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    invoke-static {v0}, Ll/di5;->W(Lcom/p1/mobile/putong/data/Links;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/hi00;->r:Ll/n570;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/n570;->z()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
