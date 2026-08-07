.class public Lcom/p1/mobile/putong/core/ui/profile/photo/c;
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

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V
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

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Landroid/view/View;)V
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

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lv/VListCell;Lv/VListCell$a;I)V
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
    const-string p1, "\u4ece\u76f8\u518c\u9009\u62e9"

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
    const-string p1, "\u9009\u62e9\u4e00\u6bb5\u89c6\u9891"

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
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->CHOOSE_VIDEO:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

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

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    const-string p1, "\u4ece\u76f8\u518c\u9009\u62e9"

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
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->CHOOSE_PICTURE:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p1, "\u9009\u62e9\u4e00\u6bb5\u89c6\u9891"

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
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->CHOOSE_VIDEO:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method


# virtual methods
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
    if-nez p2, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->i()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-ne p2, v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    instance-of p2, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    const-string v2, "\u9009\u62e9\u4e00\u6bb5\u89c6\u9891"

    .line 31
    .line 32
    const-string v3, "\u4ece\u76f8\u518c\u9009\u62e9"

    .line 33
    .line 34
    if-eqz p2, :cond_1

    .line 35
    .line 36
    filled-new-array {v1, v3, v2}, [Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-interface {p0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    filled-new-array {v3, v2}, [Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-interface {p0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    instance-of p2, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 65
    .line 66
    const-string v2, "\u5220\u9664"

    .line 67
    .line 68
    if-eqz p2, :cond_3

    .line 69
    .line 70
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-interface {p0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    filled-new-array {v2}, [Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-interface {p0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 91
    .line 92
    .line 93
    :goto_0
    new-instance p2, Ll/w30$b;

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-direct {p2, v1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 100
    .line 101
    .line 102
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 103
    .line 104
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p2, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    new-instance v1, Ll/jnd;

    .line 115
    .line 116
    invoke-direct {v1, p1}, Ll/jnd;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p2, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    invoke-virtual {p2, p0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    new-instance p2, Ll/knd;

    .line 128
    .line 129
    invoke-direct {p2, p1}, Ll/knd;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, p2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0}, Ll/w30$b;->F()Ll/w30;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    iput-object p0, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 141
    .line 142
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 143
    .line 144
    .line 145
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
    invoke-static {}, Ll/xra;->n()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    new-instance v2, Ll/lnd;

    .line 30
    .line 31
    invoke-direct {v2, p1}, Ll/lnd;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p0, v1, p2, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Kc(Lcom/p1/mobile/android/app/Act;ILl/x20;)V

    .line 35
    .line 36
    .line 37
    return v0

    .line 38
    :cond_1
    new-instance p0, Ll/w30$b;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-direct {p0, p2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 48
    .line 49
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 50
    .line 51
    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p0, p2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    new-instance p2, Ll/mnd;

    .line 60
    .line 61
    invoke-direct {p2, p1}, Ll/mnd;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const/4 p2, 0x2

    .line 69
    new-array p2, p2, [Ljava/lang/CharSequence;

    .line 70
    .line 71
    const-string v1, "\u4ece\u76f8\u518c\u9009\u62e9"

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    aput-object v1, p2, v2

    .line 75
    .line 76
    const-string v1, "\u9009\u62e9\u4e00\u6bb5\u89c6\u9891"

    .line 77
    .line 78
    aput-object v1, p2, v0

    .line 79
    .line 80
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p0, p2}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    new-instance p2, Ll/nnd;

    .line 89
    .line 90
    invoke-direct {p2, p1}, Ll/nnd;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0}, Ll/w30$b;->F()Ll/w30;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    iput-object p0, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 104
    .line 105
    .line 106
    return v0
.end method
