.class public Ll/pvg;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pvg$e;,
        Ll/pvg$b;,
        Ll/pvg$d;,
        Ll/pvg$c;
    }
.end annotation


# instance fields
.field public a:Ll/jxd0;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:I

.field public d:Ljava/lang/String;

.field public e:Ll/jl80;

.field public f:Ll/uul;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "HAS_SHOW_WRITER_LEVEL_DIALOG"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/pvg;->a:Ll/jxd0;

    .line 34
    .line 35
    iput-object p1, p0, Ll/pvg;->b:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    iput p2, p0, Ll/pvg;->c:I

    .line 38
    .line 39
    iput-object p3, p0, Ll/pvg;->d:Ljava/lang/String;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Ll/pvg;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pvg;->h(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Ll/pvg;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pvg;->g(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic c(Ll/pvg;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pvg;->f()V

    return-void
.end method

.method public static synthetic d()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final e()Ll/pvg$e;
    .locals 1

    .line 1
    iget v0, p0, Ll/pvg;->c:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/pvg$b;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/pvg$b;-><init>(Ll/pvg;)V

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    new-instance v0, Ll/pvg$d;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/pvg$d;-><init>(Ll/pvg;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public final synthetic f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pvg;->e:Ll/jl80;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/pvg;->d:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    new-array v1, v1, [Ll/tfj0$a;

    .line 10
    .line 11
    const-string v2, "e_moment_inspiration_post"

    .line 12
    .line 13
    invoke-static {v2, v0, v1}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/pvg;->b:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p0, v0}, Ll/cn40;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic g(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pvg;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pvg;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pvg;->f:Ll/uul;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pvg;->f:Ll/uul;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/uul;->c()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pvg;->f:Ll/uul;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pvg;->f:Ll/uul;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/uul;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public k(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 5
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    add-int/lit8 v1, p1, -0xa

    .line 11
    .line 12
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 13
    .line 14
    iget-object v3, p0, Ll/pvg;->b:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    sget v4, Ll/k9c0;->n:I

    .line 21
    .line 22
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 27
    .line 28
    .line 29
    const/16 v3, 0x21

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1, p1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/pvg$a;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/pvg$a;-><init>(Ll/pvg;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v2, v1, p1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 40
    .line 41
    .line 42
    return-object v0
.end method

.method public l()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pvg;->d:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v2, v1, [Ll/tfj0$a;

    .line 5
    .line 6
    const-string v3, "e_moment_inspiration_post"

    .line 7
    .line 8
    invoke-static {v3, v0, v2}, Ll/tfj0;->d(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/pvg;->e()Ll/pvg$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v2, Ll/jl80$a;

    .line 16
    .line 17
    iget-object v3, p0, Ll/pvg;->b:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-direct {v2, v3}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0}, Ll/pvg$e;->d()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {v2, v3}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v0}, Ll/pvg$e;->a()Ljava/lang/CharSequence;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v2, v3}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v0}, Ll/pvg$e;->b()Ljava/lang/CharSequence;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v2, v3}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-interface {v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_0

    .line 55
    .line 56
    sget v3, Ll/lbc0;->k:I

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    const/4 v3, -0x1

    .line 60
    :goto_0
    invoke-virtual {v2, v3}, Ll/jl80$a;->d0(I)Ll/jl80$a;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-interface {v0}, Ll/pvg$e;->e()Ljava/lang/CharSequence;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    new-instance v4, Ll/lvg;

    .line 69
    .line 70
    invoke-direct {v4, p0}, Ll/lvg;-><init>(Ll/pvg;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2, v3, v4}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {v0}, Ll/pvg$e;->c()Ljava/lang/CharSequence;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v3, Ll/mvg;

    .line 82
    .line 83
    invoke-direct {v3}, Ll/mvg;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v0, v3}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-instance v2, Ll/nvg;

    .line 95
    .line 96
    invoke-direct {v2, p0}, Ll/nvg;-><init>(Ll/pvg;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v2}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v2, Ll/ovg;

    .line 104
    .line 105
    invoke-direct {v2, p0}, Ll/ovg;-><init>(Ll/pvg;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Ll/pvg;->e:Ll/jl80;

    .line 117
    .line 118
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    sget v2, Ll/vcc0;->B0:I

    .line 127
    .line 128
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Landroid/widget/TextView;

    .line 133
    .line 134
    iget-object p0, p0, Ll/pvg;->e:Ll/jl80;

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    sget v2, Ll/vcc0;->A0:I

    .line 145
    .line 146
    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    check-cast p0, Landroid/widget/TextView;

    .line 151
    .line 152
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 160
    .line 161
    .line 162
    const/high16 v1, 0x41900000    # 18.0f

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 165
    .line 166
    .line 167
    const/high16 v0, 0x41600000    # 14.0f

    .line 168
    .line 169
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 170
    .line 171
    .line 172
    return-void
.end method
