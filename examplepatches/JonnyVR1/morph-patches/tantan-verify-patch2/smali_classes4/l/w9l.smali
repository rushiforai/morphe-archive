.class public Ll/w9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/s9l;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VImage;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Landroid/widget/TextView;

.field public i:Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;

.field public j:Ll/bpf;

.field public k:Landroid/widget/RelativeLayout;

.field public l:Lv/VRelative;

.field public m:Landroid/view/View;

.field public n:Lcom/p1/mobile/android/app/Act;

.field public o:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

.field public p:Ll/s9l;

.field public q:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

.field public r:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

.field public s:Lv/VLinear;

.field public t:Z

.field public u:Ll/g6m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/g6m<",
            "Ll/spf$a;",
            "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w9l;->o:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/w9l;->n:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ll/w9l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w9l;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/w9l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w9l;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/w9l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w9l;->p(Landroid/view/View;)V

    return-void
.end method

.method private l()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/w9l;->e:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/t9l;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/t9l;-><init>(Ll/w9l;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/w9l;->n:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/w9l;->n:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-static {v0}, Ll/vnb;->n1(Lcom/p1/mobile/android/app/Act;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Ll/w9l;->e:Lv/VImage;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 32
    .line 33
    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 34
    .line 35
    iget-object v2, p0, Ll/w9l;->e:Lv/VImage;

    .line 36
    .line 37
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/w9l;->c:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 47
    .line 48
    iget-object v2, p0, Ll/w9l;->n:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    invoke-static {v2}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 55
    .line 56
    iget-object v2, p0, Ll/w9l;->c:Landroid/view/View;

    .line 57
    .line 58
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Ll/w9l;->k:Landroid/widget/RelativeLayout;

    .line 62
    .line 63
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 68
    .line 69
    const/high16 v2, 0x42e60000    # 115.0f

    .line 70
    .line 71
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    add-int/2addr v3, v0

    .line 76
    iput v3, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 77
    .line 78
    iget-object v3, p0, Ll/w9l;->k:Landroid/widget/RelativeLayout;

    .line 79
    .line 80
    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Ll/w9l;->l:Lv/VRelative;

    .line 84
    .line 85
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 90
    .line 91
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    add-int/2addr v0, v2

    .line 96
    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 97
    .line 98
    iget-object v0, p0, Ll/w9l;->l:Lv/VRelative;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    .line 102
    .line 103
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v1, "growth_explore_config"

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 114
    .line 115
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/w9l;->p:Ll/s9l;

    .line 119
    .line 120
    iget-object v0, v0, Ll/s9l;->c:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_1

    .line 131
    .line 132
    const-string v1, "name"

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    const-string v2, "icon"

    .line 139
    .line 140
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    const-string v3, "background"

    .line 145
    .line 146
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    const-string v4, "backgroundColor"

    .line 151
    .line 152
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    const-string v5, "emptyColor"

    .line 157
    .line 158
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget-object v5, p0, Ll/w9l;->h:Landroid/widget/TextView;

    .line 163
    .line 164
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    .line 166
    .line 167
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 168
    .line 169
    iget-object v5, p0, Ll/w9l;->g:Lv/VDraweeView;

    .line 170
    .line 171
    invoke-virtual {v1, v5, v3}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 175
    .line 176
    iget-object v3, p0, Ll/w9l;->f:Lv/VDraweeView;

    .line 177
    .line 178
    invoke-virtual {v1, v3, v2}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0, v4, v0}, Ll/w9l;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    .line 183
    .line 184
    :cond_1
    return-void

    .line 185
    :catch_0
    move-exception p0

    .line 186
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w9l;->n:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w9l;->n:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/s9l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w9l;->p:Ll/s9l;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(ZF)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    cmpl-float p1, p2, p1

    .line 5
    .line 6
    if-lez p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/w9l;->q:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->reset()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/w9l;->r:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->j(F)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p1, p0, Ll/w9l;->r:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->reset()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/w9l;->q:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 25
    .line 26
    neg-float p1, p2

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->j(F)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p1, p0, Ll/w9l;->r:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->reset()V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/w9l;->q:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->reset()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w9l;->n:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w9l;->i:Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/s9l;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w9l;->d(Ll/s9l;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->c3:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 9
    .line 10
    sget p2, Ll/adc0;->T3:I

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Landroid/widget/FrameLayout;

    .line 17
    .line 18
    iput-object p1, p0, Ll/w9l;->d:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 21
    .line 22
    sget p2, Ll/adc0;->Nb:I

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll/w9l;->b:Landroid/view/View;

    .line 29
    .line 30
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 31
    .line 32
    sget p2, Ll/adc0;->c4:I

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lv/VImage;

    .line 39
    .line 40
    iput-object p1, p0, Ll/w9l;->e:Lv/VImage;

    .line 41
    .line 42
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 43
    .line 44
    sget p2, Ll/adc0;->e4:I

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lv/VDraweeView;

    .line 51
    .line 52
    iput-object p1, p0, Ll/w9l;->f:Lv/VDraweeView;

    .line 53
    .line 54
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 55
    .line 56
    sget p2, Ll/adc0;->d4:I

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Landroid/widget/TextView;

    .line 63
    .line 64
    iput-object p1, p0, Ll/w9l;->h:Landroid/widget/TextView;

    .line 65
    .line 66
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 67
    .line 68
    sget p2, Ll/adc0;->S3:I

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 75
    .line 76
    iput-object p1, p0, Ll/w9l;->k:Landroid/widget/RelativeLayout;

    .line 77
    .line 78
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 79
    .line 80
    sget p2, Ll/adc0;->W3:I

    .line 81
    .line 82
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Lv/VRelative;

    .line 87
    .line 88
    iput-object p1, p0, Ll/w9l;->l:Lv/VRelative;

    .line 89
    .line 90
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 91
    .line 92
    sget p2, Ll/adc0;->V3:I

    .line 93
    .line 94
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iput-object p1, p0, Ll/w9l;->m:Landroid/view/View;

    .line 99
    .line 100
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 101
    .line 102
    sget p2, Ll/adc0;->U3:I

    .line 103
    .line 104
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    check-cast p1, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 109
    .line 110
    iput-object p1, p0, Ll/w9l;->q:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 111
    .line 112
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 113
    .line 114
    sget p2, Ll/adc0;->Y3:I

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 121
    .line 122
    iput-object p1, p0, Ll/w9l;->r:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 123
    .line 124
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 125
    .line 126
    sget p2, Ll/adc0;->Q3:I

    .line 127
    .line 128
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    check-cast p1, Lv/VDraweeView;

    .line 133
    .line 134
    iput-object p1, p0, Ll/w9l;->g:Lv/VDraweeView;

    .line 135
    .line 136
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 137
    .line 138
    sget p2, Ll/adc0;->Z3:I

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iput-object p1, p0, Ll/w9l;->c:Landroid/view/View;

    .line 145
    .line 146
    iget-object p1, p0, Ll/w9l;->a:Landroid/view/View;

    .line 147
    .line 148
    sget p2, Ll/adc0;->R3:I

    .line 149
    .line 150
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Lv/VLinear;

    .line 155
    .line 156
    iput-object p1, p0, Ll/w9l;->s:Lv/VLinear;

    .line 157
    .line 158
    iget-object p0, p0, Ll/w9l;->a:Landroid/view/View;

    .line 159
    .line 160
    return-object p0
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/w9l;->s:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final k()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w9l;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;-><init>(Landroid/content/Context;Ll/w9l;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/w9l;->i:Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/w9l;->i:Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/w9l;->d:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    iget-object v2, p0, Ll/w9l;->i:Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;

    .line 24
    .line 25
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    const/4 v4, -0x1

    .line 28
    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/bpf;

    .line 35
    .line 36
    iget-object v1, p0, Ll/w9l;->o:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

    .line 37
    .line 38
    iget-object v2, p0, Ll/w9l;->i:Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;

    .line 39
    .line 40
    invoke-direct {v0, v1, v2}, Ll/bpf;-><init>(Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/w9l;->j:Ll/bpf;

    .line 44
    .line 45
    iget-object p0, p0, Ll/w9l;->i:Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->setAdapter(Ll/nx2;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/data/SwipeDirection;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w9l;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/w9l;->i()Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/w9l;->i()Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/explore/bifrost/ExploreCardStack;->r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w9l;->l()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/w9l;->k()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public s(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 13

    .line 1
    instance-of v1, p1, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;

    .line 2
    .line 3
    if-eqz v1, :cond_0

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    check-cast v1, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :goto_0
    if-nez v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Ll/w9l;->o:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ll/w9l;->m(Lcom/p1/mobile/putong/core/data/SwipeDirection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const-string v2, "other"

    .line 21
    .line 22
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;->M3(ZLjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 29
    .line 30
    if-ne p2, v2, :cond_2

    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_2
    iget-object v2, p0, Ll/w9l;->u:Ll/g6m;

    .line 36
    .line 37
    if-nez v2, :cond_3

    .line 38
    .line 39
    new-instance v2, Ll/spf;

    .line 40
    .line 41
    invoke-direct {v2}, Ll/spf;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v2, p0, Ll/w9l;->u:Ll/g6m;

    .line 45
    .line 46
    :cond_3
    iget-object v12, p0, Ll/w9l;->u:Ll/g6m;

    .line 47
    .line 48
    new-instance v2, Ll/spf$a;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/w9l;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    move-object v4, v2

    .line 55
    iget-object v2, v1, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    move-object v5, v3

    .line 58
    iget-object v3, v1, Ll/epf;->g:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;

    .line 59
    .line 60
    move-object v6, v4

    .line 61
    iget-boolean v4, v1, Ll/epf;->h:Z

    .line 62
    .line 63
    iget-boolean v1, v1, Ll/epf;->i:Z

    .line 64
    .line 65
    iget-object v11, p0, Ll/w9l;->o:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

    .line 66
    .line 67
    move-object v7, v6

    .line 68
    iget-object v6, v11, Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;->C:Ljava/lang/String;

    .line 69
    .line 70
    iget-boolean v0, p0, Ll/w9l;->t:Z

    .line 71
    .line 72
    move-object v8, v7

    .line 73
    move v7, v0

    .line 74
    move-object v0, v8

    .line 75
    move-object v8, v5

    .line 76
    move v5, v1

    .line 77
    move-object v1, v8

    .line 78
    move-object v8, p1

    .line 79
    move-object v9, p2

    .line 80
    move/from16 v10, p3

    .line 81
    .line 82
    invoke-direct/range {v0 .. v11}, Ll/spf$a;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;ZZLjava/lang/String;ZLandroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;ZLl/btl;)V

    .line 83
    .line 84
    .line 85
    invoke-interface {v12, v0}, Ll/g6m;->a(Ll/e2m;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 90
    .line 91
    return-object v0
.end method

.method public u(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    if-nez p1, :cond_1

    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    iget-object p0, p0, Ll/w9l;->p:Ll/s9l;

    .line 15
    .line 16
    new-instance v0, Ll/opf;

    .line 17
    .line 18
    invoke-direct {v0, p1, p2}, Ll/opf;-><init>(Ll/epf;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/s9l;->a:Ll/opf;

    .line 22
    .line 23
    return-void
.end method

.method public v(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/epf;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/w9l;->j:Ll/bpf;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0, p1}, Ll/bpf;->n(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/w9l;->s:Lv/VLinear;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/w9l;->s:Lv/VLinear;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/w9l;->x(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/w9l;->q:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 21
    .line 22
    sget v0, Ll/dbc0;->c:I

    .line 23
    .line 24
    sget v1, Ll/dbc0;->E7:I

    .line 25
    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->u(II)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/w9l;->q:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 30
    .line 31
    new-instance v0, Ll/u9l;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/u9l;-><init>(Ll/w9l;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/w9l;->r:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 40
    .line 41
    sget v0, Ll/dbc0;->c:I

    .line 42
    .line 43
    sget v1, Ll/dbc0;->C7:I

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->u(II)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/w9l;->r:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;

    .line 49
    .line 50
    new-instance v0, Ll/v9l;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/v9l;-><init>(Ll/w9l;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "#"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    :cond_1
    :try_start_0
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 36
    .line 37
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 38
    .line 39
    .line 40
    const/high16 v1, 0x41a00000    # 20.0f

    .line 41
    .line 42
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-float v1, v1

    .line 47
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 48
    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 52
    .line 53
    .line 54
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_2

    .line 59
    .line 60
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 65
    .line 66
    .line 67
    :cond_2
    const/high16 p2, 0x40400000    # 3.0f

    .line 68
    .line 69
    invoke-static {p2}, Ll/bnl0;->w(F)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    invoke-virtual {v0, p2, p1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ll/w9l;->m:Landroid/view/View;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .line 84
    .line 85
    :catch_0
    return-void
.end method

.method public final x(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    new-array v0, v0, [F

    .line 5
    .line 6
    fill-array-data v0, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {p1, p0, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-wide/16 v0, 0x320

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    nop

    .line 23
    :array_0
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public y()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/w9l;->l:Lv/VRelative;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
