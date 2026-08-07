.class public Ll/gk4;
.super Ll/h4;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/h4;-><init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h4;->c:Ll/rql;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/rql;->O()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "same_interests"

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_3

    .line 15
    .line 16
    iget-object v1, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 26
    .line 27
    iget-object v1, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 30
    .line 31
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {v0, v1, v3}, Ll/rgk0;->c(Lcom/p1/mobile/putong/data/Profile;Lcom/p1/mobile/putong/data/User;Ljava/util/List;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-object v1, p0, Ll/h4;->c:Ll/rql;

    .line 38
    .line 39
    invoke-interface {v1}, Ll/rql;->h0()Lv/VText;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/h4;->c:Ll/rql;

    .line 51
    .line 52
    invoke-interface {v1}, Ll/rql;->h0()Lv/VText;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const/4 v3, 0x1

    .line 57
    if-lez v0, :cond_1

    .line 58
    .line 59
    move v4, v3

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    move v4, v2

    .line 62
    :goto_0
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/h4;->c:Ll/rql;

    .line 66
    .line 67
    invoke-interface {p0}, Ll/rql;->h0()Lv/VText;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const/4 v1, 0x3

    .line 72
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {p0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 77
    .line 78
    .line 79
    if-lez v0, :cond_2

    .line 80
    .line 81
    return v3

    .line 82
    :cond_2
    return v2

    .line 83
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/h4;->c:Ll/rql;

    .line 84
    .line 85
    invoke-interface {p0}, Ll/rql;->h0()Lv/VText;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    return v2
.end method
