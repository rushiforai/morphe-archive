.class public Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;
.super Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;
.source "SourceFile"


# instance fields
.field public d:Lv/VFrame;

.field public e:Landroid/view/View;

.field public f:Lv/VLinear;

.field public g:Lv/VImage;

.field public h:Lcom/tantan/library/svga/SVGAnimationView;

.field public i:Lv/VDraweeView;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VEditText;

.field public m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic A2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;->i2()V

    .line 2
    .line 3
    .line 4
    const-string p1, "e_close_click"

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->pageId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic B2(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, -0x1

    .line 8
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setResult(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;->i2()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "to_uid"

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->n:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    filled-new-array {p0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "e_send_compliment"

    .line 31
    .line 32
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method private synthetic C2(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->l:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->new_()Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->n:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "life_pic"

    .line 24
    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->category:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->identifier:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    const-string v1, "\u8d5e\u4e86\u4f60\u7684\u7167\u7247"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    move-object v1, p1

    .line 41
    :goto_0
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->new_()Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->o:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->picture:Ljava/lang/String;

    .line 50
    .line 51
    const-string v2, "\u751f\u6d3b\u7167"

    .line 52
    .line 53
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->title:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->p:Ljava/lang/String;

    .line 64
    .line 65
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Gh(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    if-nez v2, :cond_1

    .line 70
    .line 71
    const-string v2, ""

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 75
    .line 76
    :goto_1
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->desc:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    xor-int/lit8 p1, p1, 0x1

    .line 83
    .line 84
    iput-boolean p1, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->hasComment:Z

    .line 85
    .line 86
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->toJson()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 91
    .line 92
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->w2:Ll/zt9;

    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 99
    .line 100
    const-string v3, "profile_comment"

    .line 101
    .line 102
    invoke-static {v3}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {p1, v1, v2, v3}, Ll/zt9;->b3(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    new-instance v1, Ll/g1a0;

    .line 111
    .line 112
    invoke-direct {v1, v0}, Ll/g1a0;-><init>(Lcom/p1/mobile/putong/core/data/ProfileLikeComment;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    new-instance v0, Ll/h1a0;

    .line 124
    .line 125
    invoke-direct {v0, p0}, Ll/h1a0;-><init>(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;)V

    .line 126
    .line 127
    .line 128
    new-instance p0, Ll/i1a0;

    .line 129
    .line 130
    invoke-direct {p0}, Ll/i1a0;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method private synthetic e2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o2(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->B2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic p2(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->C2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q2(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->e2(Landroid/os/Bundle;)V

    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "user_id"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->n:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "pic"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->o:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "pic_tag"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->p:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->n:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->o:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->n:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-nez v0, :cond_1

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;->i2()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->k:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-string v3, "\u5938\u5938%s\u7684\u7167\u7247\uff0c\u5f00\u542f\u804a\u5929\u5427"

    .line 81
    .line 82
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->l:Lv/VEditText;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const-string v2, "\u5938\u5938%s\u7684\u7167\u7247"

    .line 100
    .line 101
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    new-instance v0, Ll/d1a0;

    .line 109
    .line 110
    invoke-direct {v0, p0}, Ll/d1a0;-><init>(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;)V

    .line 111
    .line 112
    .line 113
    const-wide/16 v1, 0xc8

    .line 114
    .line 115
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 116
    .line 117
    .line 118
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->i:Lv/VDraweeView;

    .line 121
    .line 122
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->o:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->g:Lv/VImage;

    .line 128
    .line 129
    new-instance v1, Ll/e1a0;

    .line 130
    .line 131
    invoke-direct {v1, p0}, Ll/e1a0;-><init>(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;)V

    .line 132
    .line 133
    .line 134
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 138
    .line 139
    new-instance v1, Ll/f1a0;

    .line 140
    .line 141
    invoke-direct {v1, p0}, Ll/f1a0;-><init>(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;)V

    .line 142
    .line 143
    .line 144
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;->i2()V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public static synthetic r2(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->z2()V

    return-void
.end method

.method public static synthetic s2(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 7
    .line 8
    iget-object v1, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object p0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic u2(Lcom/p1/mobile/putong/core/data/ProfileLikeComment;Ljava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->K1:Lcom/p1/mobile/putong/core/api/h;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->toJson()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/h;->w3(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic v2(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->A2(Landroid/view/View;)V

    return-void
.end method

.method public static y2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "user_id"

    .line 9
    .line 10
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p1, "pic"

    .line 14
    .line 15
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p1, "pic_tag"

    .line 19
    .line 20
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const/16 p1, 0x277f

    .line 24
    .line 25
    invoke-virtual {p0, v0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 26
    .line 27
    .line 28
    sget p1, Ll/y7c0;->e:I

    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private synthetic z2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "https://fe-static.tancdn.com/v1/raw/8eda1a11-5419-4a73-a3bd-6b54d258c50a14.svga"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->w2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->g:Lv/VImage;

    .line 20
    .line 21
    sget v0, Ll/ibc0;->m7:I

    .line 22
    .line 23
    invoke-static {p2, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->j:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget v1, Ll/g9c0;->i:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->k:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget v1, Ll/g9c0;->g:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget v1, Ll/g9c0;->j:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->l:Lv/VEditText;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget v1, Ll/g9c0;->g:I

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 84
    .line 85
    .line 86
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->l:Lv/VEditText;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    sget v1, Ll/g9c0;->i:I

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->l:Lv/VEditText;

    .line 102
    .line 103
    invoke-static {p0}, Ll/wpe;->a(Lv/VEditText;)V

    .line 104
    .line 105
    .line 106
    :cond_0
    return-object p1
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/c1a0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/c1a0;-><init>(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public k2()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->e:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public l2()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->f:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public m2()Landroid/widget/EditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->l:Lv/VEditText;

    .line 2
    .line 3
    return-object p0
.end method

.method public n2()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;->d:Lv/VFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_avatar_compliment_pop"

    .line 2
    .line 3
    return-object p0
.end method

.method public w2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/j1a0;->b(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeLifePhotoAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
