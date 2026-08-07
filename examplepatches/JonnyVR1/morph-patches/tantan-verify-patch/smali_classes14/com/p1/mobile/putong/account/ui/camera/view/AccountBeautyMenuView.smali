.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Landroid/view/View;

.field public b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

.field public c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

.field public d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

.field public e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyValueTipSeekBar;

.field public f:Ll/oo;

.field public g:I

.field public h:Ll/mxd0;

.field public i:Ll/mxd0;

.field public j:Ll/mxd0;

.field public k:F

.field public l:F

.field public m:F

.field public n:Ll/x20;

.field public o:Z

.field public p:Z

.field public q:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 49
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/mxd0;

    .line 5
    .line 6
    const-string p2, "account_beauty_white_skin"

    .line 7
    .line 8
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    .line 9
    .line 10
    invoke-direct {p1, p2, v0, v1}, Ll/mxd0;-><init>(Ljava/lang/String;D)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->h:Ll/mxd0;

    .line 14
    .line 15
    new-instance p1, Ll/mxd0;

    .line 16
    .line 17
    const-string p2, "account_beauty_big_eye"

    .line 18
    .line 19
    const-wide v0, 0x3fd3333340000000L    # 0.30000001192092896

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    invoke-direct {p1, p2, v0, v1}, Ll/mxd0;-><init>(Ljava/lang/String;D)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->i:Ll/mxd0;

    .line 28
    .line 29
    new-instance p1, Ll/mxd0;

    .line 30
    .line 31
    const-string p2, "account_beauty_thin_face"

    .line 32
    .line 33
    const-wide/high16 v0, 0x3fd8000000000000L    # 0.375

    .line 34
    .line 35
    invoke-direct {p1, p2, v0, v1}, Ll/mxd0;-><init>(Ljava/lang/String;D)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->j:Ll/mxd0;

    .line 39
    .line 40
    const/4 p1, 0x1

    .line 41
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->o:Z

    .line 42
    .line 43
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->p:Z

    .line 44
    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->q:Z

    .line 46
    .line 47
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->j(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;)Ll/oo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->f:Ll/oo;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g:I

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->l:F

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->m:F

    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/og;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyValueTipSeekBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;->setSelected(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;->setSelected(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->h:Ll/mxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Double;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->k:F

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->i:Ll/mxd0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Double;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->l:F

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->j:Ll/mxd0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Double;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->m:F

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 44
    .line 45
    const-string v1, "\u7f8e\u767d"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;->setText(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;->setSelected(Z)V

    .line 59
    .line 60
    .line 61
    iput v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g:I

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 64
    .line 65
    const-string v1, "\u5927\u773c"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;->setText(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 76
    .line 77
    const-string v1, "\u7626\u8138"

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;->setText(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 83
    .line 84
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyValueTipSeekBar;

    .line 88
    .line 89
    const/16 v1, 0x64

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyValueTipSeekBar;

    .line 95
    .line 96
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->k:F

    .line 97
    .line 98
    const/high16 v2, 0x42c80000    # 100.0f

    .line 99
    .line 100
    mul-float/2addr v1, v2

    .line 101
    float-to-int v1, v1

    .line 102
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->f:Ll/oo;

    .line 106
    .line 107
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_0

    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->f:Ll/oo;

    .line 114
    .line 115
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->m:F

    .line 116
    .line 117
    iget v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g:I

    .line 118
    .line 119
    invoke-interface {v0, v1, v2}, Ll/oo;->n(FI)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->f:Ll/oo;

    .line 123
    .line 124
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->k:F

    .line 125
    .line 126
    iget v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g:I

    .line 127
    .line 128
    invoke-interface {v0, v1, v2}, Ll/oo;->n(FI)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->f:Ll/oo;

    .line 132
    .line 133
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->l:F

    .line 134
    .line 135
    iget v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g:I

    .line 136
    .line 137
    invoke-interface {v0, v1, v2}, Ll/oo;->n(FI)V

    .line 138
    .line 139
    .line 140
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyValueTipSeekBar;

    .line 141
    .line 142
    new-instance v1, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView$a;

    .line 143
    .line 144
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView$a;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->a:Landroid/view/View;

    .line 151
    .line 152
    new-instance v1, Ll/ng;

    .line 153
    .line 154
    invoke-direct {v1, p0}, Ll/ng;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->h:Ll/mxd0;

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->k:F

    .line 4
    .line 5
    float-to-double v0, v0

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1, v0}, Ll/mxd0;->put(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->i:Ll/mxd0;

    .line 14
    .line 15
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->l:F

    .line 16
    .line 17
    float-to-double v0, v0

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, v0}, Ll/mxd0;->put(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->j:Ll/mxd0;

    .line 26
    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->m:F

    .line 28
    .line 29
    float-to-double v0, v0

    .line 30
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Ll/mxd0;->put(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->n:Ll/x20;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->n:Ll/x20;

    .line 46
    .line 47
    invoke-interface {p0}, Ll/x20;->call()V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->h()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 9
    .line 10
    const/high16 v2, 0x42c80000    # 100.0f

    .line 11
    .line 12
    if-ne v1, p1, :cond_0

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g:I

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyValueTipSeekBar;

    .line 17
    .line 18
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->k:F

    .line 19
    .line 20
    mul-float/2addr v0, v2

    .line 21
    float-to-int v0, v0

    .line 22
    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 23
    .line 24
    .line 25
    iget-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->o:Z

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g(Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 32
    .line 33
    if-ne v0, p1, :cond_1

    .line 34
    .line 35
    const/4 p1, 0x2

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g:I

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyValueTipSeekBar;

    .line 39
    .line 40
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->l:F

    .line 41
    .line 42
    mul-float/2addr v0, v2

    .line 43
    float-to-int v0, v0

    .line 44
    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 45
    .line 46
    .line 47
    iget-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->p:Z

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g(Z)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuItemView;

    .line 54
    .line 55
    if-ne v0, p1, :cond_2

    .line 56
    .line 57
    const/4 p1, 0x3

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g:I

    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->e:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyValueTipSeekBar;

    .line 61
    .line 62
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->m:F

    .line 63
    .line 64
    mul-float/2addr v0, v2

    .line 65
    float-to-int v0, v0

    .line 66
    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 67
    .line 68
    .line 69
    iget-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->q:Z

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g(Z)V

    .line 72
    .line 73
    .line 74
    :cond_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->i()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setBeautyBigEye(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->p:Z

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g:I

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setBeautyThinFace(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->q:Z

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g:I

    .line 4
    .line 5
    const/4 v1, 0x3

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->g(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setFilterListener(Ll/oo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->f:Ll/oo;

    .line 2
    .line 3
    return-void
.end method

.method public setMenuDismissListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMenuView;->n:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
