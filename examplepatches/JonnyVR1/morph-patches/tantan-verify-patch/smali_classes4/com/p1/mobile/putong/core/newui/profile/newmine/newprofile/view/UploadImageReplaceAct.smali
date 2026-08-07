.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/data/User;

.field public d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lv/AutoVDraweeView;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->lambda$initSubscription$0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->b2(ILandroid/view/View;)V

    return-void
.end method

.method public static Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method private a2(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->e:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    move v2, v1

    .line 19
    :goto_0
    if-ge v2, v0, :cond_4

    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->d:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Landroid/view/View;

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->f:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Landroid/widget/TextView;

    .line 40
    .line 41
    const-string v5, "\u5934\u50cf"

    .line 42
    .line 43
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 51
    .line 52
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 53
    .line 54
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-nez v3, :cond_1

    .line 59
    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    invoke-static {}, Ll/gra;->A2()Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_0

    .line 67
    .line 68
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->f:Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Landroid/view/View;

    .line 75
    .line 76
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 93
    .line 94
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    check-cast v5, Ljava/lang/String;

    .line 101
    .line 102
    invoke-interface {v3, v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Gh(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->f:Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    check-cast v5, Landroid/widget/TextView;

    .line 113
    .line 114
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->f:Ljava/util/ArrayList;

    .line 120
    .line 121
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Landroid/view/View;

    .line 126
    .line 127
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_1
    if-nez v2, :cond_2

    .line 132
    .line 133
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->f:Ljava/util/ArrayList;

    .line 134
    .line 135
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    check-cast v3, Landroid/view/View;

    .line 140
    .line 141
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->e:Ljava/util/ArrayList;

    .line 145
    .line 146
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    check-cast v3, Lv/AutoVDraweeView;

    .line 151
    .line 152
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 157
    .line 158
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 163
    .line 164
    invoke-virtual {v3, v4}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    if-lez v2, :cond_3

    .line 168
    .line 169
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->d:Ljava/util/ArrayList;

    .line 170
    .line 171
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    check-cast v3, Landroid/view/View;

    .line 176
    .line 177
    new-instance v4, Ll/i3k0;

    .line 178
    .line 179
    invoke-direct {v4, p0, v2}, Ll/i3k0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;I)V

    .line 180
    .line 181
    .line 182
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 183
    .line 184
    .line 185
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :cond_4
    return-void
.end method

.method private synthetic b2(ILandroid/view/View;)V
    .locals 1

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "select index is:"

    .line 4
    .line 5
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {p2}, Ll/o1j0;->r(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string p2, "e_choose_photo_replace"

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->pageId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    new-instance p2, Landroid/content/Intent;

    .line 28
    .line 29
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v0, "EXTRA_REPLACE_INDEX"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const/4 p1, -0x1

    .line 38
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic lambda$initSubscription$0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->c:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->a2(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 29

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Ll/kec0;->Rc:I

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/adc0;->N8:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lv/navigationbar/VNavigationBar;

    .line 23
    .line 24
    iget-object v3, v0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 27
    .line 28
    .line 29
    sget v2, Ll/adc0;->O9:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    sget v2, Ll/adc0;->Me:I

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 42
    .line 43
    sget v4, Ll/adc0;->aa:I

    .line 44
    .line 45
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    move-object v9, v4

    .line 50
    check-cast v9, Landroid/widget/TextView;

    .line 51
    .line 52
    sget v4, Ll/adc0;->A9:I

    .line 53
    .line 54
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    move-object v11, v4

    .line 59
    check-cast v11, Lv/AutoVDraweeView;

    .line 60
    .line 61
    sget v4, Ll/adc0;->P9:I

    .line 62
    .line 63
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    sget v5, Ll/adc0;->ba:I

    .line 68
    .line 69
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    move-object v10, v5

    .line 74
    check-cast v10, Landroid/widget/TextView;

    .line 75
    .line 76
    sget v5, Ll/adc0;->B9:I

    .line 77
    .line 78
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    move-object v12, v5

    .line 83
    check-cast v12, Lv/AutoVDraweeView;

    .line 84
    .line 85
    sget v5, Ll/adc0;->Q9:I

    .line 86
    .line 87
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    sget v6, Ll/adc0;->ca:I

    .line 92
    .line 93
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    move-object v13, v6

    .line 98
    check-cast v13, Landroid/widget/TextView;

    .line 99
    .line 100
    sget v6, Ll/adc0;->C9:I

    .line 101
    .line 102
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    move-object v14, v6

    .line 107
    check-cast v14, Lv/AutoVDraweeView;

    .line 108
    .line 109
    sget v6, Ll/adc0;->R9:I

    .line 110
    .line 111
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    sget v7, Ll/adc0;->da:I

    .line 116
    .line 117
    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    move-object v15, v7

    .line 122
    check-cast v15, Landroid/widget/TextView;

    .line 123
    .line 124
    sget v7, Ll/adc0;->D9:I

    .line 125
    .line 126
    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v7

    .line 130
    move-object/from16 v16, v7

    .line 131
    .line 132
    check-cast v16, Lv/AutoVDraweeView;

    .line 133
    .line 134
    sget v7, Ll/adc0;->S9:I

    .line 135
    .line 136
    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v7

    .line 140
    sget v8, Ll/adc0;->ea:I

    .line 141
    .line 142
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v8

    .line 146
    move-object/from16 v17, v8

    .line 147
    .line 148
    check-cast v17, Landroid/widget/TextView;

    .line 149
    .line 150
    sget v8, Ll/adc0;->E9:I

    .line 151
    .line 152
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v8

    .line 156
    move-object/from16 v18, v8

    .line 157
    .line 158
    check-cast v18, Lv/AutoVDraweeView;

    .line 159
    .line 160
    sget v8, Ll/adc0;->T9:I

    .line 161
    .line 162
    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v8

    .line 166
    move-object/from16 p1, v3

    .line 167
    .line 168
    sget v3, Ll/adc0;->fa:I

    .line 169
    .line 170
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    move-object/from16 v19, v3

    .line 175
    .line 176
    check-cast v19, Landroid/widget/TextView;

    .line 177
    .line 178
    sget v3, Ll/adc0;->F9:I

    .line 179
    .line 180
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    move-object/from16 v20, v3

    .line 185
    .line 186
    check-cast v20, Lv/AutoVDraweeView;

    .line 187
    .line 188
    sget v3, Ll/adc0;->U9:I

    .line 189
    .line 190
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    move-object/from16 p2, v3

    .line 195
    .line 196
    sget v3, Ll/adc0;->ga:I

    .line 197
    .line 198
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    move-object/from16 v21, v3

    .line 203
    .line 204
    check-cast v21, Landroid/widget/TextView;

    .line 205
    .line 206
    sget v3, Ll/adc0;->G9:I

    .line 207
    .line 208
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    move-object/from16 v22, v3

    .line 213
    .line 214
    check-cast v22, Lv/AutoVDraweeView;

    .line 215
    .line 216
    sget v3, Ll/adc0;->V9:I

    .line 217
    .line 218
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    move-object/from16 v23, v3

    .line 223
    .line 224
    sget v3, Ll/adc0;->ha:I

    .line 225
    .line 226
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    move-object/from16 v24, v3

    .line 231
    .line 232
    check-cast v24, Landroid/widget/TextView;

    .line 233
    .line 234
    sget v3, Ll/adc0;->H9:I

    .line 235
    .line 236
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    move-object/from16 v25, v3

    .line 241
    .line 242
    check-cast v25, Lv/AutoVDraweeView;

    .line 243
    .line 244
    sget v3, Ll/adc0;->W9:I

    .line 245
    .line 246
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    move-object/from16 v26, v3

    .line 251
    .line 252
    sget v3, Ll/adc0;->ia:I

    .line 253
    .line 254
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    move-object/from16 v27, v3

    .line 259
    .line 260
    check-cast v27, Landroid/widget/TextView;

    .line 261
    .line 262
    sget v3, Ll/adc0;->I9:I

    .line 263
    .line 264
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 265
    .line 266
    .line 267
    move-result-object v3

    .line 268
    move-object/from16 v28, v3

    .line 269
    .line 270
    check-cast v28, Lv/AutoVDraweeView;

    .line 271
    .line 272
    invoke-static {}, Ll/gra;->A2()Z

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    if-eqz v3, :cond_0

    .line 277
    .line 278
    const-string v3, "\u7167\u7247\u5df2\u8fbe\u52306\u5f20\uff0c\u8bf7\u4ece\u975e\u5934\u50cf\u7167\u7247\u4e2d\u9009\u62e9\u4e00\u5f20\u66ff\u6362"

    .line 279
    .line 280
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    .line 282
    .line 283
    move-object/from16 v3, p1

    .line 284
    .line 285
    filled-new-array/range {v3 .. v8}, [Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    iput-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->d:Ljava/util/ArrayList;

    .line 294
    .line 295
    move-object v5, v9

    .line 296
    move-object v6, v10

    .line 297
    move-object v7, v13

    .line 298
    move-object v8, v15

    .line 299
    move-object/from16 v9, v17

    .line 300
    .line 301
    move-object/from16 v10, v19

    .line 302
    .line 303
    filled-new-array/range {v5 .. v10}, [Landroid/widget/TextView;

    .line 304
    .line 305
    .line 306
    move-result-object v2

    .line 307
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 308
    .line 309
    .line 310
    move-result-object v2

    .line 311
    iput-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->f:Ljava/util/ArrayList;

    .line 312
    .line 313
    move-object v10, v11

    .line 314
    move-object v11, v12

    .line 315
    move-object v12, v14

    .line 316
    move-object/from16 v13, v16

    .line 317
    .line 318
    move-object/from16 v14, v18

    .line 319
    .line 320
    move-object/from16 v15, v20

    .line 321
    .line 322
    filled-new-array/range {v10 .. v15}, [Lv/AutoVDraweeView;

    .line 323
    .line 324
    .line 325
    move-result-object v2

    .line 326
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    iput-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->e:Ljava/util/ArrayList;

    .line 331
    .line 332
    return-object v1

    .line 333
    :cond_0
    move-object v2, v12

    .line 334
    move-object v12, v10

    .line 335
    move-object/from16 v10, v23

    .line 336
    .line 337
    move-object/from16 v23, v19

    .line 338
    .line 339
    move-object/from16 v19, v17

    .line 340
    .line 341
    move-object/from16 v17, v15

    .line 342
    .line 343
    move-object v15, v2

    .line 344
    move-object v2, v14

    .line 345
    move-object v14, v11

    .line 346
    move-object/from16 v11, v26

    .line 347
    .line 348
    move-object/from16 v26, v20

    .line 349
    .line 350
    move-object/from16 v20, v18

    .line 351
    .line 352
    move-object/from16 v18, v16

    .line 353
    .line 354
    move-object/from16 v16, v2

    .line 355
    .line 356
    move-object/from16 v3, p1

    .line 357
    .line 358
    move-object v2, v9

    .line 359
    move-object/from16 v9, p2

    .line 360
    .line 361
    filled-new-array/range {v3 .. v11}, [Landroid/view/View;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 366
    .line 367
    .line 368
    move-result-object v3

    .line 369
    iput-object v3, v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->d:Ljava/util/ArrayList;

    .line 370
    .line 371
    move-object v5, v2

    .line 372
    move-object v6, v12

    .line 373
    move-object v7, v13

    .line 374
    move-object/from16 v8, v17

    .line 375
    .line 376
    move-object/from16 v9, v19

    .line 377
    .line 378
    move-object/from16 v11, v21

    .line 379
    .line 380
    move-object/from16 v10, v23

    .line 381
    .line 382
    move-object/from16 v12, v24

    .line 383
    .line 384
    move-object/from16 v13, v27

    .line 385
    .line 386
    filled-new-array/range {v5 .. v13}, [Landroid/widget/TextView;

    .line 387
    .line 388
    .line 389
    move-result-object v2

    .line 390
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 391
    .line 392
    .line 393
    move-result-object v2

    .line 394
    iput-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->f:Ljava/util/ArrayList;

    .line 395
    .line 396
    move-object v10, v14

    .line 397
    move-object v11, v15

    .line 398
    move-object/from16 v12, v16

    .line 399
    .line 400
    move-object/from16 v13, v18

    .line 401
    .line 402
    move-object/from16 v14, v20

    .line 403
    .line 404
    move-object/from16 v16, v22

    .line 405
    .line 406
    move-object/from16 v17, v25

    .line 407
    .line 408
    move-object/from16 v15, v26

    .line 409
    .line 410
    move-object/from16 v18, v28

    .line 411
    .line 412
    filled-new-array/range {v10 .. v18}, [Lv/AutoVDraweeView;

    .line 413
    .line 414
    .line 415
    move-result-object v2

    .line 416
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    iput-object v2, v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->e:Ljava/util/ArrayList;

    .line 421
    .line 422
    return-object v1
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;->c:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/h3k0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/h3k0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UploadImageReplaceAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_choose_photo_replace"

    .line 2
    .line 3
    return-object p0
.end method
