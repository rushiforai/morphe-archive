.class public Ll/tzs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/pzs;",
        ">;"
    }
.end annotation


# static fields
.field public static e:Ljava/lang/String; = "LiveInAppFloatView"


# instance fields
.field public a:Ll/pzs;

.field public b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

.field public c:Z

.field public d:Landroid/view/GestureDetector;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/tzs;->c:Z

    .line 6
    .line 7
    new-instance v0, Landroid/view/GestureDetector;

    .line 8
    .line 9
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 10
    .line 11
    new-instance v2, Ll/tzs$a;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Ll/tzs$a;-><init>(Ll/tzs;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/tzs;->d:Landroid/view/GestureDetector;

    .line 20
    .line 21
    return-void
.end method

.method public static bridge synthetic a(Ll/tzs;)Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b(Ll/pzs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tzs;->a:Ll/pzs;

    .line 2
    .line 3
    return-void
.end method

.method public c(Z)V
    .locals 5

    .line 1
    sget-object v0, Ll/tzs;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/yti;->c(Ljava/lang/String;)Ll/jul;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/lul;->a()Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    sget-object v1, Ll/htd0;->e:Ll/htd0;

    .line 17
    .line 18
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ll/ifv;

    .line 23
    .line 24
    iget-object v2, v2, Ll/ifv;->s:Ll/fyd0;

    .line 25
    .line 26
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/ifv;

    .line 31
    .line 32
    iget-object v1, v1, Ll/ifv;->t:Ll/jxd0;

    .line 33
    .line 34
    invoke-virtual {v2}, Ll/fyd0;->f()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    invoke-virtual {v2}, Ll/fyd0;->d()D

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    double-to-float p1, v3

    .line 47
    invoke-virtual {v2}, Ll/fyd0;->e()D

    .line 48
    .line 49
    .line 50
    move-result-wide v2

    .line 51
    double-to-float v2, v2

    .line 52
    const/4 v3, 0x1

    .line 53
    invoke-virtual {v0, p1, v2, v3}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->s(FFZ)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 57
    .line 58
    if-eqz p0, :cond_0

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    xor-int/2addr p1, v3

    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;->setVoiceSelected(Z)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/tzs;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tzs;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 10
    .line 11
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tzs;->d()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 6
    .line 7
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()V
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Ll/tzs;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/yti;->c(Ljava/lang/String;)Ll/jul;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Ll/lul;->cancel()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Ll/tzs;->c:Z

    .line 19
    .line 20
    return-void
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/tzs;->c:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/pzs;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tzs;->b(Ll/pzs;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tzs;->a:Ll/pzs;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pzs;->i:Ll/eti;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;->d(Ll/eti;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k()Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/tzs;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :try_start_0
    iget-object v2, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 9
    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 13
    .line 14
    sget v3, Ll/yec0;->m2:I

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {v2, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 22
    .line 23
    iput-object v2, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    move v1, v0

    .line 28
    goto/16 :goto_1

    .line 29
    .line 30
    :cond_1
    :goto_0
    iget-object v2, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    instance-of v2, v2, Landroid/view/ViewGroup;

    .line 37
    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    iget-object v2, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 41
    .line 42
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Landroid/view/ViewGroup;

    .line 47
    .line 48
    iget-object v3, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object v2, p0, Ll/tzs;->a:Ll/pzs;

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/pzs;->s()F

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-static {v2}, Ll/vti;->a(F)[I

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    aget v3, v2, v0

    .line 64
    .line 65
    aget v2, v2, v1

    .line 66
    .line 67
    iget-object v4, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 68
    .line 69
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;->getPlayerContainer()Landroid/widget/FrameLayout;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 74
    .line 75
    invoke-direct {v5, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    invoke-static {}, Ll/sdj;->b()Ll/sdj$a;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    iget-object v5, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 86
    .line 87
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    invoke-virtual {v4, v5}, Ll/sdj$a;->s(Landroid/content/Context;)Ll/sdj$a;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    iget-object v5, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 96
    .line 97
    invoke-virtual {v4, v5}, Ll/vdj$a;->i(Landroid/view/View;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    check-cast v4, Ll/sdj$a;

    .line 102
    .line 103
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 104
    .line 105
    invoke-direct {v5, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v4, v5}, Ll/vdj$a;->j(Landroid/widget/FrameLayout$LayoutParams;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    check-cast v2, Ll/sdj$a;

    .line 113
    .line 114
    sget-object v3, Lcom/p1/mobile/putong/floatview/assist/FxGravity;->RIGHT_OR_TOP:Lcom/p1/mobile/putong/floatview/assist/FxGravity;

    .line 115
    .line 116
    invoke-virtual {v2, v3}, Ll/vdj$a;->h(Lcom/p1/mobile/putong/floatview/assist/FxGravity;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    check-cast v2, Ll/sdj$a;

    .line 121
    .line 122
    const/high16 v3, 0x42300000    # 44.0f

    .line 123
    .line 124
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    int-to-float v3, v3

    .line 129
    const/high16 v4, 0x42600000    # 56.0f

    .line 130
    .line 131
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    int-to-float v4, v4

    .line 136
    const/4 v5, 0x0

    .line 137
    invoke-virtual {v2, v3, v5, v4, v5}, Ll/vdj$a;->e(FFFF)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    check-cast v2, Ll/sdj$a;

    .line 142
    .line 143
    invoke-virtual {v2, v1}, Ll/vdj$a;->g(Z)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    check-cast v2, Ll/sdj$a;

    .line 148
    .line 149
    sget-object v3, Ll/tzs;->e:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {v2, v3}, Ll/sdj$a;->t(Ljava/lang/String;)Ll/sdj$a;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-virtual {v2}, Ll/vdj$a;->d()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    check-cast v2, Ll/sdj$a;

    .line 160
    .line 161
    new-instance v3, Ll/tzs$c;

    .line 162
    .line 163
    invoke-direct {v3, p0}, Ll/tzs$c;-><init>(Ll/tzs;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v2, v3}, Ll/vdj$a;->n(Ll/kul;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    check-cast v2, Ll/sdj$a;

    .line 171
    .line 172
    new-instance v3, Ll/tzs$b;

    .line 173
    .line 174
    invoke-direct {v3, p0}, Ll/tzs$b;-><init>(Ll/tzs;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v2, v3}, Ll/vdj$a;->o(Ll/mul;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    check-cast v2, Ll/sdj$a;

    .line 182
    .line 183
    invoke-virtual {v2}, Ll/sdj$a;->q()Ll/sdj;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-static {v2}, Ll/yti;->f(Ll/sdj;)Ll/jul;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    .line 189
    .line 190
    :try_start_1
    iput-boolean v1, p0, Ll/tzs;->c:Z

    .line 191
    .line 192
    invoke-virtual {p0}, Ll/tzs;->j()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 193
    .line 194
    .line 195
    return v1

    .line 196
    :catch_1
    move-exception p0

    .line 197
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 198
    .line 199
    .line 200
    return v1
.end method

.method public l(II)V
    .locals 2

    .line 1
    sget-object v0, Ll/tzs;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/yti;->c(Ljava/lang/String;)Ll/jul;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-interface {v0}, Ll/lul;->a()Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-interface {v0}, Ll/lul;->a()Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 31
    .line 32
    iput p2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 33
    .line 34
    invoke-interface {v0}, Ll/lul;->a()Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;->getPlayerContainer()Landroid/widget/FrameLayout;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Ll/tzs;->b:Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;->getPlayerContainer()Landroid/widget/FrameLayout;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 56
    .line 57
    invoke-direct {v0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    :goto_0
    return-void
.end method
