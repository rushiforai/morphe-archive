.class public Ll/zgf;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.source "SourceFile"


# instance fields
.field public u:Lcom/p1/mobile/putong/core/data/UserTagsData;

.field public v:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

.field public w:Landroid/view/View;

.field public x:Ll/w30;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Ll/zgf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zgf;->d0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic U(Ll/zgf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zgf;->h0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic W(Ll/zgf;Lcom/p1/mobile/putong/core/data/UserTagData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zgf;->f0(Lcom/p1/mobile/putong/core/data/UserTagData;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic X(Ll/zgf;Lcom/p1/mobile/putong/core/data/UserTagData;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/zgf;->e0(Lcom/p1/mobile/putong/core/data/UserTagData;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic Y(Ll/zgf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zgf;->g0(Landroid/view/View;)V

    return-void
.end method

.method public static Z()Ljava/util/HashMap;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/zwk;->e()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlJPUEpJSTU2M1pIRTdBN1BRSTMzRlk1WFpURktYMjE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 11
    .line 12
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IldQWkc1NEZFWllWUElIUDZCUFFUWUI2NDJaWVdSQzE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 13
    .line 14
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IlhaR1o1QzRBSEU1VkRMUkpEQ09IT1hSS0U2RFlMQzE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 15
    .line 16
    const-string v5, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik40TU5aSEJMSElFM0VCU1BIRTVLU1g1N1hTN1dPMzE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 17
    .line 18
    const-string v6, "https://auto.tancdn.com/v1/images/eyJpZCI6IjQyRlZWMktMVUdMSjVXU0hJUlFVMk5RQlk3QlhCNDE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 19
    .line 20
    const-string v7, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpGS1ZJSlVHNVU3WUtGR05NNEdOVDNHNVAzMjNFSTE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 21
    .line 22
    const-string v8, "https://auto.tancdn.com/v1/images/eyJpZCI6IkFVNkJWSjNMWjRDSklOUTNJTlpGR0hOWENQVkVCTzE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 23
    .line 24
    const-string v9, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNPTVFHWTRJQUJOUURFTUlEM1EzWURKSFQ1NVk1WDE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 25
    .line 26
    const-string v10, "https://auto.tancdn.com/v1/images/eyJpZCI6Ilk2STVPWlVFNFdBTktVSldHTVJBV1JVV0dGQklCVTE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 27
    .line 28
    const-string v11, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNPT1dENU9RWk1EUk1KN1FXRVhTUVJMNlJZNFhOSjE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 29
    .line 30
    const-string v12, "https://auto.tancdn.com/v1/images/eyJpZCI6IlJSTEJGQ1hVUEdEMzNSUTNFQlBRN05OVFlRQUJKQTE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 31
    .line 32
    const-string v13, "https://auto.tancdn.com/v1/images/eyJpZCI6IkQ1M1lVQ0hDNTcyWEhYNEtTS0pSTEhaM05ZWkFFRDE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 33
    .line 34
    const-string v14, "https://auto.tancdn.com/v1/images/eyJpZCI6IjRaT1BMUTNGTVlBWUFLTlcyVk9JUUQyWjYzNDI0TzE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    const-string v1, "277"

    .line 39
    .line 40
    invoke-virtual {v0, v1, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    const-string v1, "278"

    .line 44
    .line 45
    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    const-string v1, "207"

    .line 49
    .line 50
    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    const-string v1, "212"

    .line 54
    .line 55
    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    const-string v1, "280"

    .line 59
    .line 60
    invoke-virtual {v0, v1, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    const-string v1, "279"

    .line 64
    .line 65
    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    const-string v1, "210"

    .line 69
    .line 70
    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    const-string v1, "281"

    .line 74
    .line 75
    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    const-string v1, "205"

    .line 79
    .line 80
    invoke-virtual {v0, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    const-string v1, "283"

    .line 84
    .line 85
    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    const-string v1, "206"

    .line 89
    .line 90
    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    const-string v1, "282"

    .line 94
    .line 95
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    const-string v1, "284"

    .line 99
    .line 100
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    return-object v0

    .line 104
    :cond_0
    const-string v1, "47"

    .line 105
    .line 106
    invoke-virtual {v0, v1, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    const-string v1, "48"

    .line 110
    .line 111
    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    const-string v1, "4"

    .line 115
    .line 116
    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    const-string v1, "9"

    .line 120
    .line 121
    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    const-string v1, "50"

    .line 125
    .line 126
    invoke-virtual {v0, v1, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    const-string v1, "49"

    .line 130
    .line 131
    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    const-string v1, "7"

    .line 135
    .line 136
    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    const-string v1, "51"

    .line 140
    .line 141
    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    const-string v1, "2"

    .line 145
    .line 146
    invoke-virtual {v0, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    const-string v1, "10"

    .line 150
    .line 151
    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    const-string v1, "3"

    .line 155
    .line 156
    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    const-string v1, "52"

    .line 160
    .line 161
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    const-string v1, "53"

    .line 165
    .line 166
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    return-object v0
.end method

.method private synthetic g0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x1

    .line 22
    const/16 v2, 0xbb9

    .line 23
    .line 24
    invoke-virtual {p1, v0, v2, p0, v1}, Ll/gj40;->H(Lcom/p1/mobile/android/app/Frag;ILcom/p1/mobile/putong/data/User;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic h0(Landroid/view/View;)V
    .locals 3

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array v0, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_tag_add_photo_guidance"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/a2i0;->e(Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/zgf;->v:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 37
    .line 38
    invoke-static {p0, p1, p1}, Ll/mkf;->M(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public a0(Lcom/p1/mobile/putong/core/data/UserTagData;Ljava/util/HashMap;)Landroid/view/View;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/UserTagData;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    sget v2, Ll/bnl0;->f:I

    .line 17
    .line 18
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->categories:Ljava/util/List;

    .line 25
    .line 26
    new-instance v2, Ll/vgf;

    .line 27
    .line 28
    invoke-direct {v2, p2}, Ll/vgf;-><init>(Ljava/util/HashMap;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/lang/String;

    .line 36
    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    const-string p2, "https://auto.tancdn.com/v1/images/eyJpZCI6IktPV0g3U0hGRUhQQVpQUUs0STdXNkxSUzVDRzRaNDE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MH0.png"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Ljava/lang/String;

    .line 47
    .line 48
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->title:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance p2, Ll/wgf;

    .line 54
    .line 55
    invoke-direct {p2, p0, p1}, Ll/wgf;-><init>(Ll/zgf;Lcom/p1/mobile/putong/core/data/UserTagData;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    return-object v0
.end method

.method public b0(Lcom/p1/mobile/putong/core/data/UserTagsData;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/UserTagsData;",
            ")",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/zgf;->Z()Ljava/util/HashMap;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/p1/mobile/putong/core/data/UserTagData;

    .line 35
    .line 36
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-nez v3, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p0, v2, v1}, Ll/zgf;->a0(Lcom/p1/mobile/putong/core/data/UserTagData;Ljava/util/HashMap;)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return-object v0
.end method

.method public final c0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zgf;->u:Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/zgf;->v:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 15
    .line 16
    const/4 v1, 0x3

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->setMaxLines(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/zgf;->v:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 21
    .line 22
    new-instance v1, Ll/ugf;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/ugf;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->setCallBack(Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView$a;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/zgf;->v:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 31
    .line 32
    iget-object v1, p0, Ll/zgf;->u:Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Ll/zgf;->b0(Lcom/p1/mobile/putong/core/data/UserTagsData;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setTags(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1, v0}, Ll/gj40;->v(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    const/4 v2, 0x0

    .line 62
    if-nez v1, :cond_1

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    const/16 v1, 0x9

    .line 71
    .line 72
    if-ge v0, v1, :cond_1

    .line 73
    .line 74
    iget-object p0, p0, Ll/zgf;->w:Landroid/view/View;

    .line 75
    .line 76
    const/4 v0, 0x1

    .line 77
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    const-string p0, "p_edit_profile_view"

    .line 81
    .line 82
    new-array v0, v2, [Ll/sfj0$a;

    .line 83
    .line 84
    const-string v1, "e_tag_add_photo_guidance"

    .line 85
    .line 86
    invoke-static {v1, p0, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    iget-object p0, p0, Ll/zgf;->w:Landroid/view/View;

    .line 91
    .line 92
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic d0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zgf;->x:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic e0(Lcom/p1/mobile/putong/core/data/UserTagData;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/gj40;->z()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserTagData;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {p2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, p2}, Ll/gj40;->T(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/zgf;->z()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/zgf;->u:Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p1}, Ll/t3m;->J3()V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p0, p0, Ll/zgf;->x:Ll/w30;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic f0(Lcom/p1/mobile/putong/core/data/UserTagData;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p2, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "\u5220\u9664\u6807\u7b7e"

    .line 7
    .line 8
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/w30$b;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    const-string v1, "\u53d6\u6d88"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/xgf;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/xgf;-><init>(Ll/zgf;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0, p2}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    const/4 v0, 0x3

    .line 44
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p2, v0}, Ll/w30$b;->P(Landroid/graphics/Typeface;)Ll/w30$b;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    new-instance v0, Ll/ygf;

    .line 53
    .line 54
    invoke-direct {v0, p0, p1}, Ll/ygf;-><init>(Ll/zgf;Lcom/p1/mobile/putong/core/data/UserTagData;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Ll/w30$b;->F()Ll/w30;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Ll/zgf;->x:Ll/w30;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6211\u7684\u6807\u7b7e"

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "tag"

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, v0}, Ll/gj40;->w(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/zgf;->u:Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    return v1
.end method

.method public y(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Ll/kec0;->A2:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget v0, Ll/adc0;->Kd:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 23
    .line 24
    iput-object v0, p0, Ll/zgf;->v:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 25
    .line 26
    sget v0, Ll/adc0;->x:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/zgf;->w:Landroid/view/View;

    .line 33
    .line 34
    return-object p1
.end method

.method public z()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->C(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Ll/gj40;->w(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/zgf;->u:Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/zgf;->c0()V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/sgf;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/sgf;-><init>(Ll/zgf;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->D(Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/zgf;->w:Landroid/view/View;

    .line 37
    .line 38
    new-instance v1, Ll/tgf;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/tgf;-><init>(Ll/zgf;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
