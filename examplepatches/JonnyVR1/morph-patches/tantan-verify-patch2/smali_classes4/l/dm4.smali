.class public Ll/dm4;
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
    iget-object p0, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "like_you"

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_3

    .line 9
    .line 10
    iget-object v0, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->letter()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-object v0, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    iget-object v0, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 38
    .line 39
    invoke-interface {v0}, Ll/rql;->t0()Lv/VText;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 50
    .line 51
    invoke-interface {v0}, Ll/rql;->o()Landroid/widget/ImageView;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 58
    .line 59
    invoke-interface {v0}, Ll/rql;->o()Landroid/widget/ImageView;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_3

    .line 68
    .line 69
    :cond_1
    iget-object v0, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 72
    .line 73
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/CardInfos;->momentLikedYou:Z

    .line 74
    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 78
    .line 79
    invoke-interface {v0}, Ll/rql;->t0()Lv/VText;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const/4 v1, 0x1

    .line 84
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 88
    .line 89
    invoke-interface {v0}, Ll/rql;->t0()Lv/VText;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const/4 v2, 0x3

    .line 94
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 102
    .line 103
    invoke-interface {v0}, Ll/rql;->t0()Lv/VText;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object p0, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_2

    .line 114
    .line 115
    const-string p0, "\u5979\u559c\u6b22\u4e86\u4f60"

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_2
    const-string p0, "\u4ed6\u559c\u6b22\u4e86\u4f60"

    .line 119
    .line 120
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    :cond_3
    :goto_1
    return v1
.end method
