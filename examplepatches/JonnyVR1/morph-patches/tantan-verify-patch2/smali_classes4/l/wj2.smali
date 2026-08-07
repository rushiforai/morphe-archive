.class public abstract Ll/wj2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/vj2<",
        "*>;>",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

.field public b:Ll/vj2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

.field public d:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object v0, p0, Ll/wj2;->d:Ljava/lang/Boolean;

    .line 7
    .line 8
    iput-object p1, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Ll/vj2;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wj2;->b:Ll/vj2;

    .line 2
    .line 3
    return-void
.end method

.method public abstract b()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation
.end method

.method public c(Lv/navigationbar/VNavigationBar;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    sget v0, Ll/ibc0;->G1:I

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    const-string v0, "\u804a\u5929\u5ba4\u6d88\u606f"

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jj()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    iget-object v0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 67
    .line 68
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->G2:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    :goto_0
    const-string v0, "\u6211\u7684\u544a\u767d"

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    :goto_1
    iget-object v0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_4

    .line 90
    .line 91
    iget-object v0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    sget v1, Ll/qec0;->G:I

    .line 98
    .line 99
    const/4 v2, 0x0

    .line 100
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 105
    .line 106
    iput-object v0, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 107
    .line 108
    const/4 v1, 0x1

    .line 109
    new-array v3, v1, [Landroid/view/View;

    .line 110
    .line 111
    aput-object v0, v3, v2

    .line 112
    .line 113
    invoke-virtual {p1, v3}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 117
    .line 118
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->b:Lv/VText;

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 128
    .line 129
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->c:Lv/VText;

    .line 130
    .line 131
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/wj2;->d:Ljava/lang/Boolean;

    .line 139
    .line 140
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_4

    .line 145
    .line 146
    iget-object p1, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 147
    .line 148
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_4

    .line 153
    .line 154
    iget-object p1, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 155
    .line 156
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->e:Landroid/app/Dialog;

    .line 157
    .line 158
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-eqz p1, :cond_4

    .line 163
    .line 164
    iget-object p1, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 165
    .line 166
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->g:Ljava/lang/Boolean;

    .line 167
    .line 168
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-eqz p1, :cond_4

    .line 173
    .line 174
    iget-object p0, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 175
    .line 176
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->e:Landroid/app/Dialog;

    .line 177
    .line 178
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 179
    .line 180
    .line 181
    :cond_4
    return-void
.end method

.method public abstract d()V
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract e()V
.end method

.method public f(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->Z1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 19
    .line 20
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->setSelectTag(Ljava/lang/Boolean;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public i()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->Z1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 24
    .line 25
    iget-object v2, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 26
    .line 27
    invoke-direct {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    const-string v2, "\u53ef\u8bbe\u7f6e\u4eca\u65e5\u662f\u5426\u63a5\u6536\u62db\u547c"

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v2, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 37
    .line 38
    sget v3, Ll/g9c0;->o:I

    .line 39
    .line 40
    invoke-static {v2, v3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    filled-new-array {v2}, [I

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sget v2, Ll/g9c0;->q:I

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const/4 v2, 0x1

    .line 59
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/high16 v2, 0x41600000    # 14.0f

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const/4 v2, 0x0

    .line 70
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-wide/16 v2, 0x1388

    .line 79
    .line 80
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    sget v2, Ll/qa00;->i:I

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    sget v2, Ll/zvk;->A:I

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 97
    .line 98
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-nez v2, :cond_1

    .line 107
    .line 108
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jj()Z

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    if-eqz v2, :cond_2

    .line 121
    .line 122
    :cond_1
    const-string v2, "\u53ef\u8bbe\u7f6e\u4eca\u65e5\u662f\u5426\u63a5\u6536\u544a\u767d"

    .line 123
    .line 124
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 125
    .line 126
    .line 127
    :cond_2
    iget-object p0, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 130
    .line 131
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 137
    .line 138
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/j;->R:Ll/jxd0;

    .line 139
    .line 140
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    :cond_3
    :goto_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vj2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wj2;->a(Ll/vj2;)V

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

.method public abstract r()V
.end method
