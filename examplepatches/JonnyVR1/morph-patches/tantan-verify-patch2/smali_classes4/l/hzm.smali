.class public Ll/hzm;
.super Ll/f6l;
.source "SourceFile"


# instance fields
.field public f:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedBasicInfoRootLayout;

.field public g:Lv/VLinear;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public i:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f6l;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "personality"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 20
    .line 21
    const-string v0, "personality"

    .line 22
    .line 23
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 2

    .line 1
    new-instance p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p3, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    if-nez p4, :cond_0

    .line 16
    .line 17
    iget-object p3, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 18
    .line 19
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 20
    .line 21
    new-instance p4, Ll/fzm;

    .line 22
    .line 23
    invoke-direct {p4}, Ll/fzm;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {p3, p4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    :cond_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 31
    .line 32
    .line 33
    move-result p4

    .line 34
    iget-object p5, p0, Ll/hzm;->h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 35
    .line 36
    if-eqz p4, :cond_1

    .line 37
    .line 38
    sget-object p4, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 39
    .line 40
    sget v0, Lcom/p1/mobile/putong/core/R$string;->El:I

    .line 41
    .line 42
    invoke-virtual {p4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p4

    .line 46
    invoke-virtual {p5, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    new-instance p4, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v0, " "

    .line 63
    .line 64
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 68
    .line 69
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Wf:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p4

    .line 82
    invoke-virtual {p5, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    :goto_0
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 86
    .line 87
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 88
    .line 89
    new-instance p4, Ll/gzm;

    .line 90
    .line 91
    invoke-direct {p4}, Ll/gzm;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {p2, p4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    new-instance p4, Ll/hzm$a;

    .line 99
    .line 100
    invoke-direct {p4, p0, p3, p1}, Ll/hzm$a;-><init>(Ll/hzm;Ljava/util/ArrayList;Ljava/util/List;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Ll/hzm;->i:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;

    .line 107
    .line 108
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->e()V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Ll/hzm;->i:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardCommonLabelView;->d(Ljava/util/List;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public final F(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/izm;->a(Ll/hzm;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/hzm;->F(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
