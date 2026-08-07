.class public interface abstract Lcom/p1/mobile/putong/core/ui/profile/photo/a;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Landroid/view/View;)V
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

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lv/VListCell;Lv/VListCell$a;I)V
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

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->DELETE_PICTURE:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Landroid/view/View;)V
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


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/a;->d(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)Z

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    new-instance p0, Ll/w30$b;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-direct {p0, p2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 17
    .line 18
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p0, p2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p2, Ll/ba5;

    .line 29
    .line 30
    invoke-direct {p2, p1}, Ll/ba5;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 38
    .line 39
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->d:I

    .line 40
    .line 41
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    const/4 v0, 0x1

    .line 46
    new-array v0, v0, [Ljava/lang/CharSequence;

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    aput-object p2, v0, v1

    .line 50
    .line 51
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p0, p2}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    new-instance p2, Ll/ca5;

    .line 60
    .line 61
    invoke-direct {p2, p1}, Ll/ca5;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/w30$b;->F()Ll/w30;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iput-object p0, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/a;->d(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)Z

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
    move-result-object v0

    .line 30
    invoke-direct {p2, v0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 34
    .line 35
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p2, v0}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    new-instance v0, Ll/z95;

    .line 46
    .line 47
    invoke-direct {v0, p1}, Ll/z95;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, v0}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2, p0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    new-instance p2, Ll/aa5;

    .line 59
    .line 60
    invoke-direct {p2, p1}, Ll/aa5;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/w30$b;->F()Ll/w30;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    iput-object p0, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->d:Ll/w30;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public d(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method
