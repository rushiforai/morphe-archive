.class public Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VFrame;

.field public c:Lv/VDraweeView;

.field public d:Lv/VFrame;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VFrame;

.field public h:Lv/VDraweeView;

.field public i:Lv/VDraweeView;

.field public j:Lv/VDraweeView;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static B(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/qa00;->O:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->profileSize(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreLikers$a;Ll/x20;)V
    .locals 5

    return-void

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget v0, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const-class v0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "p_new_like_notification_popup"

    .line 41
    .line 42
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Ll/pk50;->f()Ll/rj50;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const-string v3, "tooltips_trigger_mode"

    .line 55
    .line 56
    const-string v4, "passive"

    .line 57
    .line 58
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    filled-new-array {v3}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v2, v1, v3}, Ll/rj50;->V(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    sget v1, Ll/kec0;->S7:I

    .line 82
    .line 83
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const/4 v1, 0x0

    .line 88
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    new-instance v1, Ll/f230;

    .line 93
    .line 94
    invoke-direct {v1}, Ll/f230;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->i0(Landroid/content/DialogInterface$OnKeyListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    check-cast v1, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;

    .line 109
    .line 110
    new-instance v2, Ll/g230;

    .line 111
    .line 112
    invoke-direct {v2, p2, p0}, Ll/g230;-><init>(Ll/x20;Lcom/p1/mobile/android/app/Dialog;)V

    .line 113
    .line 114
    .line 115
    new-instance p2, Ll/sqk;

    .line 116
    .line 117
    invoke-direct {p2, p0}, Ll/sqk;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, p1, v2, p2}, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->C(Lcom/p1/mobile/putong/core/api/CoreLikers$a;Ll/x20;Ll/x20;)V

    .line 121
    .line 122
    .line 123
    new-instance p1, Ll/h230;

    .line 124
    .line 125
    invoke-direct {p1, v0}, Ll/h230;-><init>(Ll/l4g0;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 135
    .line 136
    .line 137
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic p(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Ll/x20;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic u(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x4

    .line 8
    if-ne p1, p2, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static synthetic w(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C(Lcom/p1/mobile/putong/core/api/CoreLikers$a;Ll/x20;Ll/x20;)V
    .locals 11
    .param p1    # Lcom/p1/mobile/putong/core/api/CoreLikers$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne v0, v2, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    const v4, 0x7fffffff

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-eqz v5, :cond_2

    .line 24
    .line 25
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    check-cast v5, Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 34
    .line 35
    invoke-virtual {v6, v5}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-nez v6, :cond_1

    .line 40
    .line 41
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 42
    .line 43
    iget v5, v5, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 44
    .line 45
    if-le v4, v5, :cond_1

    .line 46
    .line 47
    move v4, v5

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    const/16 v5, 0x1e

    .line 56
    .line 57
    const/4 v6, 0x2

    .line 58
    if-ne v3, v2, :cond_3

    .line 59
    .line 60
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->b:Lv/VFrame;

    .line 61
    .line 62
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    .line 74
    .line 75
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->c:Lv/VDraweeView;

    .line 76
    .line 77
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->B(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v7, v8, v3, v6, v5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-ne v3, v6, :cond_4

    .line 92
    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->d:Lv/VFrame;

    .line 94
    .line 95
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 99
    .line 100
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->e:Lv/VDraweeView;

    .line 101
    .line 102
    iget-object v8, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    check-cast v8, Lcom/p1/mobile/putong/data/User;

    .line 109
    .line 110
    invoke-static {v8}, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->B(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v8

    .line 114
    invoke-virtual {v3, v7, v8, v6, v5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 115
    .line 116
    .line 117
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 118
    .line 119
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->f:Lv/VDraweeView;

    .line 120
    .line 121
    iget-object v8, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 122
    .line 123
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v8

    .line 127
    check-cast v8, Lcom/p1/mobile/putong/data/User;

    .line 128
    .line 129
    invoke-static {v8}, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->B(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v8

    .line 133
    invoke-virtual {v3, v7, v8, v6, v5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 134
    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_4
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->g:Lv/VFrame;

    .line 138
    .line 139
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 143
    .line 144
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->j:Lv/VDraweeView;

    .line 145
    .line 146
    iget-object v8, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 147
    .line 148
    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v8

    .line 152
    check-cast v8, Lcom/p1/mobile/putong/data/User;

    .line 153
    .line 154
    invoke-static {v8}, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->B(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v8

    .line 158
    invoke-virtual {v3, v7, v8, v6, v5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 159
    .line 160
    .line 161
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 162
    .line 163
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->h:Lv/VDraweeView;

    .line 164
    .line 165
    iget-object v8, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 166
    .line 167
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v8

    .line 171
    check-cast v8, Lcom/p1/mobile/putong/data/User;

    .line 172
    .line 173
    invoke-static {v8}, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->B(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v8

    .line 177
    invoke-virtual {v3, v7, v8, v6, v5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 178
    .line 179
    .line 180
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 181
    .line 182
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->i:Lv/VDraweeView;

    .line 183
    .line 184
    iget-object v8, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 185
    .line 186
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v8

    .line 190
    check-cast v8, Lcom/p1/mobile/putong/data/User;

    .line 191
    .line 192
    invoke-static {v8}, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->B(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v8

    .line 196
    invoke-virtual {v3, v7, v8, v6, v5}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 197
    .line 198
    .line 199
    :goto_2
    iget p1, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 200
    .line 201
    const/16 v3, 0x63

    .line 202
    .line 203
    if-le p1, v3, :cond_5

    .line 204
    .line 205
    const-string p1, "99+"

    .line 206
    .line 207
    goto :goto_3

    .line 208
    :cond_5
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    :goto_3
    const/4 v3, 0x3

    .line 213
    new-array v5, v3, [Ljava/lang/CharSequence;

    .line 214
    .line 215
    const-string v7, " "

    .line 216
    .line 217
    aput-object v7, v5, v1

    .line 218
    .line 219
    aput-object p1, v5, v2

    .line 220
    .line 221
    aput-object v7, v5, v6

    .line 222
    .line 223
    invoke-static {v5}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    if-eqz v0, :cond_6

    .line 232
    .line 233
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 234
    .line 235
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Qj:I

    .line 236
    .line 237
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->k:Lv/VText;

    .line 242
    .line 243
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 244
    .line 245
    .line 246
    goto :goto_4

    .line 247
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 248
    .line 249
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Mj:I

    .line 250
    .line 251
    invoke-virtual {v2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v5

    .line 259
    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    invoke-virtual {v2, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 264
    .line 265
    .line 266
    move-result v5

    .line 267
    const/4 v6, -0x1

    .line 268
    if-eq v5, v6, :cond_7

    .line 269
    .line 270
    new-instance v6, Landroid/text/SpannableStringBuilder;

    .line 271
    .line 272
    invoke-direct {v6, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 273
    .line 274
    .line 275
    new-instance v2, Lv/text/CustomTypefaceSpan;

    .line 276
    .line 277
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 278
    .line 279
    const-string v8, "#212121"

    .line 280
    .line 281
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 282
    .line 283
    .line 284
    move-result v8

    .line 285
    const/16 v9, 0x16

    .line 286
    .line 287
    invoke-static {v9}, Ll/qa00;->f(I)I

    .line 288
    .line 289
    .line 290
    move-result v9

    .line 291
    const-string v10, "sans-serif"

    .line 292
    .line 293
    invoke-direct {v2, v10, v7, v8, v9}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    add-int/2addr p1, v5

    .line 301
    const/16 v7, 0x21

    .line 302
    .line 303
    invoke-virtual {v6, v2, v5, p1, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 304
    .line 305
    .line 306
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->k:Lv/VText;

    .line 307
    .line 308
    invoke-virtual {p1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 309
    .line 310
    .line 311
    goto :goto_4

    .line 312
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->k:Lv/VText;

    .line 313
    .line 314
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 315
    .line 316
    .line 317
    :goto_4
    const/16 p1, 0x2710

    .line 318
    .line 319
    if-gt v4, p1, :cond_9

    .line 320
    .line 321
    invoke-static {v4, v1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 326
    .line 327
    if-eqz v0, :cond_8

    .line 328
    .line 329
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Oj:I

    .line 330
    .line 331
    goto :goto_5

    .line 332
    :cond_8
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Kj:I

    .line 333
    .line 334
    :goto_5
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object v2

    .line 342
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v1

    .line 346
    invoke-virtual {v1, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 347
    .line 348
    .line 349
    move-result v2

    .line 350
    new-instance v4, Ll/smd0;

    .line 351
    .line 352
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 353
    .line 354
    .line 355
    move-result-object v5

    .line 356
    const/high16 v6, 0x40400000    # 3.0f

    .line 357
    .line 358
    invoke-static {v5, v6}, Ll/jvd;->a(Landroid/content/Context;F)I

    .line 359
    .line 360
    .line 361
    move-result v5

    .line 362
    const-string v6, "#f2bd61"

    .line 363
    .line 364
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 365
    .line 366
    .line 367
    move-result v6

    .line 368
    const-string v7, "#ffffff"

    .line 369
    .line 370
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 371
    .line 372
    .line 373
    move-result v7

    .line 374
    new-instance v8, Ll/smd0$a;

    .line 375
    .line 376
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->l:Lv/VText;

    .line 377
    .line 378
    invoke-virtual {v9}, Landroid/widget/TextView;->getTextSize()F

    .line 379
    .line 380
    .line 381
    move-result v9

    .line 382
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 383
    .line 384
    .line 385
    move-result v10

    .line 386
    add-int/2addr v10, v2

    .line 387
    invoke-direct {v8, v3, v9, v10}, Ll/smd0$a;-><init>(IFI)V

    .line 388
    .line 389
    .line 390
    filled-new-array {v8}, [Ll/smd0$a;

    .line 391
    .line 392
    .line 393
    move-result-object v3

    .line 394
    invoke-direct {v4, v5, v6, v7, v3}, Ll/smd0;-><init>(III[Ll/smd0$a;)V

    .line 395
    .line 396
    .line 397
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 398
    .line 399
    invoke-direct {v3, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 403
    .line 404
    .line 405
    move-result p1

    .line 406
    add-int/2addr p1, v2

    .line 407
    const/16 v1, 0x12

    .line 408
    .line 409
    invoke-virtual {v3, v4, v2, p1, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 410
    .line 411
    .line 412
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->l:Lv/VText;

    .line 413
    .line 414
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 415
    .line 416
    .line 417
    goto :goto_7

    .line 418
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->l:Lv/VText;

    .line 419
    .line 420
    if-eqz v0, :cond_a

    .line 421
    .line 422
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Pj:I

    .line 423
    .line 424
    goto :goto_6

    .line 425
    :cond_a
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Lj:I

    .line 426
    .line 427
    :goto_6
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 428
    .line 429
    .line 430
    :goto_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->m:Lv/VText;

    .line 431
    .line 432
    if-eqz v0, :cond_b

    .line 433
    .line 434
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Nj:I

    .line 435
    .line 436
    goto :goto_8

    .line 437
    :cond_b
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Jj:I

    .line 438
    .line 439
    :goto_8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 440
    .line 441
    .line 442
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->m:Lv/VText;

    .line 443
    .line 444
    new-instance v0, Ll/i230;

    .line 445
    .line 446
    invoke-direct {v0, p2}, Ll/i230;-><init>(Ll/x20;)V

    .line 447
    .line 448
    .line 449
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 450
    .line 451
    .line 452
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->n:Lv/VText;

    .line 453
    .line 454
    new-instance p2, Ll/j230;

    .line 455
    .line 456
    invoke-direct {p2, p3}, Ll/j230;-><init>(Ll/x20;)V

    .line 457
    .line 458
    .line 459
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 460
    .line 461
    .line 462
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 463
    .line 464
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->a:Lv/VDraweeView;

    .line 465
    .line 466
    const-string p2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlhZNUNBQVdCQllPSkJaWDVWNlVGVFkySVRCSEUyQzE0IiwidyI6OTMwLCJoIjo3MjAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0NjQ2NzcxODU1NDk1NzY1fQ.webp"

    .line 467
    .line 468
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;->z(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/k230;->a(Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
