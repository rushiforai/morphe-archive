.class public Ll/mb50;
.super Ll/o2n;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2n;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/mb50;Lcom/p1/mobile/putong/core/data/OfficialAdvertData;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/mb50;->n(Lcom/p1/mobile/putong/core/data/OfficialAdvertData;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/o2n;->h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D1:Ll/s59;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/s59;->g3()Lcom/p1/mobile/putong/core/data/OfficialAdvertData;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D1:Ll/s59;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/s59;->g3()Lcom/p1/mobile/putong/core/data/OfficialAdvertData;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, p1, p2, v0}, Ll/mb50;->m(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/OfficialAdvertData;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    sget p0, Ll/kec0;->w3:I

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-static {p1, p0, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final l(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    :try_start_0
    new-instance p0, Landroid/content/Intent;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "android.intent.action.VIEW"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    :catch_0
    :cond_0
    return-void
.end method

.method public final m(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/OfficialAdvertData;)V
    .locals 5

    .line 1
    sget v0, Ll/kec0;->B3:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p1, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    sget p2, Ll/adc0;->O:I

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Lv/VDraweeView;

    .line 18
    .line 19
    sget v1, Ll/adc0;->e5:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Landroid/widget/TextView;

    .line 26
    .line 27
    sget v2, Ll/adc0;->g:I

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Landroid/widget/TextView;

    .line 34
    .line 35
    sget v3, Ll/adc0;->z:I

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Lv/VDraweeView;

    .line 42
    .line 43
    sget v4, Ll/adc0;->h:I

    .line 44
    .line 45
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/widget/Button;

    .line 50
    .line 51
    iget-object v4, p3, Lcom/p1/mobile/putong/core/data/OfficialAdvertData;->titleText:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v1, v4}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/OfficialAdvertData;->desc:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v2, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/OfficialAdvertData;->buttonText:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/OfficialAdvertData;->advertLogo:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p0, p2, v1}, Ll/mb50;->o(Lv/VDraweeView;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object p2, p3, Lcom/p1/mobile/putong/core/data/OfficialAdvertData;->advertPic:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p0, v3, p2}, Ll/mb50;->o(Lv/VDraweeView;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    new-instance p2, Ll/lb50;

    .line 77
    .line 78
    invoke-direct {p2, p0, p3, p1}, Ll/lb50;-><init>(Ll/mb50;Lcom/p1/mobile/putong/core/data/OfficialAdvertData;Lcom/p1/mobile/android/app/Act;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D1:Ll/s59;

    .line 87
    .line 88
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/OfficialAdvertData;->advertId:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/s59;->l3(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/core/data/OfficialAdvertData;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p3, "ixxn_ad_channel"

    .line 2
    .line 3
    const-string v0, "tantan"

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    const-string v0, "ad_id"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/OfficialAdvertData;->advertId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {p3, v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    const-string v0, "e_messages_ad"

    .line 22
    .line 23
    const-string v1, "p_messages_ad"

    .line 24
    .line 25
    invoke-static {v0, v1, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/OfficialAdvertData;->buttonUrl:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, p1, p2}, Ll/mb50;->l(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final o(Lv/VDraweeView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
