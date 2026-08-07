.class public Ll/n7h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g7h;


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ll/th0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n7h;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Ll/n7h;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n7h;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/n7h;Ll/jhk;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/n7h;->j(Ll/jhk;Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/x20;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ll/wf70;->l0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic h(Ll/n7h;Ll/jhk;Ll/yah;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/n7h;->k(Ll/jhk;Ll/yah;)V

    return-void
.end method


# virtual methods
.method public a(Ll/jhk;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n7h;->m(Ll/jhk;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/jhk;Ll/x20;)V
    .locals 3

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/n7h;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "\u786e\u8ba4\u8981\u9000\u51fa"

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ll/jhk;->i()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, "\uff1f"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "\u518d\u60f3\u60f3"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    new-instance v2, Ll/h7h;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/h7h;-><init>(Ll/n7h;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v2, "\u786e\u8ba4"

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Ll/i7h;

    .line 57
    .line 58
    invoke-direct {v2}, Ll/i7h;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    new-instance v2, Ll/j7h;

    .line 66
    .line 67
    invoke-direct {v2, p0, p1, p2}, Ll/j7h;-><init>(Ll/n7h;Ll/jhk;Ll/x20;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Ll/n7h;->b:Ll/th0;

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n7h;->b:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic j(Ll/jhk;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/n7h;->b:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/n7h;->l(Ll/jhk;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic k(Ll/jhk;Ll/yah;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n7h;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 4
    .line 5
    invoke-direct {v1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const-string v2, "nearby"

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1}, Ll/jhk;->e()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v1, 0x0

    .line 23
    new-array v1, v1, [Lcom/p1/mobile/putong/data/Media;

    .line 24
    .line 25
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->f(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {v0, p1}, Ll/cn40;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/n7h;->a:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    invoke-static {p0, p1, v2}, Ll/cn40;->O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2}, Ll/yah;->dismiss()V

    .line 43
    .line 44
    .line 45
    const-string p0, "album_post_source"

    .line 46
    .line 47
    const-string p1, "circle_ popup"

    .line 48
    .line 49
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    filled-new-array {p0}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "e_moment_post"

    .line 58
    .line 59
    const-string p2, "p_circle_detail_join_popup"

    .line 60
    .line 61
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public l(Ll/jhk;Ll/x20;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/n7h;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/jhk;->e()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p1, v1}, Ll/jka;->a7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p1, Ll/l7h;

    .line 28
    .line 29
    invoke-direct {p1, p2}, Ll/l7h;-><init>(Ll/x20;)V

    .line 30
    .line 31
    .line 32
    new-instance p2, Ll/m7h;

    .line 33
    .line 34
    invoke-direct {p2}, Ll/m7h;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public m(Ll/jhk;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/jhk;->k()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Ll/jhk;->i()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    new-instance v3, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v4, "\u6b22\u8fce\u6765\u5230"

    .line 20
    .line 21
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v4, "\uff0c\u53d1\u5e03 1 \u6761\u52a8\u6001\uff0c\u5373\u53ef\u6210\u4e3a\u7b2c "

    .line 28
    .line 29
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v4, " \u4f4d"

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ll/jhk;->b()Lcom/p1/mobile/putong/feed/data/Group;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v4}, Lcom/p1/mobile/putong/feed/data/Group;->isGroupAnonymousType()Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_0

    .line 49
    .line 50
    const-string v4, "\u5708\u53cb"

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {p1}, Ll/jhk;->b()Lcom/p1/mobile/putong/feed/data/Group;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 58
    .line 59
    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-direct {v2, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 70
    .line 71
    iget-object v4, p0, Ll/n7h;->a:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    sget v5, Ll/k9c0;->n:I

    .line 78
    .line 79
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    add-int/lit8 v4, v4, 0x8

    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    add-int/lit8 v5, v5, 0x9

    .line 97
    .line 98
    const/16 v6, 0x21

    .line 99
    .line 100
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 101
    .line 102
    .line 103
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 104
    .line 105
    iget-object v4, p0, Ll/n7h;->a:Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    sget v5, Ll/k9c0;->n:I

    .line 112
    .line 113
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 121
    .line 122
    .line 123
    move-result v4

    .line 124
    add-int/lit8 v4, v4, 0x14

    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    add-int/lit8 v1, v1, 0x14

    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    add-int/2addr v1, v0

    .line 137
    invoke-virtual {v2, v3, v4, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 138
    .line 139
    .line 140
    new-instance v0, Ll/yah;

    .line 141
    .line 142
    iget-object v1, p0, Ll/n7h;->a:Lcom/p1/mobile/android/app/Act;

    .line 143
    .line 144
    sget v3, Ll/fgc0;->e:I

    .line 145
    .line 146
    invoke-direct {v0, v1, v3}, Ll/yah;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v2}, Ll/yah;->u(Ljava/lang/CharSequence;)Ll/yah;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {p1}, Ll/jhk;->b()Lcom/p1/mobile/putong/feed/data/Group;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Ll/yah;->F(Ljava/lang/String;)Ll/yah;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    const/4 v1, 0x0

    .line 164
    invoke-virtual {v0, v1}, Ll/yah;->H(Z)Ll/yah;

    .line 165
    .line 166
    .line 167
    new-instance v1, Ll/k7h;

    .line 168
    .line 169
    invoke-direct {v1, p0, p1, v0}, Ll/k7h;-><init>(Ll/n7h;Ll/jhk;Ll/yah;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0, v1}, Ll/yah;->C(Ljava/lang/Runnable;)Ll/yah;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v0}, Ll/yah;->show()V

    .line 176
    .line 177
    .line 178
    return-void
.end method
