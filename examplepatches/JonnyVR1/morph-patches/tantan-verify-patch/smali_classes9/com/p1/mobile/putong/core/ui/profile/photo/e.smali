.class public Lcom/p1/mobile/putong/core/ui/profile/photo/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/profile/photo/a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    const-string p1, "\u91cd\u65b0\u88c1\u526a\u5934\u50cf"

    .line 7
    .line 8
    iget-object p3, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 9
    .line 10
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->EDIT_PICTURE:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p1, "\u66f4\u6362\u5934\u50cf"

    .line 23
    .line 24
    iget-object p3, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 25
    .line 26
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->CHOOSE_PICTURE:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const-string p1, "\u7f16\u8f91\u6807\u7b7e"

    .line 39
    .line 40
    iget-object p3, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 41
    .line 42
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->EDIT_PICTURE_TAG:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    const-string p1, "\u5220\u9664"

    .line 55
    .line 56
    iget-object p2, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->DELETE_PICTURE:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 67
    .line 68
    .line 69
    :cond_3
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    const-string p1, "\u91cd\u8bd5"

    .line 7
    .line 8
    iget-object p3, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 9
    .line 10
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->RETRY_UPLOAD:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p1, "\u5220\u9664"

    .line 23
    .line 24
    iget-object p2, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->DELETE_PICTURE:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->CHOOSE_PICTURE:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)V
    .locals 3

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/e;->c(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)Z

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    const-string p2, "\u91cd\u8bd5"

    .line 10
    .line 11
    const-string v0, "\u5220\u9664"

    .line 12
    .line 13
    filled-new-array {p2, v0}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-direct {p0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 22
    .line 23
    .line 24
    new-instance p2, Ll/w30$b;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {p2, v1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 34
    .line 35
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p2, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    new-instance v1, Ll/nk40;

    .line 46
    .line 47
    invoke-direct {v1, p1}, Ll/nk40;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-interface {p0, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    filled-new-array {v0}, [I

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget v1, Ll/j9c0;->h:I

    .line 63
    .line 64
    filled-new-array {v1}, [I

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {p2, v0, v1}, Ll/w30$b;->R([I[I)Ll/w30$b;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p2, p0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    new-instance p2, Ll/ok40;

    .line 77
    .line 78
    invoke-direct {p2, p1}, Ll/ok40;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, p2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ll/w30$b;->F()Ll/w30;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iput-object p0, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)Z
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/a;->c(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "\u91cd\u65b0\u88c1\u526a\u5934\u50cf"

    .line 15
    .line 16
    const-string v2, "\u5220\u9664"

    .line 17
    .line 18
    if-nez p2, :cond_2

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    instance-of p2, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    const-string v3, "\u66f4\u6362\u5934\u50cf"

    .line 27
    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    filled-new-array {v1, v3}, [Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-interface {p0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    filled-new-array {v3}, [Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-interface {p0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getConfig()Ll/xk1;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p2}, Ll/xk1;->r()Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_3

    .line 63
    .line 64
    const-string p2, "\u7f16\u8f91\u6807\u7b7e"

    .line 65
    .line 66
    invoke-interface {p0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    instance-of p2, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 74
    .line 75
    if-eqz p2, :cond_4

    .line 76
    .line 77
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-interface {p0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_4
    filled-new-array {v2}, [Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-interface {p0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 98
    .line 99
    .line 100
    :goto_0
    new-instance p2, Ll/w30$b;

    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-direct {p2, v1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 107
    .line 108
    .line 109
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 110
    .line 111
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 112
    .line 113
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {p2, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    new-instance v1, Ll/lk40;

    .line 122
    .line 123
    invoke-direct {v1, p1}, Ll/lk40;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-interface {p0, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    filled-new-array {v1}, [I

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    sget v2, Ll/j9c0;->h:I

    .line 139
    .line 140
    filled-new-array {v2}, [I

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {p2, v1, v2}, Ll/w30$b;->R([I[I)Ll/w30$b;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-virtual {p2, p0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    new-instance p2, Ll/mk40;

    .line 153
    .line 154
    invoke-direct {p2, p1}, Ll/mk40;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0, p2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-virtual {p0}, Ll/w30$b;->F()Ll/w30;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    iput-object p0, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 166
    .line 167
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 168
    .line 169
    .line 170
    return v0
.end method

.method public d(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)Z
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/a;->d(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    new-instance v2, Ll/pk40;

    .line 24
    .line 25
    invoke-direct {v2, p1}, Ll/pk40;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p0, v1, p2, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Kc(Lcom/p1/mobile/android/app/Act;ILl/x20;)V

    .line 29
    .line 30
    .line 31
    return v0
.end method
