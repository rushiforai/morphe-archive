.class public Ll/axk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zwk0;",
        ">;"
    }
.end annotation


# static fields
.field public static c:Ljava/lang/String; = "VChatWindowViewModel"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/vchat/window/VChatWindowView;

.field public b:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/axk0;->b:Z

    .line 6
    .line 7
    return-void
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

.method public a(Ll/zwk0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/axk0;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/window/VChatWindowView;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/axk0;->b:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Ll/axk0;->c:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Ll/yti;->c(Ljava/lang/String;)Ll/jul;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    instance-of v1, v0, Ll/udj;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    move-object v1, v0

    .line 21
    check-cast v1, Ll/udj;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/udj;->d()V

    .line 24
    .line 25
    .line 26
    :cond_1
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-interface {v0}, Ll/lul;->cancel()V

    .line 29
    .line 30
    .line 31
    :cond_2
    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p0, Ll/axk0;->b:Z

    .line 33
    .line 34
    :cond_3
    :goto_0
    return-void
.end method

.method public c(Landroid/view/View$OnClickListener;Ljava/lang/String;)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/axk0;->b:Z

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
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 9
    .line 10
    iget-object v3, p0, Ll/axk0;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/window/VChatWindowView;

    .line 11
    .line 12
    if-nez v3, :cond_1

    .line 13
    .line 14
    sget v3, Ll/xec0;->I1:I

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {v2, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Lcom/p1/mobile/putong/live/external/internal/vchat/window/VChatWindowView;

    .line 22
    .line 23
    iput-object v3, p0, Ll/axk0;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/window/VChatWindowView;

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
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-eqz v4, :cond_2

    .line 39
    .line 40
    check-cast v3, Landroid/view/ViewGroup;

    .line 41
    .line 42
    iget-object v4, p0, Ll/axk0;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/window/VChatWindowView;

    .line 43
    .line 44
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    :goto_0
    iget-object v3, p0, Ll/axk0;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/window/VChatWindowView;

    .line 48
    .line 49
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/window/VChatWindowView;->setWindowData(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/sdj;->b()Ll/sdj$a;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p2, v2}, Ll/sdj$a;->s(Landroid/content/Context;)Ll/sdj$a;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iget-object v2, p0, Ll/axk0;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/window/VChatWindowView;

    .line 61
    .line 62
    invoke-virtual {p2, v2}, Ll/vdj$a;->i(Landroid/view/View;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    check-cast p2, Ll/sdj$a;

    .line 67
    .line 68
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 69
    .line 70
    const/high16 v3, 0x428c0000    # 70.0f

    .line 71
    .line 72
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    const/high16 v4, 0x42f80000    # 124.0f

    .line 77
    .line 78
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2, v2}, Ll/vdj$a;->j(Landroid/widget/FrameLayout$LayoutParams;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    check-cast p2, Ll/sdj$a;

    .line 90
    .line 91
    sget-object v2, Lcom/p1/mobile/putong/floatview/assist/FxGravity;->RIGHT_OR_TOP:Lcom/p1/mobile/putong/floatview/assist/FxGravity;

    .line 92
    .line 93
    invoke-virtual {p2, v2}, Ll/vdj$a;->h(Lcom/p1/mobile/putong/floatview/assist/FxGravity;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    check-cast p2, Ll/sdj$a;

    .line 98
    .line 99
    const/high16 v2, 0x41200000    # 10.0f

    .line 100
    .line 101
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    int-to-float v2, v2

    .line 106
    invoke-virtual {p2, v2}, Ll/vdj$a;->f(F)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    check-cast p2, Ll/sdj$a;

    .line 111
    .line 112
    const/high16 v2, 0x42300000    # 44.0f

    .line 113
    .line 114
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    int-to-float v2, v2

    .line 119
    const/high16 v3, 0x42600000    # 56.0f

    .line 120
    .line 121
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    int-to-float v3, v3

    .line 126
    const/4 v4, 0x0

    .line 127
    invoke-virtual {p2, v2, v4, v3, v4}, Ll/vdj$a;->e(FFFF)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    check-cast p2, Ll/sdj$a;

    .line 132
    .line 133
    invoke-virtual {p2, p1}, Ll/vdj$a;->l(Landroid/view/View$OnClickListener;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    check-cast p1, Ll/sdj$a;

    .line 138
    .line 139
    invoke-virtual {p1, v1}, Ll/vdj$a;->g(Z)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    check-cast p1, Ll/sdj$a;

    .line 144
    .line 145
    sget-object p2, Ll/axk0;->c:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {p1, p2}, Ll/sdj$a;->t(Ljava/lang/String;)Ll/sdj$a;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p1}, Ll/vdj$a;->d()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    check-cast p1, Ll/sdj$a;

    .line 156
    .line 157
    invoke-virtual {p1}, Ll/sdj$a;->q()Ll/sdj;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-static {p1}, Ll/yti;->f(Ll/sdj;)Ll/jul;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .line 163
    .line 164
    :try_start_1
    iput-boolean v1, p0, Ll/axk0;->b:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 165
    .line 166
    return v1

    .line 167
    :catch_1
    move-exception p0

    .line 168
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 169
    .line 170
    .line 171
    return v1
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/axk0;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zwk0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/axk0;->a(Ll/zwk0;)V

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

.method public isShowing()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/axk0;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/window/VChatWindowView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/axk0;->b:Z

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
