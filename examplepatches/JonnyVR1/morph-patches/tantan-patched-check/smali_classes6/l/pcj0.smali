.class public Ll/pcj0;
.super Ll/di5;
.source "SourceFile"


# instance fields
.field public final k:Lcom/p1/mobile/android/app/Act;

.field public l:Ll/cdj0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/cdj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/di5;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pcj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/pcj0;->l:Ll/cdj0;

    .line 7
    .line 8
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

.method public static synthetic k0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic l0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pcj0;->O(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentMessage;II)V

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
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/pcj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/tec0;->e:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 v0, 0x5

    .line 21
    if-ne p2, v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/pcj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget p2, Ll/tec0;->q1:I

    .line 30
    .line 31
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_1
    iget-object p0, p0, Ll/pcj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    const/4 v0, 0x4

    .line 39
    if-ne p2, v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget p2, Ll/tec0;->a2:I

    .line 46
    .line 47
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget p2, Ll/tec0;->c2:I

    .line 57
    .line 58
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public O(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentMessage;II)V
    .locals 11

    .line 1
    const/4 v2, 0x1

    .line 2
    if-ne p3, v2, :cond_0

    .line 3
    .line 4
    move-object v0, p1

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/pcj0;->m0(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v4, 0x5

    .line 12
    if-ne p3, v4, :cond_1

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;

    .line 16
    .line 17
    iget-object v4, p0, Ll/pcj0;->l:Ll/cdj0;

    .line 18
    .line 19
    iget-object v5, v4, Ll/cdj0;->a:Ll/ucj0;

    .line 20
    .line 21
    iget-object v6, v4, Ll/cdj0;->d:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v4, v4, Ll/cdj0;->c:Ljava/lang/String;

    .line 24
    .line 25
    move-object v7, v5

    .line 26
    iget-object v5, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 27
    .line 28
    move-object v8, v6

    .line 29
    invoke-virtual {p0, v5}, Ll/di5;->T(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Links;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    move-object v9, v7

    .line 34
    iget-object v7, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v10, p0, Ll/di5;->g:Ljava/util/Map;

    .line 37
    .line 38
    iget-object v3, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {v10, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    add-int/lit8 v2, p4, -0x1

    .line 51
    .line 52
    move-object v1, v8

    .line 53
    move v8, v3

    .line 54
    move-object v3, v1

    .line 55
    move-object v1, v9

    .line 56
    move v9, v2

    .line 57
    move-object v2, p0

    .line 58
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->m(Ll/n570;Ll/di5;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;Ljava/lang/String;ZI)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    const/4 v2, 0x4

    .line 63
    if-ne p3, v2, :cond_2

    .line 64
    .line 65
    move-object v0, p1

    .line 66
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;

    .line 67
    .line 68
    iget-object v2, p0, Ll/pcj0;->l:Ll/cdj0;

    .line 69
    .line 70
    iget-object v4, v2, Ll/cdj0;->a:Ll/ucj0;

    .line 71
    .line 72
    move-object v5, v4

    .line 73
    iget-object v4, v2, Ll/cdj0;->m:Ll/y20;

    .line 74
    .line 75
    move-object v6, v5

    .line 76
    iget-object v5, v2, Ll/cdj0;->c:Ljava/lang/String;

    .line 77
    .line 78
    move-object v7, v6

    .line 79
    iget-object v6, v2, Ll/cdj0;->d:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v2, v2, Ll/cdj0;->e:Ljava/lang/String;

    .line 82
    .line 83
    move-object v1, v7

    .line 84
    move-object v7, v2

    .line 85
    move-object v2, v1

    .line 86
    move-object v1, p0

    .line 87
    move-object v3, p2

    .line 88
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->t0(Ll/di5;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    const/4 v2, 0x3

    .line 93
    if-ne p3, v2, :cond_3

    .line 94
    .line 95
    move-object v0, p1

    .line 96
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentParentDetailsView;

    .line 97
    .line 98
    iget-object v2, p0, Ll/pcj0;->l:Ll/cdj0;

    .line 99
    .line 100
    iget-object v3, v2, Ll/cdj0;->a:Ll/ucj0;

    .line 101
    .line 102
    iget-object v4, v2, Ll/cdj0;->m:Ll/y20;

    .line 103
    .line 104
    iget-object v5, v2, Ll/cdj0;->c:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v6, v2, Ll/cdj0;->d:Ljava/lang/String;

    .line 107
    .line 108
    iget-object v7, v2, Ll/cdj0;->e:Ljava/lang/String;

    .line 109
    .line 110
    move-object v1, p0

    .line 111
    move-object v2, v3

    .line 112
    move-object v3, p2

    .line 113
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->t0(Ll/di5;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/y20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    return-void
.end method

.method public R(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/ncj0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/ncj0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 13
    .line 14
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public U(I)Lcom/p1/mobile/putong/feed/data/MomentMessage;
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
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 18
    .line 19
    return-object p0
.end method

.method public V(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/ocj0;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/ocj0;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 23
    .line 24
    return-object p0
.end method

.method public a0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z
    .locals 0

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 2
    .line 3
    return p0
.end method

.method public b0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/di5;->f:Ljava/util/Map;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-interface {v1, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return v2

    .line 19
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v3, 0x0

    .line 32
    if-eqz v1, :cond_5

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-lez v1, :cond_5

    .line 39
    .line 40
    move v1, v3

    .line 41
    move v4, v1

    .line 42
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-ge v1, v5, :cond_4

    .line 47
    .line 48
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    check-cast v5, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 53
    .line 54
    iget-object v6, p0, Ll/di5;->e:Ljava/util/Map;

    .line 55
    .line 56
    iget-object v7, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    check-cast v6, Ljava/util/List;

    .line 63
    .line 64
    new-instance v7, Ll/mcj0;

    .line 65
    .line 66
    invoke-direct {v7, v5}, Ll/mcj0;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v6, v7}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    if-eqz v6, :cond_2

    .line 74
    .line 75
    iget-object v0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ll/di5;->T(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Links;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_1

    .line 86
    .line 87
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ll/di5;->T(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Links;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-nez p0, :cond_1

    .line 100
    .line 101
    return v3

    .line 102
    :cond_1
    return v2

    .line 103
    :cond_2
    iget-object v6, p0, Ll/di5;->i:Ljava/util/List;

    .line 104
    .line 105
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    if-nez v6, :cond_3

    .line 110
    .line 111
    iget-object v6, p0, Ll/di5;->i:Ljava/util/List;

    .line 112
    .line 113
    iget-object v5, v5, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 114
    .line 115
    invoke-interface {v6, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v5

    .line 119
    if-eqz v5, :cond_3

    .line 120
    .line 121
    add-int/lit8 v4, v4, 0x1

    .line 122
    .line 123
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-ne v4, p0, :cond_5

    .line 131
    .line 132
    return v2

    .line 133
    :cond_5
    return v3
.end method

.method public d0(Ljava/util/List;)V
    .locals 5
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
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    sub-int/2addr v0, v1

    .line 17
    :goto_0
    if-ltz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, v2, v3}, Ll/di5;->Z(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/4 v0, 0x0

    .line 43
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-ge v0, v2, :cond_3

    .line 48
    .line 49
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 54
    .line 55
    iget-object v3, p0, Ll/di5;->e:Ljava/util/Map;

    .line 56
    .line 57
    iget-object v4, v2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Ljava/util/List;

    .line 64
    .line 65
    invoke-virtual {p0, v2, v3, v1}, Ll/di5;->Q(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/util/List;Z)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_2

    .line 74
    .line 75
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-lez v3, :cond_2

    .line 80
    .line 81
    add-int/lit8 v3, v0, 0x1

    .line 82
    .line 83
    invoke-interface {p1, v3, v2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 84
    .line 85
    .line 86
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    add-int/2addr v2, v1

    .line 91
    add-int/2addr v0, v2

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    invoke-super {p0, p1}, Ll/di5;->d0(Ljava/util/List;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pcj0;->l:Ll/cdj0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/cdj0;->j:Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    invoke-static {v0}, Ll/di5;->W(Lcom/p1/mobile/putong/data/Links;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    sub-int/2addr v0, p1

    .line 26
    const/4 p1, 0x2

    .line 27
    if-ge v0, p1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/pcj0;->l:Ll/cdj0;

    .line 30
    .line 31
    iget-object p0, p0, Ll/cdj0;->a:Ll/ucj0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ucj0;->z()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public e0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Ll/di5;->e:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/di5;->i:Ljava/util/List;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pcj0;->U(I)Lcom/p1/mobile/putong/feed/data/MomentMessage;

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
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Ll/pcj0;->U(I)Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/pcj0;->a0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x5

    .line 22
    return p0

    .line 23
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 p0, 0x4

    .line 30
    return p0

    .line 31
    :cond_2
    const/4 p0, 0x3

    .line 32
    return p0
.end method

.method public h0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pcj0;->l:Ll/cdj0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/cdj0;->E0(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V
    .locals 2

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
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/pcj0;->l:Ll/cdj0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/cdj0;->l0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 35
    .line 36
    const/high16 p1, 0x41a80000    # 21.0f

    .line 37
    .line 38
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
