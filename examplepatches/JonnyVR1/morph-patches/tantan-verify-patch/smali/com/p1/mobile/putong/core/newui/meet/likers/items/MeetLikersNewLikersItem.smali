.class public Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VDraweeView;

.field public d:Lv/VIcon;

.field public e:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->S(ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jcy;->a(Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final R(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->q1:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public final synthetic S(ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    filled-new-array {p1}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h7()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const/4 v4, 0x0

    .line 38
    const-string v5, "p_meet_see,newlike"

    .line 39
    .line 40
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->n8(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {p3, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hg(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/android/app/Act$w;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p2, p1, p0}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    const/4 v0, 0x1

    .line 83
    invoke-interface {p1, p3, p2, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Nn(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    return-void

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    xor-int/lit8 v1, v0, 0x1

    .line 12
    .line 13
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 14
    .line 15
    iget v2, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 16
    .line 17
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 18
    .line 19
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    invoke-static {v3, v4}, Ll/q8g0;->k0(Lcom/p1/mobile/putong/data/ProfileZodiac;Z)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->hasPic()Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-eqz v5, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profile180()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 v5, 0x0

    .line 46
    :goto_0
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    if-nez v6, :cond_2

    .line 51
    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 55
    .line 56
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->c:Lv/VDraweeView;

    .line 57
    .line 58
    const/4 v7, 0x2

    .line 59
    const/16 v8, 0x8

    .line 60
    .line 61
    invoke-virtual {v0, v6, v5, v7, v8}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 66
    .line 67
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->c:Lv/VDraweeView;

    .line 68
    .line 69
    sget v7, Ll/qa00;->D:I

    .line 70
    .line 71
    invoke-virtual {v0, v6, v5, v7, v7}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 72
    .line 73
    .line 74
    :cond_2
    :goto_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->R(Lcom/p1/mobile/putong/data/User;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const/4 v5, 0x1

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->d:Lv/VIcon;

    .line 82
    .line 83
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->d:Lv/VIcon;

    .line 87
    .line 88
    sget v2, Ll/gbc0;->i1:I

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->e:Lv/VText;

    .line 94
    .line 95
    const-string v2, "\u5f53\u524d\u5728\u7ebf"

    .line 96
    .line 97
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 104
    .line 105
    invoke-virtual {v0, p1}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_4

    .line 110
    .line 111
    const/16 v0, 0x2710

    .line 112
    .line 113
    if-gt v2, v0, :cond_4

    .line 114
    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v2, "\u8ddd\u79bb"

    .line 118
    .line 119
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 123
    .line 124
    invoke-static {v2, v5}, Ll/q8g0;->q(Lcom/p1/mobile/putong/data/Location;Z)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->e:Lv/VText;

    .line 136
    .line 137
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->e:Lv/VText;

    .line 142
    .line 143
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->d:Lv/VIcon;

    .line 147
    .line 148
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    :goto_3
    new-instance v0, Ll/icy;

    .line 152
    .line 153
    invoke-direct {v0, p0, v1, p1}, Ll/icy;-><init>(Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;ZLcom/p1/mobile/putong/data/User;)V

    .line 154
    .line 155
    .line 156
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
