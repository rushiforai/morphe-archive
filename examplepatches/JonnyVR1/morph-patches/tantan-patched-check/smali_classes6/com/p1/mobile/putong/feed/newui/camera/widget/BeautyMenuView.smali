.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Landroid/view/View;

.field public b:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

.field public c:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

.field public d:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

.field public e:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyValueTipSeekBar;

.field public f:Ll/vmi;

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
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    const-string p2, "beauty_white_skin"

    .line 7
    .line 8
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    .line 9
    .line 10
    invoke-direct {p1, p2, v0, v1}, Ll/mxd0;-><init>(Ljava/lang/String;D)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->h:Ll/mxd0;

    .line 14
    .line 15
    new-instance p1, Ll/mxd0;

    .line 16
    .line 17
    const-string p2, "beauty_big_eye"

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->i:Ll/mxd0;

    .line 28
    .line 29
    new-instance p1, Ll/mxd0;

    .line 30
    .line 31
    const-string p2, "beauty_thin_face"

    .line 32
    .line 33
    const-wide/high16 v0, 0x3fd8000000000000L    # 0.375

    .line 34
    .line 35
    invoke-direct {p1, p2, v0, v1}, Ll/mxd0;-><init>(Ljava/lang/String;D)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->j:Ll/mxd0;

    .line 39
    .line 40
    const/4 p1, 0x1

    .line 41
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->o:Z

    .line 42
    .line 43
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->p:Z

    .line 44
    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->q:Z

    .line 46
    .line 47
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->k(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g:I

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;)Ll/vmi;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->f:Ll/vmi;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->l:F

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->m:F

    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zv2;->a(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final h(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyValueTipSeekBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->b:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;->setSelected(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->d:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;->setSelected(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final j()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->h:Ll/mxd0;

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
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->k:F

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->i:Ll/mxd0;

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
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->l:F

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->j:Ll/mxd0;

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
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->m:F

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->b:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->z0:I

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;->setText(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->b:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->b:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;->setSelected(Z)V

    .line 67
    .line 68
    .line 69
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g:I

    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->r0:I

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;->setText(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 87
    .line 88
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->d:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g()Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->s0:I

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;->setText(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->d:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 107
    .line 108
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyValueTipSeekBar;

    .line 112
    .line 113
    const/16 v1, 0x64

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyValueTipSeekBar;

    .line 119
    .line 120
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->k:F

    .line 121
    .line 122
    const/high16 v2, 0x42c80000    # 100.0f

    .line 123
    .line 124
    mul-float/2addr v1, v2

    .line 125
    float-to-int v1, v1

    .line 126
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->f:Ll/vmi;

    .line 130
    .line 131
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_0

    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->f:Ll/vmi;

    .line 138
    .line 139
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->m:F

    .line 140
    .line 141
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g:I

    .line 142
    .line 143
    invoke-interface {v0, v1, v2}, Ll/vmi;->n(FI)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->f:Ll/vmi;

    .line 147
    .line 148
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->k:F

    .line 149
    .line 150
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g:I

    .line 151
    .line 152
    invoke-interface {v0, v1, v2}, Ll/vmi;->n(FI)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->f:Ll/vmi;

    .line 156
    .line 157
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->l:F

    .line 158
    .line 159
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g:I

    .line 160
    .line 161
    invoke-interface {v0, v1, v2}, Ll/vmi;->n(FI)V

    .line 162
    .line 163
    .line 164
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyValueTipSeekBar;

    .line 165
    .line 166
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView$a;

    .line 167
    .line 168
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->a:Landroid/view/View;

    .line 175
    .line 176
    new-instance v1, Ll/yv2;

    .line 177
    .line 178
    invoke-direct {v1, p0}, Ll/yv2;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->h:Ll/mxd0;

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->k:F

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->i:Ll/mxd0;

    .line 14
    .line 15
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->l:F

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->j:Ll/mxd0;

    .line 26
    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->m:F

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->n:Ll/x20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->n:Ll/x20;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->i()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->b:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 9
    .line 10
    const/high16 v2, 0x42c80000    # 100.0f

    .line 11
    .line 12
    if-ne v1, p1, :cond_0

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g:I

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyValueTipSeekBar;

    .line 17
    .line 18
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->k:F

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
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->o:Z

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->h(Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 32
    .line 33
    if-ne v0, p1, :cond_1

    .line 34
    .line 35
    const/4 p1, 0x2

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g:I

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyValueTipSeekBar;

    .line 39
    .line 40
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->l:F

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
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->p:Z

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->h(Z)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->d:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuItemView;

    .line 54
    .line 55
    if-ne v0, p1, :cond_2

    .line 56
    .line 57
    const/4 p1, 0x3

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g:I

    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyValueTipSeekBar;

    .line 61
    .line 62
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->m:F

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
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->q:Z

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->h(Z)V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->j()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setBeautyBigEye(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->p:Z

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g:I

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->h(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setBeautyThinFace(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->q:Z

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->g:I

    .line 4
    .line 5
    const/4 v1, 0x3

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->h(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setFilterListener(Ll/vmi;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->f:Ll/vmi;

    .line 2
    .line 3
    return-void
.end method

.method public setMenuDismissListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->n:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
