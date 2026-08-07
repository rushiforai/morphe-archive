.class public Ll/t7i;
.super Ll/l7i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/l7i<",
        "Ll/lnh;",
        ">;"
    }
.end annotation


# static fields
.field public static t:Ljava/lang/String;


# instance fields
.field public s:Ll/f7i;


# direct methods
.method public constructor <init>(Ll/lnh;Ll/dj70;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/l7i;-><init>(Ll/lol;Ll/dj70;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cmg;->S()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/t7i;->a0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic C(Ll/t7i;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t7i;->V(Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D(Ll/t7i;I[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t7i;->W(I[I)V

    return-void
.end method

.method public static synthetic E(Ll/t7i;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t7i;->Y(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic F(Ll/t7i;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t7i;->X(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method


# virtual methods
.method public final G(Z)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-boolean p1, p1, Ll/dj70;->d:Z

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l7i;->o()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v1, Ll/tec0;->i3:I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {p1, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;

    .line 20
    .line 21
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 22
    .line 23
    iget-object v1, v1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    const/4 v2, 0x4

    .line 26
    invoke-virtual {p1, v1, v2, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->d(Lcom/p1/mobile/putong/data/User;II)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/l7i;->q:Ll/lol;

    .line 30
    .line 31
    check-cast v1, Ll/lnh;

    .line 32
    .line 33
    iget-object v1, v1, Ll/lnh;->w:Lv/VLinear;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/l7i;->q:Ll/lol;

    .line 39
    .line 40
    check-cast v1, Ll/lnh;

    .line 41
    .line 42
    iget-object v1, v1, Ll/lnh;->w:Lv/VLinear;

    .line 43
    .line 44
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/l7i;->q:Ll/lol;

    .line 48
    .line 49
    check-cast v1, Ll/lnh;

    .line 50
    .line 51
    iget-object v1, v1, Ll/lnh;->w:Lv/VLinear;

    .line 52
    .line 53
    const/4 v2, 0x1

    .line 54
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ll/l7i;->q:Ll/lol;

    .line 58
    .line 59
    check-cast v1, Ll/lnh;

    .line 60
    .line 61
    iget-object v1, v1, Ll/lnh;->t:Lv/VLinear_FillerMeasure;

    .line 62
    .line 63
    new-array v2, v2, [Landroid/view/View;

    .line 64
    .line 65
    aput-object v1, v2, v0

    .line 66
    .line 67
    const/4 v1, -0x2

    .line 68
    invoke-static {v1, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 72
    .line 73
    iget-boolean v1, v1, Ll/dj70;->c:Z

    .line 74
    .line 75
    if-eqz v1, :cond_1

    .line 76
    .line 77
    invoke-static {}, Ll/cmg;->c()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 86
    .line 87
    check-cast p1, Ll/lnh;

    .line 88
    .line 89
    iget-object p1, p1, Ll/lnh;->w:Lv/VLinear;

    .line 90
    .line 91
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 95
    .line 96
    check-cast p0, Ll/lnh;

    .line 97
    .line 98
    iget-object p0, p0, Ll/lnh;->G:Lv/VLinear;

    .line 99
    .line 100
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final H(Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->s()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    :cond_0
    if-eqz p1, :cond_2

    .line 14
    .line 15
    :cond_1
    return-void

    .line 16
    :cond_2
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 17
    .line 18
    check-cast p1, Ll/lnh;

    .line 19
    .line 20
    iget-object p1, p1, Ll/lnh;->K:Lv/VLinear;

    .line 21
    .line 22
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_3

    .line 27
    .line 28
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 29
    .line 30
    check-cast p1, Ll/lnh;

    .line 31
    .line 32
    iget-object p1, p1, Ll/lnh;->O:Lv/VText;

    .line 33
    .line 34
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_4

    .line 39
    .line 40
    :cond_3
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 41
    .line 42
    check-cast p1, Ll/lnh;

    .line 43
    .line 44
    iget-object p1, p1, Ll/lnh;->K:Lv/VLinear;

    .line 45
    .line 46
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_5

    .line 51
    .line 52
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 53
    .line 54
    check-cast p1, Ll/lnh;

    .line 55
    .line 56
    iget-object p1, p1, Ll/lnh;->Q:Lv/VText;

    .line 57
    .line 58
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_5

    .line 63
    .line 64
    :cond_4
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 65
    .line 66
    check-cast p0, Ll/lnh;

    .line 67
    .line 68
    iget-object p0, p0, Ll/lnh;->N:Lv/VText;

    .line 69
    .line 70
    const/4 p1, 0x1

    .line 71
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_5
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 76
    .line 77
    check-cast p0, Ll/lnh;

    .line 78
    .line 79
    iget-object p0, p0, Ll/lnh;->N:Lv/VText;

    .line 80
    .line 81
    const/4 p1, 0x0

    .line 82
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final I(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_4

    .line 13
    .line 14
    if-nez p1, :cond_4

    .line 15
    .line 16
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 17
    .line 18
    iget-object p1, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 28
    .line 29
    iget-object p1, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "from_like"

    .line 32
    .line 33
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 40
    .line 41
    iget-object p1, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p1}, Ll/pu20;->B(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 51
    .line 52
    check-cast p0, Ll/lnh;

    .line 53
    .line 54
    iget-object p0, p0, Ll/lnh;->K:Lv/VLinear;

    .line 55
    .line 56
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 61
    .line 62
    iget-object p1, p1, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 71
    .line 72
    iget-object p1, p1, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_3

    .line 81
    .line 82
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 83
    .line 84
    check-cast p1, Ll/lnh;

    .line 85
    .line 86
    iget-object p1, p1, Ll/lnh;->K:Lv/VLinear;

    .line 87
    .line 88
    const/4 v0, 0x1

    .line 89
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 93
    .line 94
    check-cast p1, Ll/lnh;

    .line 95
    .line 96
    iget-object p1, p1, Ll/lnh;->M:Lv/VText;

    .line 97
    .line 98
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 99
    .line 100
    iget-object v0, v0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 108
    .line 109
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 110
    .line 111
    check-cast v0, Ll/lnh;

    .line 112
    .line 113
    iget-object v0, v0, Ll/lnh;->L:Lv/VDraweeView;

    .line 114
    .line 115
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 116
    .line 117
    iget-object p0, p0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipIconUrl:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p1, v0, p0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_3
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 126
    .line 127
    check-cast p0, Ll/lnh;

    .line 128
    .line 129
    iget-object p0, p0, Ll/lnh;->K:Lv/VLinear;

    .line 130
    .line 131
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_4
    :goto_1
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 136
    .line 137
    check-cast p0, Ll/lnh;

    .line 138
    .line 139
    iget-object p0, p0, Ll/lnh;->K:Lv/VLinear;

    .line 140
    .line 141
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public final J(Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    const-string v2, ""

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 21
    .line 22
    invoke-static {v0}, Ll/ksg;->v(Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ll/t7i;->Q(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 38
    .line 39
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    move-object v0, v2

    .line 55
    :goto_0
    iget-object v3, p0, Ll/l7i;->a:Ll/dj70;

    .line 56
    .line 57
    iget-object v3, v3, Ll/dj70;->b:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v3}, Ll/pu20;->C(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_2

    .line 64
    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    :cond_2
    invoke-static {}, Ll/cmg;->C()Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_5

    .line 72
    .line 73
    iget-object v3, p0, Ll/l7i;->a:Ll/dj70;

    .line 74
    .line 75
    iget-object v3, v3, Ll/dj70;->b:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v3}, Ll/ksg;->a0(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-eqz v3, :cond_5

    .line 82
    .line 83
    :cond_3
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 84
    .line 85
    iget-object v0, v0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 86
    .line 87
    if-eqz v0, :cond_4

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->locationName:Ljava/lang/String;

    .line 90
    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    :cond_4
    move-object v0, v2

    .line 94
    :cond_5
    iget-object v3, p0, Ll/l7i;->q:Ll/lol;

    .line 95
    .line 96
    check-cast v3, Ll/lnh;

    .line 97
    .line 98
    iget-object v3, v3, Ll/lnh;->Q:Lv/VText;

    .line 99
    .line 100
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    if-eqz v4, :cond_6

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_6
    move-object v2, v0

    .line 108
    :goto_1
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    iget-object v2, p0, Ll/l7i;->q:Ll/lol;

    .line 112
    .line 113
    check-cast v2, Ll/lnh;

    .line 114
    .line 115
    iget-object v2, v2, Ll/lnh;->Q:Lv/VText;

    .line 116
    .line 117
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    xor-int/2addr v0, v1

    .line 122
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 126
    .line 127
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 128
    .line 129
    const-string v2, "topic_latest"

    .line 130
    .line 131
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_b

    .line 136
    .line 137
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 138
    .line 139
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 140
    .line 141
    const-string v2, "topic_recommend"

    .line 142
    .line 143
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_b

    .line 148
    .line 149
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 150
    .line 151
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 152
    .line 153
    const-string v2, "from_group_detail_recommend"

    .line 154
    .line 155
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-nez v0, :cond_b

    .line 160
    .line 161
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 162
    .line 163
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 164
    .line 165
    const-string v2, "from_group_detail_new"

    .line 166
    .line 167
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-nez v0, :cond_b

    .line 172
    .line 173
    invoke-static {}, Ll/cmg;->s()Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_a

    .line 178
    .line 179
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 180
    .line 181
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 182
    .line 183
    const-string v2, "from_discover_discussion"

    .line 184
    .line 185
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-eqz v0, :cond_7

    .line 190
    .line 191
    invoke-static {}, Ll/pu20;->G()Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-eqz v0, :cond_b

    .line 196
    .line 197
    :cond_7
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 198
    .line 199
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 200
    .line 201
    const-string v2, "from_discover_dating"

    .line 202
    .line 203
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_8

    .line 208
    .line 209
    invoke-static {}, Ll/pu20;->D()Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-eqz v0, :cond_b

    .line 214
    .line 215
    :cond_8
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 216
    .line 217
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 218
    .line 219
    const-string v2, "from_activity_tab_one"

    .line 220
    .line 221
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-eqz v0, :cond_9

    .line 226
    .line 227
    invoke-static {}, Ll/pu20;->D()Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-eqz v0, :cond_b

    .line 232
    .line 233
    :cond_9
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 234
    .line 235
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 236
    .line 237
    const-string v2, "from_activity_tab_two"

    .line 238
    .line 239
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-eqz v0, :cond_a

    .line 244
    .line 245
    invoke-static {}, Ll/pu20;->D()Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-eqz v0, :cond_b

    .line 250
    .line 251
    :cond_a
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 252
    .line 253
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 254
    .line 255
    const-string v2, "from_poi_aggregation"

    .line 256
    .line 257
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-eqz v0, :cond_c

    .line 262
    .line 263
    :cond_b
    if-nez p1, :cond_c

    .line 264
    .line 265
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 266
    .line 267
    check-cast p1, Ll/lnh;

    .line 268
    .line 269
    iget-object p1, p1, Ll/lnh;->Q:Lv/VText;

    .line 270
    .line 271
    const/4 v0, 0x0

    .line 272
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 273
    .line 274
    .line 275
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 276
    .line 277
    iget-object p0, p0, Ll/dj70;->o:Ll/r6i;

    .line 278
    .line 279
    iput-boolean v1, p0, Ll/r6i;->a:Z

    .line 280
    .line 281
    :cond_c
    return-void
.end method

.method public final K(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 2
    .line 3
    check-cast p1, Ll/lnh;

    .line 4
    .line 5
    iget-object p1, p1, Ll/lnh;->Q:Lv/VText;

    .line 6
    .line 7
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 14
    .line 15
    check-cast p1, Ll/lnh;

    .line 16
    .line 17
    iget-object p1, p1, Ll/lnh;->O:Lv/VText;

    .line 18
    .line 19
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 26
    .line 27
    check-cast p0, Ll/lnh;

    .line 28
    .line 29
    iget-object p0, p0, Ll/lnh;->P:Lv/VText;

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 37
    .line 38
    check-cast p0, Ll/lnh;

    .line 39
    .line 40
    iget-object p0, p0, Ll/lnh;->P:Lv/VText;

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final L()V
    .locals 4

    .line 1
    invoke-static {}, Ll/owi;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 14
    .line 15
    const-string v1, "selfOnly"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    sget-object v0, Ll/t7i;->t:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 28
    .line 29
    check-cast v0, Ll/lnh;

    .line 30
    .line 31
    iget-object v0, v0, Ll/lnh;->J:Lv/VText;

    .line 32
    .line 33
    const/high16 v1, 0x40000000    # 2.0f

    .line 34
    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-static {v0, v1}, Ll/cai;->g(Landroid/widget/TextView;I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, Ll/t7i;->t:Ljava/lang/String;

    .line 44
    .line 45
    :cond_0
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 46
    .line 47
    check-cast v0, Ll/lnh;

    .line 48
    .line 49
    iget-object v0, v0, Ll/lnh;->J:Lv/VText;

    .line 50
    .line 51
    new-instance v1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/l7i;->o()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->k5:I

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    sget-object v2, Ll/t7i;->t:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v2, "\u00b7"

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    sget-object v2, Ll/t7i;->t:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 89
    .line 90
    check-cast p0, Ll/lnh;

    .line 91
    .line 92
    iget-object p0, p0, Ll/lnh;->J:Lv/VText;

    .line 93
    .line 94
    const/4 v0, 0x1

    .line 95
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_1
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 100
    .line 101
    check-cast p0, Ll/lnh;

    .line 102
    .line 103
    iget-object p0, p0, Ll/lnh;->J:Lv/VText;

    .line 104
    .line 105
    const/4 v0, 0x0

    .line 106
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final M(Z)V
    .locals 10

    .line 1
    invoke-static {}, Ll/cmg;->D0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "from_discover_discussion"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 10
    .line 11
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 12
    .line 13
    const-string v2, "from_nearby_falls_feed"

    .line 14
    .line 15
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 22
    .line 23
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 24
    .line 25
    const-string v2, "topic_recommend"

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 34
    .line 35
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 36
    .line 37
    const-string v2, "from_group_detail_recommend"

    .line 38
    .line 39
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 46
    .line 47
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Moment;->getRecommendTime()D

    .line 60
    .line 61
    .line 62
    move-result-wide v2

    .line 63
    const-wide/16 v4, 0x0

    .line 64
    .line 65
    cmpl-double v0, v2, v4

    .line 66
    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    if-nez p1, :cond_3

    .line 70
    .line 71
    :cond_1
    invoke-static {}, Ll/skh;->b()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 78
    .line 79
    .line 80
    move-result-wide v2

    .line 81
    long-to-double v2, v2

    .line 82
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Moment;->getRecommendTime()D

    .line 87
    .line 88
    .line 89
    move-result-wide v4

    .line 90
    cmpg-double v0, v2, v4

    .line 91
    .line 92
    if-gez v0, :cond_2

    .line 93
    .line 94
    const-string v0, "1\u79d2\u4ee5\u524d\u63a8\u8350"

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Moment;->getRecommendTime()D

    .line 102
    .line 103
    .line 104
    move-result-wide v2

    .line 105
    invoke-static {v2, v3}, Ll/ksg;->C0(D)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    goto :goto_0

    .line 110
    :cond_3
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-wide v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 115
    .line 116
    invoke-static {v2, v3}, Ll/p6i;->q(D)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    :goto_0
    iget-object v2, p0, Ll/l7i;->a:Ll/dj70;

    .line 121
    .line 122
    iget-object v2, v2, Ll/dj70;->b:Ljava/lang/String;

    .line 123
    .line 124
    const-string v3, "from_discover_dating"

    .line 125
    .line 126
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    const-string v4, "from_activity_tab_two"

    .line 131
    .line 132
    const-string v5, "from_activity_tab_one"

    .line 133
    .line 134
    if-eqz v2, :cond_4

    .line 135
    .line 136
    if-eqz p1, :cond_8

    .line 137
    .line 138
    :cond_4
    iget-object v2, p0, Ll/l7i;->a:Ll/dj70;

    .line 139
    .line 140
    iget-object v2, v2, Ll/dj70;->b:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    if-eqz v2, :cond_5

    .line 147
    .line 148
    if-eqz p1, :cond_8

    .line 149
    .line 150
    :cond_5
    iget-object v2, p0, Ll/l7i;->a:Ll/dj70;

    .line 151
    .line 152
    iget-object v2, v2, Ll/dj70;->b:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    if-eqz v2, :cond_6

    .line 159
    .line 160
    if-eqz p1, :cond_8

    .line 161
    .line 162
    :cond_6
    invoke-static {}, Ll/cmg;->C()Z

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    if-eqz v2, :cond_7

    .line 167
    .line 168
    iget-object v2, p0, Ll/l7i;->a:Ll/dj70;

    .line 169
    .line 170
    iget-object v2, v2, Ll/dj70;->b:Ljava/lang/String;

    .line 171
    .line 172
    invoke-static {v2}, Ll/ksg;->a0(Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    if-nez v2, :cond_8

    .line 177
    .line 178
    :cond_7
    iget-object v2, p0, Ll/l7i;->a:Ll/dj70;

    .line 179
    .line 180
    iget-object v2, v2, Ll/dj70;->b:Ljava/lang/String;

    .line 181
    .line 182
    const-string v6, "from_poi_aggregation"

    .line 183
    .line 184
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    if-eqz v2, :cond_9

    .line 189
    .line 190
    if-nez p1, :cond_9

    .line 191
    .line 192
    :cond_8
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    iget-wide v6, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 197
    .line 198
    double-to-long v6, v6

    .line 199
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 200
    .line 201
    iget-object p1, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 202
    .line 203
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getLastActiveTimeMillis()J

    .line 204
    .line 205
    .line 206
    move-result-wide v8

    .line 207
    invoke-static {v6, v7, v8, v9}, Ll/ksg;->H(JJ)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    :cond_9
    invoke-static {}, Ll/cmg;->s()Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    const-string v2, ""

    .line 216
    .line 217
    if-eqz p1, :cond_e

    .line 218
    .line 219
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 220
    .line 221
    iget-object p1, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 222
    .line 223
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    if-eqz p1, :cond_a

    .line 228
    .line 229
    invoke-static {}, Ll/pu20;->I()Z

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    if-eqz p1, :cond_d

    .line 234
    .line 235
    :cond_a
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 236
    .line 237
    iget-object p1, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    if-eqz p1, :cond_b

    .line 244
    .line 245
    invoke-static {}, Ll/pu20;->F()Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-eqz p1, :cond_d

    .line 250
    .line 251
    :cond_b
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 252
    .line 253
    iget-object p1, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-eqz p1, :cond_c

    .line 260
    .line 261
    invoke-static {}, Ll/pu20;->F()Z

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    if-eqz p1, :cond_d

    .line 266
    .line 267
    :cond_c
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 268
    .line 269
    iget-object p1, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-eqz p1, :cond_e

    .line 276
    .line 277
    invoke-static {}, Ll/pu20;->F()Z

    .line 278
    .line 279
    .line 280
    move-result p1

    .line 281
    if-nez p1, :cond_e

    .line 282
    .line 283
    :cond_d
    move-object v0, v2

    .line 284
    :cond_e
    invoke-static {}, Ll/cmg;->z()Z

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    if-eqz p1, :cond_f

    .line 289
    .line 290
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 291
    .line 292
    iget-object p1, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 293
    .line 294
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 295
    .line 296
    .line 297
    move-result p1

    .line 298
    if-eqz p1, :cond_f

    .line 299
    .line 300
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 301
    .line 302
    iget-object p1, p1, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 303
    .line 304
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result p1

    .line 308
    if-eqz p1, :cond_f

    .line 309
    .line 310
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 311
    .line 312
    iget-object p1, p1, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 313
    .line 314
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 315
    .line 316
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 317
    .line 318
    .line 319
    move-result p1

    .line 320
    if-nez p1, :cond_f

    .line 321
    .line 322
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 323
    .line 324
    iget-object p1, p1, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 325
    .line 326
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->recommendReason:Ljava/lang/String;

    .line 327
    .line 328
    :cond_f
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 329
    .line 330
    check-cast p1, Ll/lnh;

    .line 331
    .line 332
    iget-object p1, p1, Ll/lnh;->O:Lv/VText;

    .line 333
    .line 334
    if-nez v0, :cond_10

    .line 335
    .line 336
    goto :goto_1

    .line 337
    :cond_10
    move-object v2, v0

    .line 338
    :goto_1
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 339
    .line 340
    .line 341
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 342
    .line 343
    check-cast p0, Ll/lnh;

    .line 344
    .line 345
    iget-object p0, p0, Ll/lnh;->O:Lv/VText;

    .line 346
    .line 347
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 348
    .line 349
    .line 350
    move-result p1

    .line 351
    xor-int/lit8 p1, p1, 0x1

    .line 352
    .line 353
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 354
    .line 355
    .line 356
    return-void
.end method

.method public final N()Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 13
    .line 14
    iget-object v0, v0, Ll/dj70;->j:Ll/n570;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 23
    .line 24
    iget-object v0, v0, Ll/dj70;->j:Ll/n570;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/n570;->p()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 33
    .line 34
    iget-object v2, v0, Ll/dj70;->j:Ll/n570;

    .line 35
    .line 36
    iget-object v2, v2, Ll/n570;->b:Ll/qn00;

    .line 37
    .line 38
    iget-object v0, v0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v2, v0}, Ll/qn00;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    return-object v1

    .line 49
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->states:Ljava/util/List;

    .line 50
    .line 51
    new-instance v1, Ll/s7i;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/s7i;-><init>(Ll/t7i;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_1
    return-object v1
.end method

.method public final O()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/l7i;->o()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 11
    .line 12
    check-cast v0, Ll/lnh;

    .line 13
    .line 14
    iget-object v0, v0, Ll/lnh;->T:Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/data/MomentLabels;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MomentLabels;->display:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 55
    .line 56
    check-cast v0, Ll/lnh;

    .line 57
    .line 58
    iget-object v0, v0, Ll/lnh;->S:Landroid/widget/FrameLayout;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 64
    .line 65
    check-cast v0, Ll/lnh;

    .line 66
    .line 67
    iget-object v0, v0, Ll/lnh;->T:Landroid/widget/TextView;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Lcom/p1/mobile/putong/data/MomentLabels;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/p1/mobile/putong/data/MomentLabels;->display:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 87
    .line 88
    check-cast v0, Ll/lnh;

    .line 89
    .line 90
    iget-object v0, v0, Ll/lnh;->T:Landroid/widget/TextView;

    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v2, p0, Ll/l7i;->q:Ll/lol;

    .line 97
    .line 98
    check-cast v2, Ll/lnh;

    .line 99
    .line 100
    iget-object v2, v2, Ll/lnh;->T:Landroid/widget/TextView;

    .line 101
    .line 102
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    check-cast v2, Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    const/high16 v2, 0x41000000    # 8.0f

    .line 113
    .line 114
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    int-to-float v2, v2

    .line 119
    add-float/2addr v0, v2

    .line 120
    float-to-int v0, v0

    .line 121
    iget-object v2, p0, Ll/l7i;->q:Ll/lol;

    .line 122
    .line 123
    check-cast v2, Ll/lnh;

    .line 124
    .line 125
    iget-object v2, v2, Ll/lnh;->T:Landroid/widget/TextView;

    .line 126
    .line 127
    new-instance v3, Ll/q7i;

    .line 128
    .line 129
    invoke-direct {v3, p0, v0}, Ll/q7i;-><init>(Ll/t7i;I)V

    .line 130
    .line 131
    .line 132
    invoke-static {v2, v3}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 136
    .line 137
    check-cast p0, Ll/lnh;

    .line 138
    .line 139
    iget-object p0, p0, Ll/lnh;->f:Landroid/widget/RelativeLayout;

    .line 140
    .line 141
    invoke-static {p0, v1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_0
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 146
    .line 147
    check-cast v0, Ll/lnh;

    .line 148
    .line 149
    iget-object v0, v0, Ll/lnh;->f:Landroid/widget/RelativeLayout;

    .line 150
    .line 151
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-eqz v0, :cond_1

    .line 156
    .line 157
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 158
    .line 159
    check-cast v0, Ll/lnh;

    .line 160
    .line 161
    iget-object v0, v0, Ll/lnh;->S:Landroid/widget/FrameLayout;

    .line 162
    .line 163
    const/4 v2, 0x4

    .line 164
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 168
    .line 169
    check-cast v0, Ll/lnh;

    .line 170
    .line 171
    iget-object v0, v0, Ll/lnh;->f:Landroid/widget/RelativeLayout;

    .line 172
    .line 173
    const/4 v2, 0x0

    .line 174
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    invoke-static {v0, v2}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 182
    .line 183
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 184
    .line 185
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 186
    .line 187
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 188
    .line 189
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 190
    .line 191
    iget-object v0, v0, Lcom/p1/mobile/putong/data/HeadFrame;->expiredTime:Ljava/util/List;

    .line 192
    .line 193
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    if-nez v2, :cond_1

    .line 198
    .line 199
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    check-cast v0, Ljava/lang/Double;

    .line 204
    .line 205
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 206
    .line 207
    .line 208
    move-result-wide v0

    .line 209
    invoke-static {}, Ll/pzi0;->o()J

    .line 210
    .line 211
    .line 212
    move-result-wide v2

    .line 213
    long-to-double v2, v2

    .line 214
    cmpl-double v0, v0, v2

    .line 215
    .line 216
    if-lez v0, :cond_1

    .line 217
    .line 218
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 219
    .line 220
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 221
    .line 222
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 223
    .line 224
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 225
    .line 226
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 227
    .line 228
    iget-object v0, v0, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    .line 229
    .line 230
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    if-nez v0, :cond_1

    .line 235
    .line 236
    invoke-virtual {p0}, Ll/l7i;->o()Lcom/p1/mobile/android/app/Act;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 241
    .line 242
    if-eqz v0, :cond_1

    .line 243
    .line 244
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 245
    .line 246
    check-cast p0, Ll/lnh;

    .line 247
    .line 248
    iget-object p0, p0, Ll/lnh;->f:Landroid/widget/RelativeLayout;

    .line 249
    .line 250
    const/high16 v0, 0x40000000    # 2.0f

    .line 251
    .line 252
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    invoke-static {p0, v0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 257
    .line 258
    .line 259
    :cond_1
    return-void
.end method

.method public final P()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "from_discover_discussion"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 14
    .line 15
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "from_discover_dating"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 26
    .line 27
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 28
    .line 29
    const-string v1, "from_nearby_focus"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 38
    .line 39
    iget-boolean p0, p0, Ll/dj70;->c:Z

    .line 40
    .line 41
    if-nez p0, :cond_1

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public final Q(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 0

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public final R(Lcom/p1/mobile/putong/data/BubbleInfo;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/BubbleInfo;->checkStateTimeIsValid()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/l7i;->o()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 20
    .line 21
    check-cast p1, Ll/lnh;

    .line 22
    .line 23
    iget-object p1, p1, Ll/lnh;->T:Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 36
    .line 37
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/data/MomentLabels;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MomentLabels;->display:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_1

    .line 62
    .line 63
    return v0

    .line 64
    :cond_1
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->hasHeadFrame:Z

    .line 69
    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    return v0

    .line 73
    :cond_2
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 74
    .line 75
    iget-boolean v1, p1, Ll/dj70;->c:Z

    .line 76
    .line 77
    if-nez v1, :cond_3

    .line 78
    .line 79
    iget-object v1, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 80
    .line 81
    invoke-static {p1, v1}, Ll/u6i;->b(Ll/dj70;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/l7i;->o()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    instance-of p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;

    .line 92
    .line 93
    if-nez p0, :cond_3

    .line 94
    .line 95
    return v0

    .line 96
    :cond_3
    const/4 p0, 0x1

    .line 97
    return p0

    .line 98
    :cond_4
    :goto_0
    return v0
.end method

.method public final S(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "like_relation_fuction"

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    new-instance v1, Lorg/json/JSONObject;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "likeButton"

    .line 31
    .line 32
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    return v0

    .line 43
    :cond_1
    new-instance v1, Lorg/json/JSONObject;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 49
    .line 50
    .line 51
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    return p0

    .line 53
    :catch_0
    :cond_2
    return v0
.end method

.method public final T(Ljava/lang/String;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "from_like"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v2, -0x1

    .line 23
    sparse-switch v0, :sswitch_data_0

    .line 24
    .line 25
    .line 26
    :goto_0
    move v1, v2

    .line 27
    goto :goto_1

    .line 28
    :sswitch_0
    const-string v0, "from_nearby_focus"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v1, 0x4

    .line 38
    goto :goto_1

    .line 39
    :sswitch_1
    const-string v0, "topic_latest"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v1, 0x3

    .line 49
    goto :goto_1

    .line 50
    :sswitch_2
    const-string v0, "from_discover_dating"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 v1, 0x2

    .line 60
    goto :goto_1

    .line 61
    :sswitch_3
    const-string v0, "topic_recommend"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_5

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :sswitch_4
    const-string v0, "from_discover_discussion"

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_4
    const/4 v1, 0x0

    .line 80
    :cond_5
    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 81
    .line 82
    .line 83
    const/4 p1, 0x0

    .line 84
    goto :goto_2

    .line 85
    :pswitch_0
    const-string p1, "follow"

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :pswitch_1
    const-string p1, "nearby"

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :pswitch_2
    const-string p1, "topic"

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :pswitch_3
    const-string p1, "discussion"

    .line 95
    .line 96
    :goto_2
    invoke-virtual {p0, p1}, Ll/t7i;->S(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    return p0

    .line 101
    :sswitch_data_0
    .sparse-switch
        -0x74d799d7 -> :sswitch_4
        -0x61919654 -> :sswitch_3
        0x41382f6c -> :sswitch_2
        0x47385c97 -> :sswitch_1
        0x4aa45d8d -> :sswitch_0
    .end sparse-switch

    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public final U(Ll/dj70;)Landroid/util/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dj70;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/dj70;->c:Z

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    new-instance p0, Landroid/util/Pair;

    .line 9
    .line 10
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-direct {p0, p1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    if-eqz p0, :cond_5

    .line 19
    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-static {}, Ll/ksg;->w0()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_2

    .line 32
    .line 33
    new-instance p0, Landroid/util/Pair;

    .line 34
    .line 35
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-direct {p0, p1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    invoke-static {}, Ll/cmg;->v()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_3

    .line 46
    .line 47
    invoke-static {}, Ll/cmg;->w()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    :cond_3
    iget-object p0, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p0}, Ll/pu20;->B(Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    iget-object p0, p1, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 62
    .line 63
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_4

    .line 68
    .line 69
    iget-object p0, p1, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-nez p0, :cond_4

    .line 78
    .line 79
    iget-object p0, p1, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->relationshipName:Ljava/lang/String;

    .line 82
    .line 83
    const-string p1, "\u559c\u6b22\u4e86\u4f60"

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_4

    .line 90
    .line 91
    new-instance p0, Landroid/util/Pair;

    .line 92
    .line 93
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 94
    .line 95
    invoke-static {}, Ll/ksg;->x0()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-direct {p0, p1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return-object p0

    .line 103
    :cond_4
    new-instance p0, Landroid/util/Pair;

    .line 104
    .line 105
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 106
    .line 107
    invoke-direct {p0, p1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    return-object p0

    .line 111
    :cond_5
    :goto_0
    new-instance p0, Landroid/util/Pair;

    .line 112
    .line 113
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 114
    .line 115
    invoke-direct {p0, p1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    return-object p0
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic W(I[I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-gtz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 23
    .line 24
    check-cast v0, Ll/lnh;

    .line 25
    .line 26
    iget-object v0, v0, Ll/lnh;->T:Landroid/widget/TextView;

    .line 27
    .line 28
    new-instance v1, Ll/tmd0;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/p1/mobile/putong/data/MomentLabels;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MomentLabels;->bgColor:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    const/high16 v3, 0x40a00000    # 5.0f

    .line 50
    .line 51
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    aget v2, p2, v2

    .line 56
    .line 57
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    const/4 v2, 0x1

    .line 62
    aget p2, p2, v2

    .line 63
    .line 64
    invoke-direct {v1, p0, v3, p1, p2}, Ll/tmd0;-><init>(IIII)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Ll/l7i;->o:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 29
    .line 30
    iget-object p0, p0, Ll/l7i;->p:Lv/VDraweeView;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 35
    .line 36
    sget v1, Ll/qa00;->m:I

    .line 37
    .line 38
    invoke-virtual {v0, p0, p1, v1, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic Y(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "from_nearby_focus"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 14
    .line 15
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "from_like"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 26
    .line 27
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 28
    .line 29
    const-string v1, "from_discover_discussion"

    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 38
    .line 39
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 40
    .line 41
    const-string v1, "from_discover_dating"

    .line 42
    .line 43
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    :cond_0
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 50
    .line 51
    iget-object v0, v0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 62
    .line 63
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 64
    .line 65
    move-object v1, v0

    .line 66
    check-cast v1, Ll/lnh;

    .line 67
    .line 68
    iget-object v1, v1, Ll/lnh;->n:Landroid/widget/FrameLayout;

    .line 69
    .line 70
    check-cast v0, Ll/lnh;

    .line 71
    .line 72
    iget-object v0, v0, Ll/lnh;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 73
    .line 74
    invoke-virtual {p0, p1, v1, v0}, Ll/t7i;->i0(Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public final Z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v1, v0, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 21
    .line 22
    iget-object v1, v0, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 25
    .line 26
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ll/jka;->g8(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/p7i;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/p7i;-><init>(Ll/t7i;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 2
    .line 3
    check-cast v0, Ll/lnh;

    .line 4
    .line 5
    iget-object v0, v0, Ll/lnh;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 14
    .line 15
    check-cast p0, Ll/lnh;

    .line 16
    .line 17
    iget-object p0, p0, Ll/lnh;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;->j()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v1, v0, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 21
    .line 22
    iget-object v0, v0, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 25
    .line 26
    iget-object v1, v1, Ll/jka;->z1:Lrx/subjects/b;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/r7i;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/r7i;-><init>(Ll/t7i;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method public final b0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/dj70;->c:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 9
    .line 10
    check-cast p0, Ll/lnh;

    .line 11
    .line 12
    iget-object p0, p0, Ll/lnh;->U:Lv/VLinear;

    .line 13
    .line 14
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, v0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 27
    .line 28
    iget-object v0, v0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 39
    .line 40
    iget-object v0, v0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/InteractionReason;->text:Ljava/lang/String;

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
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 53
    .line 54
    check-cast v0, Ll/lnh;

    .line 55
    .line 56
    iget-object v0, v0, Ll/lnh;->f:Landroid/widget/RelativeLayout;

    .line 57
    .line 58
    const/high16 v1, 0x41c80000    # 25.0f

    .line 59
    .line 60
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 68
    .line 69
    check-cast v0, Ll/lnh;

    .line 70
    .line 71
    iget-object v0, v0, Ll/lnh;->U:Lv/VLinear;

    .line 72
    .line 73
    const/4 v1, 0x1

    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 78
    .line 79
    check-cast v0, Ll/lnh;

    .line 80
    .line 81
    iget-object v0, v0, Ll/lnh;->W:Lv/VText;

    .line 82
    .line 83
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 84
    .line 85
    iget-object v1, v1, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/InteractionReason;->text:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 95
    .line 96
    iget-object v1, p0, Ll/l7i;->q:Ll/lol;

    .line 97
    .line 98
    check-cast v1, Ll/lnh;

    .line 99
    .line 100
    iget-object v1, v1, Ll/lnh;->V:Lv/VDraweeView;

    .line 101
    .line 102
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 103
    .line 104
    iget-object p0, p0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/RawFeed;->interaction:Lcom/p1/mobile/putong/feed/data/InteractionReason;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/InteractionReason;->icon:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v1, p0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_1
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 115
    .line 116
    check-cast p0, Ll/lnh;

    .line 117
    .line 118
    iget-object p0, p0, Ll/lnh;->U:Lv/VLinear;

    .line 119
    .line 120
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final c0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/dj70;->c:Z

    .line 4
    .line 5
    if-nez v1, :cond_4

    .line 6
    .line 7
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "from_like"

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_4

    .line 16
    .line 17
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 18
    .line 19
    iget-object v0, v0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_4

    .line 26
    .line 27
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 28
    .line 29
    iget-object v1, v0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 30
    .line 31
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/RawFeed;->showLikeSplitLine:Z

    .line 32
    .line 33
    if-eqz v1, :cond_4

    .line 34
    .line 35
    iget-object v1, p0, Ll/l7i;->q:Ll/lol;

    .line 36
    .line 37
    check-cast v1, Ll/lnh;

    .line 38
    .line 39
    iget-object v1, v1, Ll/lnh;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 40
    .line 41
    iget v0, v0, Ll/dj70;->h:I

    .line 42
    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    const/high16 v0, 0x40400000    # 3.0f

    .line 46
    .line 47
    :goto_0
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    const/high16 v0, 0x41700000    # 15.0f

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :goto_1
    invoke-static {v1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 59
    .line 60
    check-cast v0, Ll/lnh;

    .line 61
    .line 62
    iget-object v0, v0, Ll/lnh;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 63
    .line 64
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 65
    .line 66
    iget v1, v1, Ll/dj70;->h:I

    .line 67
    .line 68
    if-nez v1, :cond_1

    .line 69
    .line 70
    const/high16 v1, 0x41200000    # 10.0f

    .line 71
    .line 72
    :goto_2
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    goto :goto_3

    .line 77
    :cond_1
    const/high16 v1, 0x41a80000    # 21.0f

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :goto_3
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 84
    .line 85
    check-cast v0, Ll/lnh;

    .line 86
    .line 87
    iget-object v0, v0, Ll/lnh;->c:Lv/VText;

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const/4 v1, 0x1

    .line 94
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 98
    .line 99
    check-cast v0, Ll/lnh;

    .line 100
    .line 101
    iget-object v0, v0, Ll/lnh;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 102
    .line 103
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 107
    .line 108
    check-cast v0, Ll/lnh;

    .line 109
    .line 110
    iget-object v0, v0, Ll/lnh;->c:Lv/VText;

    .line 111
    .line 112
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 113
    .line 114
    iget v1, v1, Ll/dj70;->h:I

    .line 115
    .line 116
    if-nez v1, :cond_2

    .line 117
    .line 118
    const-string v1, "\u559c\u6b22\u7684\u4eba\u65b0\u52a8\u6001\u4f1a\u51fa\u73b0\u5728\u8fd9\u91cc"

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_2
    const-string v1, "\u559c\u6b22\u7684\u4eba\u8fd1\u671f\u52a8\u6001\u90fd\u770b\u5b8c\u4e86"

    .line 122
    .line 123
    :goto_4
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 127
    .line 128
    check-cast v0, Ll/lnh;

    .line 129
    .line 130
    iget-object v0, v0, Ll/lnh;->d:Lv/VText;

    .line 131
    .line 132
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 133
    .line 134
    iget p0, p0, Ll/dj70;->h:I

    .line 135
    .line 136
    if-nez p0, :cond_3

    .line 137
    .line 138
    const-string p0, "\u4e3a\u4f60\u63a8\u8350\u4e86\u4e00\u4e9b\u53ef\u80fd\u559c\u6b22\u7684\u52a8\u6001"

    .line 139
    .line 140
    goto :goto_5

    .line 141
    :cond_3
    const-string p0, "\u4e3a\u4f60\u63a8\u8350\u66f4\u591a\u53ef\u80fd\u559c\u6b22\u7684\u52a8\u6001"

    .line 142
    .line 143
    :goto_5
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_4
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 148
    .line 149
    check-cast v0, Ll/lnh;

    .line 150
    .line 151
    iget-object v0, v0, Ll/lnh;->e:Lv/VFrame;

    .line 152
    .line 153
    const/4 v1, 0x0

    .line 154
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 162
    .line 163
    check-cast p0, Ll/lnh;

    .line 164
    .line 165
    iget-object p0, p0, Ll/lnh;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 166
    .line 167
    const/4 v0, 0x0

    .line 168
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public final d0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 2
    .line 3
    check-cast v0, Ll/lnh;

    .line 4
    .line 5
    iget-object v0, v0, Ll/lnh;->i:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/t7i;->P()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 20
    .line 21
    check-cast v0, Ll/lnh;

    .line 22
    .line 23
    iget-object v0, v0, Ll/lnh;->i:Lv/VDraweeView;

    .line 24
    .line 25
    const/16 v1, 0x8

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 31
    .line 32
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/TailFrame;->expiredTime:Ljava/util/List;

    .line 41
    .line 42
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_0

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Ljava/lang/Double;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    invoke-static {}, Ll/pzi0;->o()J

    .line 60
    .line 61
    .line 62
    move-result-wide v4

    .line 63
    long-to-double v4, v4

    .line 64
    cmpl-double v0, v2, v4

    .line 65
    .line 66
    if-lez v0, :cond_0

    .line 67
    .line 68
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 69
    .line 70
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/data/TailFrame;->url:Ljava/util/List;

    .line 79
    .line 80
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_0

    .line 85
    .line 86
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 87
    .line 88
    check-cast v0, Ll/lnh;

    .line 89
    .line 90
    iget-object v0, v0, Ll/lnh;->i:Lv/VDraweeView;

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 93
    .line 94
    .line 95
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 96
    .line 97
    iget-object v2, p0, Ll/l7i;->q:Ll/lol;

    .line 98
    .line 99
    check-cast v2, Ll/lnh;

    .line 100
    .line 101
    iget-object v2, v2, Ll/lnh;->i:Lv/VDraweeView;

    .line 102
    .line 103
    iget-object v3, p0, Ll/l7i;->a:Ll/dj70;

    .line 104
    .line 105
    iget-object v3, v3, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 106
    .line 107
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 108
    .line 109
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 110
    .line 111
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 112
    .line 113
    iget-object v3, v3, Lcom/p1/mobile/putong/data/TailFrame;->url:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    check-cast v1, Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {v0, v2, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const/4 v0, 0x1

    .line 129
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Moment;->setHasHeadFrame(Z)V

    .line 130
    .line 131
    .line 132
    :cond_0
    return-void
.end method

.method public e()V
    .locals 8

    .line 1
    invoke-super {p0}, Ll/l7i;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 5
    .line 6
    iget-object v0, v0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 15
    .line 16
    iget-object v0, v0, Ll/dj70;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 17
    .line 18
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->isRoamHighlight:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/l7i;->b:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/t7i;->U(Ll/dj70;)Landroid/util/Pair;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 36
    .line 37
    iget-boolean v1, v1, Ll/dj70;->c:Z

    .line 38
    .line 39
    if-nez v1, :cond_8

    .line 40
    .line 41
    invoke-static {}, Ll/cmg;->K()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 48
    .line 49
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 50
    .line 51
    const-string v2, "topic_recommend"

    .line 52
    .line 53
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_8

    .line 58
    .line 59
    :cond_1
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v1, Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_8

    .line 68
    .line 69
    invoke-static {}, Ll/cmg;->O()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 76
    .line 77
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 78
    .line 79
    const-string v2, "from_group_detail_recommend"

    .line 80
    .line 81
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-nez v1, :cond_8

    .line 86
    .line 87
    :cond_2
    invoke-static {}, Ll/cmg;->O()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-nez v1, :cond_3

    .line 92
    .line 93
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 94
    .line 95
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 96
    .line 97
    const-string v2, "from_group_detail_new"

    .line 98
    .line 99
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-nez v1, :cond_8

    .line 104
    .line 105
    :cond_3
    invoke-static {}, Ll/cmg;->O()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_4

    .line 110
    .line 111
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 112
    .line 113
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {v1}, Ll/ksg;->T(Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-nez v1, :cond_8

    .line 120
    .line 121
    :cond_4
    invoke-static {}, Ll/cmg;->K()Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_5

    .line 126
    .line 127
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 128
    .line 129
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p0, v1}, Ll/t7i;->T(Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-nez v1, :cond_8

    .line 136
    .line 137
    :cond_5
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 138
    .line 139
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 140
    .line 141
    const-string v2, "from_live_square_tab"

    .line 142
    .line 143
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-nez v1, :cond_8

    .line 148
    .line 149
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 150
    .line 151
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 152
    .line 153
    const-string v2, "from_nearby_online"

    .line 154
    .line 155
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-nez v1, :cond_6

    .line 160
    .line 161
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 162
    .line 163
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 164
    .line 165
    const-string v2, "from_poi_aggregation"

    .line 166
    .line 167
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_7

    .line 172
    .line 173
    :cond_6
    invoke-static {}, Ll/cmg;->o()Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-eqz v1, :cond_7

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_7
    return-void

    .line 181
    :cond_8
    :goto_0
    iget-object v1, p0, Ll/t7i;->s:Ll/f7i;

    .line 182
    .line 183
    if-nez v1, :cond_9

    .line 184
    .line 185
    new-instance v1, Ll/f7i;

    .line 186
    .line 187
    invoke-direct {v1}, Ll/f7i;-><init>()V

    .line 188
    .line 189
    .line 190
    iput-object v1, p0, Ll/t7i;->s:Ll/f7i;

    .line 191
    .line 192
    :cond_9
    iget-object v2, p0, Ll/t7i;->s:Ll/f7i;

    .line 193
    .line 194
    iget-object v3, p0, Ll/l7i;->a:Ll/dj70;

    .line 195
    .line 196
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 197
    .line 198
    move-object v1, p0

    .line 199
    check-cast v1, Ll/lnh;

    .line 200
    .line 201
    iget-object v4, v1, Ll/lnh;->j:Landroid/widget/LinearLayout;

    .line 202
    .line 203
    move-object v1, p0

    .line 204
    check-cast v1, Ll/lnh;

    .line 205
    .line 206
    iget-object v5, v1, Ll/lnh;->k:Landroid/widget/TextView;

    .line 207
    .line 208
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 209
    .line 210
    move-object v6, v0

    .line 211
    check-cast v6, Ljava/lang/String;

    .line 212
    .line 213
    check-cast p0, Ll/lnh;

    .line 214
    .line 215
    iget-object v7, p0, Ll/lnh;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 216
    .line 217
    invoke-virtual/range {v2 .. v7}, Ll/f7i;->s(Ll/dj70;Landroid/view/View;Landroid/widget/TextView;Ljava/lang/String;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    .line 218
    .line 219
    .line 220
    return-void
.end method

.method public final e0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->needShowFrame()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/l7i;->q:Ll/lol;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    check-cast v1, Ll/lnh;

    .line 15
    .line 16
    iget-object v0, v1, Ll/lnh;->r:Lv/AutoVDraweeView;

    .line 17
    .line 18
    iget-object v1, p0, Ll/l7i;->a:Ll/dj70;

    .line 19
    .line 20
    iget-object v1, v1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->headFrameUrl()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1, v2}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/data/Moment;->setHasHeadFrame(Z)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    check-cast v1, Ll/lnh;

    .line 38
    .line 39
    iget-object v0, v1, Ll/lnh;->r:Lv/AutoVDraweeView;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 48
    .line 49
    check-cast v0, Ll/lnh;

    .line 50
    .line 51
    iget-object v0, v0, Ll/lnh;->r:Lv/AutoVDraweeView;

    .line 52
    .line 53
    const/16 v1, 0x8

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 59
    .line 60
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/data/HeadFrame;->expiredTime:Ljava/util/List;

    .line 69
    .line 70
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_1

    .line 75
    .line 76
    const/4 v1, 0x0

    .line 77
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ljava/lang/Double;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 84
    .line 85
    .line 86
    move-result-wide v3

    .line 87
    invoke-static {}, Ll/pzi0;->o()J

    .line 88
    .line 89
    .line 90
    move-result-wide v5

    .line 91
    long-to-double v5, v5

    .line 92
    cmpl-double v0, v3, v5

    .line 93
    .line 94
    if-lez v0, :cond_1

    .line 95
    .line 96
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 97
    .line 98
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    .line 107
    .line 108
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_1

    .line 113
    .line 114
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 115
    .line 116
    check-cast v0, Ll/lnh;

    .line 117
    .line 118
    iget-object v0, v0, Ll/lnh;->r:Lv/AutoVDraweeView;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 121
    .line 122
    .line 123
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 124
    .line 125
    iget-object v3, p0, Ll/l7i;->q:Ll/lol;

    .line 126
    .line 127
    check-cast v3, Ll/lnh;

    .line 128
    .line 129
    iget-object v3, v3, Ll/lnh;->r:Lv/AutoVDraweeView;

    .line 130
    .line 131
    iget-object v4, p0, Ll/l7i;->a:Ll/dj70;

    .line 132
    .line 133
    iget-object v4, v4, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 134
    .line 135
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 136
    .line 137
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 138
    .line 139
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 140
    .line 141
    iget-object v4, v4, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    .line 142
    .line 143
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    check-cast v1, Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {v0, v3, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ll/l7i;->x()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/data/Moment;->setHasHeadFrame(Z)V

    .line 157
    .line 158
    .line 159
    :cond_1
    return-void

    .line 160
    :cond_2
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 161
    .line 162
    iget-object p0, p0, Ll/dj70;->b:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/helper/exception/FeedGPException;->reportMomentDetailTopViewExc(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l7i;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/t7i;->N()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/t7i;->R(Lcom/p1/mobile/putong/data/BubbleInfo;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object v2, p0, Ll/l7i;->o:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 25
    .line 26
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    iget-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 50
    .line 51
    iget-object p0, p0, Ll/l7i;->p:Lv/VDraweeView;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 56
    .line 57
    sget v2, Ll/qa00;->m:I

    .line 58
    .line 59
    invoke-virtual {v1, p0, v0, v2, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    return-void
.end method

.method public g(Ll/dj70;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 2
    .line 3
    check-cast p1, Ll/lnh;

    .line 4
    .line 5
    iget-object p1, p1, Ll/lnh;->o:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 12
    .line 13
    check-cast p1, Ll/lnh;

    .line 14
    .line 15
    iget-object p1, p1, Ll/lnh;->r:Lv/AutoVDraweeView;

    .line 16
    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 21
    .line 22
    check-cast p1, Ll/lnh;

    .line 23
    .line 24
    iget-object p1, p1, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 31
    .line 32
    check-cast p1, Ll/lnh;

    .line 33
    .line 34
    iget-object p1, p1, Ll/lnh;->v:Lv/VImage;

    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/l7i;->q:Ll/lol;

    .line 40
    .line 41
    check-cast p1, Ll/lnh;

    .line 42
    .line 43
    iget-object p1, p1, Ll/lnh;->i:Lv/VDraweeView;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/t7i;->P()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final g0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 2
    .line 3
    check-cast p0, Ll/lnh;

    .line 4
    .line 5
    iget-object p0, p0, Ll/lnh;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;

    .line 6
    .line 7
    const/16 p1, 0x8

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public h()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l7i;->h()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 5
    .line 6
    check-cast v0, Ll/lnh;

    .line 7
    .line 8
    iget-object v0, v0, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 9
    .line 10
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 17
    .line 18
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l7i;->o()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Ll/l7i;->a:Ll/dj70;

    .line 25
    .line 26
    iget-object v2, v2, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    iget-object v3, p0, Ll/l7i;->q:Ll/lol;

    .line 29
    .line 30
    check-cast v3, Ll/lnh;

    .line 31
    .line 32
    iget-object v3, v3, Ll/lnh;->v:Lv/VImage;

    .line 33
    .line 34
    invoke-interface {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 38
    .line 39
    check-cast v0, Ll/lnh;

    .line 40
    .line 41
    iget-object v0, v0, Ll/lnh;->v:Lv/VImage;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lv/VFrame;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 56
    .line 57
    check-cast p0, Ll/lnh;

    .line 58
    .line 59
    iget-object p0, p0, Ll/lnh;->v:Lv/VImage;

    .line 60
    .line 61
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_0

    .line 66
    .line 67
    const/4 p0, 0x0

    .line 68
    invoke-static {v0, p0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    const/high16 p0, 0x40000000    # 2.0f

    .line 73
    .line 74
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-static {v0, p0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method public final h0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v1, "from_live_square_tab"

    .line 6
    .line 7
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 16
    .line 17
    iget-object v1, v0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->liveCircleExtInfo:Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->mg()Ll/s1u;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Ll/l7i;->q:Ll/lol;

    .line 38
    .line 39
    check-cast v1, Ll/lnh;

    .line 40
    .line 41
    iget-object v1, v1, Ll/lnh;->D:Lv/VDraweeView;

    .line 42
    .line 43
    iget-object p0, p0, Ll/l7i;->a:Ll/dj70;

    .line 44
    .line 45
    iget-object p0, p0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->liveCircleExtInfo:Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;

    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;->coverUrl:Ljava/lang/String;

    .line 50
    .line 51
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;->grade:I

    .line 52
    .line 53
    invoke-interface {v0, v1, v2, p0}, Ll/s1u;->a(Lv/VDraweeView;Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 58
    .line 59
    check-cast p0, Ll/lnh;

    .line 60
    .line 61
    iget-object p0, p0, Ll/lnh;->D:Lv/VDraweeView;

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public i0(Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V
    .locals 7

    .line 1
    iget-object v0, p1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/high16 v1, 0x41700000    # 15.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v3, v1

    .line 10
    const/high16 v1, 0x40400000    # 3.0f

    .line 11
    .line 12
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    neg-int v1, v1

    .line 17
    int-to-float v4, v1

    .line 18
    const/high16 v5, 0x42200000    # 40.0f

    .line 19
    .line 20
    const/high16 v6, 0x42500000    # 52.0f

    .line 21
    .line 22
    move-object v2, p2

    .line 23
    move-object v1, p3

    .line 24
    invoke-static/range {v0 .. v6}, Ll/qyh;->a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Landroid/view/View;FFFF)Lcom/tantan/library/svga/SVGAnimationView;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    if-eqz p3, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    check-cast p3, Landroid/view/View$OnAttachStateChangeListener;

    .line 39
    .line 40
    invoke-virtual {v1, p3}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    new-instance p3, Ll/t7i$a;

    .line 44
    .line 45
    invoke-direct {p3, p0, p2, v1}, Ll/t7i$a;-><init>(Ll/t7i;Lcom/tantan/library/svga/SVGAnimationView;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p3}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    const/4 p3, 0x0

    .line 55
    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const-string v0, "https://auto.tancdn.com/v1/raw/2fe249b8-00f2-4002-b7d5-b7116c6c754013.pdf"

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const/4 p3, 0x1

    .line 75
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance p3, Ll/t7i$b;

    .line 80
    .line 81
    invoke-direct {p3, p0, p2, v1}, Ll/t7i$b;-><init>(Ll/t7i;Lcom/tantan/library/svga/SVGAnimationView;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l7i;->j()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 5
    .line 6
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/t7i;->G(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 12
    .line 13
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/t7i;->I(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 19
    .line 20
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/t7i;->M(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 26
    .line 27
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/t7i;->H(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 33
    .line 34
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/t7i;->J(Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 40
    .line 41
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/t7i;->K(Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/t7i;->e0()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/t7i;->d0()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/t7i;->L()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/t7i;->h0()V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 59
    .line 60
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ll/t7i;->g0(Z)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/t7i;->b0()V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/cmg;->k0()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    iget-object v0, p0, Ll/l7i;->a:Ll/dj70;

    .line 75
    .line 76
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 77
    .line 78
    if-eqz v0, :cond_0

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/t7i;->Z()V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    invoke-virtual {p0}, Ll/t7i;->f0()V

    .line 85
    .line 86
    .line 87
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/t7i;->c0()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public k(Ll/dj70;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/v7i;->k(Ll/dj70;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/l7i;->a:Ll/dj70;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dj70;->m:Ll/s6i;

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/s6i;->d()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/t7i;->O()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/lnh;

    .line 5
    .line 6
    iget-object v1, v1, Ll/lnh;->l:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    iput-object v1, p0, Ll/l7i;->b:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    move-object v1, v0

    .line 11
    check-cast v1, Ll/lnh;

    .line 12
    .line 13
    iget-object v1, v1, Ll/lnh;->j:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    iput-object v1, p0, Ll/l7i;->c:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    move-object v1, v0

    .line 18
    check-cast v1, Ll/lnh;

    .line 19
    .line 20
    iget-object v1, v1, Ll/lnh;->k:Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v1, p0, Ll/l7i;->d:Landroid/widget/TextView;

    .line 23
    .line 24
    move-object v1, v0

    .line 25
    check-cast v1, Ll/lnh;

    .line 26
    .line 27
    iget-object v1, v1, Ll/lnh;->m:Landroid/widget/RelativeLayout;

    .line 28
    .line 29
    iput-object v1, p0, Ll/l7i;->e:Landroid/widget/RelativeLayout;

    .line 30
    .line 31
    move-object v1, v0

    .line 32
    check-cast v1, Ll/lnh;

    .line 33
    .line 34
    iget-object v1, v1, Ll/lnh;->o:Lv/VDraweeView;

    .line 35
    .line 36
    iput-object v1, p0, Ll/l7i;->f:Lv/VDraweeView;

    .line 37
    .line 38
    move-object v1, v0

    .line 39
    check-cast v1, Ll/lnh;

    .line 40
    .line 41
    iget-object v1, v1, Ll/lnh;->v:Lv/VImage;

    .line 42
    .line 43
    iput-object v1, p0, Ll/l7i;->g:Lv/VImage;

    .line 44
    .line 45
    move-object v1, v0

    .line 46
    check-cast v1, Ll/lnh;

    .line 47
    .line 48
    iget-object v1, v1, Ll/lnh;->t:Lv/VLinear_FillerMeasure;

    .line 49
    .line 50
    iput-object v1, p0, Ll/l7i;->h:Lv/VLinear_FillerMeasure;

    .line 51
    .line 52
    move-object v1, v0

    .line 53
    check-cast v1, Ll/lnh;

    .line 54
    .line 55
    iget-object v1, v1, Ll/lnh;->u:Landroid/widget/TextView;

    .line 56
    .line 57
    iput-object v1, p0, Ll/l7i;->i:Landroid/widget/TextView;

    .line 58
    .line 59
    move-object v1, v0

    .line 60
    check-cast v1, Ll/lnh;

    .line 61
    .line 62
    iget-object v1, v1, Ll/lnh;->x:Landroid/widget/ImageView;

    .line 63
    .line 64
    iput-object v1, p0, Ll/l7i;->j:Landroid/widget/ImageView;

    .line 65
    .line 66
    move-object v1, v0

    .line 67
    check-cast v1, Ll/lnh;

    .line 68
    .line 69
    iget-object v1, v1, Ll/lnh;->y:Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;

    .line 70
    .line 71
    iput-object v1, p0, Ll/l7i;->k:Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;

    .line 72
    .line 73
    move-object v1, v0

    .line 74
    check-cast v1, Ll/lnh;

    .line 75
    .line 76
    iget-object v1, v1, Ll/lnh;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;

    .line 77
    .line 78
    iput-object v1, p0, Ll/l7i;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;

    .line 79
    .line 80
    move-object v1, v0

    .line 81
    check-cast v1, Ll/lnh;

    .line 82
    .line 83
    iget-object v1, v1, Ll/lnh;->R:Lv/VImage;

    .line 84
    .line 85
    iput-object v1, p0, Ll/l7i;->m:Lv/VImage;

    .line 86
    .line 87
    move-object v1, v0

    .line 88
    check-cast v1, Ll/lnh;

    .line 89
    .line 90
    iget-object v1, v1, Ll/lnh;->z:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 91
    .line 92
    iput-object v1, p0, Ll/l7i;->n:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 93
    .line 94
    move-object v1, v0

    .line 95
    check-cast v1, Ll/lnh;

    .line 96
    .line 97
    iget-object v1, v1, Ll/lnh;->p:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 98
    .line 99
    iput-object v1, p0, Ll/l7i;->o:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 100
    .line 101
    check-cast v0, Ll/lnh;

    .line 102
    .line 103
    iget-object v0, v0, Ll/lnh;->q:Lv/VDraweeView;

    .line 104
    .line 105
    iput-object v0, p0, Ll/l7i;->p:Lv/VDraweeView;

    .line 106
    .line 107
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l7i;->y()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 5
    .line 6
    check-cast v0, Ll/lnh;

    .line 7
    .line 8
    iget-object v0, v0, Ll/lnh;->r:Lv/AutoVDraweeView;

    .line 9
    .line 10
    const/16 v1, 0x8

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/l7i;->q:Ll/lol;

    .line 16
    .line 17
    check-cast p0, Ll/lnh;

    .line 18
    .line 19
    iget-object p0, p0, Ll/lnh;->i:Lv/VDraweeView;

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l7i;->z()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/l7i;->q:Ll/lol;

    .line 5
    .line 6
    check-cast v0, Ll/lnh;

    .line 7
    .line 8
    iget-object v0, v0, Ll/lnh;->n:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/l7i;->q(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
