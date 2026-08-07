.class public Lcom/facebook/rebound/ui/SpringConfiguratorView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/rebound/ui/SpringConfiguratorView$e;,
        Lcom/facebook/rebound/ui/SpringConfiguratorView$c;,
        Lcom/facebook/rebound/ui/SpringConfiguratorView$b;,
        Lcom/facebook/rebound/ui/SpringConfiguratorView$d;,
        Lcom/facebook/rebound/ui/SpringConfiguratorView$f;
    }
.end annotation


# static fields
.field public static final n:Ljava/text/DecimalFormat;


# instance fields
.field public final a:Lcom/facebook/rebound/ui/SpringConfiguratorView$e;

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/uyf0;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ll/syf0;

.field public final d:F

.field public final e:F

.field public final f:Ll/vyf0;

.field public final g:I

.field public h:Landroid/widget/SeekBar;

.field public i:Landroid/widget/SeekBar;

.field public j:Landroid/widget/Spinner;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/TextView;

.field public m:Ll/uyf0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/text/DecimalFormat;

    .line 2
    .line 3
    const-string v1, "#.#"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->n:Ljava/text/DecimalFormat;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 143
    invoke-direct {p0, p1, v0}, Lcom/facebook/rebound/ui/SpringConfiguratorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 142
    invoke-direct {p0, p1, p2, v0}, Lcom/facebook/rebound/ui/SpringConfiguratorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->b:Ljava/util/List;

    .line 10
    .line 11
    const/16 p2, 0xff

    .line 12
    .line 13
    const/16 p3, 0xe1

    .line 14
    .line 15
    invoke-static {p2, p3, p3, p3}, Landroid/graphics/Color;->argb(IIII)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iput p2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->g:I

    .line 20
    .line 21
    invoke-static {}, Ll/izf0;->h()Ll/izf0;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-static {}, Ll/vyf0;->c()Ll/vyf0;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    iput-object p3, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->f:Ll/vyf0;

    .line 30
    .line 31
    new-instance p3, Lcom/facebook/rebound/ui/SpringConfiguratorView$e;

    .line 32
    .line 33
    invoke-direct {p3, p0, p1}, Lcom/facebook/rebound/ui/SpringConfiguratorView$e;-><init>(Lcom/facebook/rebound/ui/SpringConfiguratorView;Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    iput-object p3, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView$e;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/high16 v1, 0x42200000    # 40.0f

    .line 43
    .line 44
    invoke-static {v1, v0}, Ll/amk0;->d(FLandroid/content/res/Resources;)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    int-to-float v1, v1

    .line 49
    iput v1, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->e:F

    .line 50
    .line 51
    const/high16 v1, 0x438c0000    # 280.0f

    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/amk0;->d(FLandroid/content/res/Resources;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    int-to-float v0, v0

    .line 58
    iput v0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->d:F

    .line 59
    .line 60
    invoke-virtual {p2}, Ll/sr2;->c()Ll/syf0;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iput-object p2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->c:Ll/syf0;

    .line 65
    .line 66
    new-instance v1, Lcom/facebook/rebound/ui/SpringConfiguratorView$c;

    .line 67
    .line 68
    const/4 v2, 0x0

    .line 69
    invoke-direct {v1, p0, v2}, Lcom/facebook/rebound/ui/SpringConfiguratorView$c;-><init>(Lcom/facebook/rebound/ui/SpringConfiguratorView;Lcom/facebook/rebound/ui/SpringConfiguratorView$a;)V

    .line 70
    .line 71
    .line 72
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 73
    .line 74
    invoke-virtual {p2, v3, v4}, Ll/syf0;->m(D)Ll/syf0;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p2, v3, v4}, Ll/syf0;->o(D)Ll/syf0;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p2, v1}, Ll/syf0;->a(Ll/gzf0;)Ll/syf0;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->n(Landroid/content/Context;)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 90
    .line 91
    .line 92
    new-instance p1, Lcom/facebook/rebound/ui/SpringConfiguratorView$d;

    .line 93
    .line 94
    invoke-direct {p1, p0, v2}, Lcom/facebook/rebound/ui/SpringConfiguratorView$d;-><init>(Lcom/facebook/rebound/ui/SpringConfiguratorView;Lcom/facebook/rebound/ui/SpringConfiguratorView$a;)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->h:Landroid/widget/SeekBar;

    .line 98
    .line 99
    const v1, 0x186a0

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 103
    .line 104
    .line 105
    iget-object p2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->h:Landroid/widget/SeekBar;

    .line 106
    .line 107
    invoke-virtual {p2, p1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 108
    .line 109
    .line 110
    iget-object p2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->i:Landroid/widget/SeekBar;

    .line 111
    .line 112
    invoke-virtual {p2, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->i:Landroid/widget/SeekBar;

    .line 116
    .line 117
    invoke-virtual {p2, p1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->j:Landroid/widget/Spinner;

    .line 121
    .line 122
    invoke-virtual {p1, p3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->j:Landroid/widget/Spinner;

    .line 126
    .line 127
    new-instance p2, Lcom/facebook/rebound/ui/SpringConfiguratorView$f;

    .line 128
    .line 129
    invoke-direct {p2, p0, v2}, Lcom/facebook/rebound/ui/SpringConfiguratorView$f;-><init>(Lcom/facebook/rebound/ui/SpringConfiguratorView;Lcom/facebook/rebound/ui/SpringConfiguratorView$a;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, p2}, Landroid/widget/AdapterView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->o()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public static synthetic a(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Landroid/widget/SeekBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->i:Landroid/widget/SeekBar;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->k:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/facebook/rebound/ui/SpringConfiguratorView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/facebook/rebound/ui/SpringConfiguratorView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->e:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Lcom/facebook/rebound/ui/SpringConfiguratorView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Lcom/facebook/rebound/ui/SpringConfiguratorView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Ll/uyf0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->m:Ll/uyf0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/facebook/rebound/ui/SpringConfiguratorView;Ll/uyf0;)Ll/uyf0;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->m:Ll/uyf0;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic i(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Lcom/facebook/rebound/ui/SpringConfiguratorView;Ll/uyf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/facebook/rebound/ui/SpringConfiguratorView;->q(Ll/uyf0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Landroid/widget/SeekBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->h:Landroid/widget/SeekBar;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l()Ljava/text/DecimalFormat;
    .locals 1

    .line 1
    sget-object v0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->n:Ljava/text/DecimalFormat;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic m(Lcom/facebook/rebound/ui/SpringConfiguratorView;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final n(Landroid/content/Context;)Landroid/view/View;
    .locals 14

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x40a00000    # 5.0f

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/amk0;->d(FLandroid/content/res/Resources;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/high16 v2, 0x41200000    # 10.0f

    .line 12
    .line 13
    invoke-static {v2, v0}, Ll/amk0;->d(FLandroid/content/res/Resources;)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/high16 v3, 0x41a00000    # 20.0f

    .line 18
    .line 19
    invoke-static {v3, v0}, Ll/amk0;->d(FLandroid/content/res/Resources;)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    new-instance v4, Landroid/widget/TableLayout$LayoutParams;

    .line 24
    .line 25
    const/4 v5, -0x2

    .line 26
    const/high16 v6, 0x3f800000    # 1.0f

    .line 27
    .line 28
    const/4 v7, 0x0

    .line 29
    invoke-direct {v4, v7, v5, v6}, Landroid/widget/TableLayout$LayoutParams;-><init>(IIF)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v4, v7, v7, v1, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Landroid/widget/FrameLayout;

    .line 36
    .line 37
    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    const/high16 v5, 0x43960000    # 300.0f

    .line 41
    .line 42
    invoke-static {v5, v0}, Ll/amk0;->d(FLandroid/content/res/Resources;)I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    const/4 v6, -0x1

    .line 47
    invoke-static {v6, v5}, Ll/amk0;->a(II)Landroid/widget/FrameLayout$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {v1, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    new-instance v5, Landroid/widget/FrameLayout;

    .line 55
    .line 56
    invoke-direct {v5, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/amk0;->b()Landroid/widget/FrameLayout$LayoutParams;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    invoke-virtual {v8, v7, v3, v7, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    const/16 v8, 0x64

    .line 70
    .line 71
    invoke-static {v8, v7, v7, v7}, Landroid/graphics/Color;->argb(IIII)I

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    invoke-virtual {v5, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 79
    .line 80
    .line 81
    new-instance v8, Landroid/widget/Spinner;

    .line 82
    .line 83
    invoke-direct {v8, p1, v7}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;I)V

    .line 84
    .line 85
    .line 86
    iput-object v8, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->j:Landroid/widget/Spinner;

    .line 87
    .line 88
    invoke-static {}, Ll/amk0;->c()Landroid/widget/FrameLayout$LayoutParams;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    const/16 v9, 0x30

    .line 93
    .line 94
    iput v9, v8, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 95
    .line 96
    invoke-virtual {v8, v2, v2, v2, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 97
    .line 98
    .line 99
    iget-object v9, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->j:Landroid/widget/Spinner;

    .line 100
    .line 101
    invoke-virtual {v9, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    .line 103
    .line 104
    iget-object v8, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->j:Landroid/widget/Spinner;

    .line 105
    .line 106
    invoke-virtual {v5, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 107
    .line 108
    .line 109
    new-instance v8, Landroid/widget/LinearLayout;

    .line 110
    .line 111
    invoke-direct {v8, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Ll/amk0;->c()Landroid/widget/FrameLayout$LayoutParams;

    .line 115
    .line 116
    .line 117
    move-result-object v9

    .line 118
    const/high16 v10, 0x42a00000    # 80.0f

    .line 119
    .line 120
    invoke-static {v10, v0}, Ll/amk0;->d(FLandroid/content/res/Resources;)I

    .line 121
    .line 122
    .line 123
    move-result v10

    .line 124
    invoke-virtual {v9, v7, v7, v7, v10}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 125
    .line 126
    .line 127
    const/16 v10, 0x50

    .line 128
    .line 129
    iput v10, v9, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 130
    .line 131
    invoke-virtual {v8, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    .line 133
    .line 134
    const/4 v9, 0x1

    .line 135
    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v5, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 139
    .line 140
    .line 141
    new-instance v5, Landroid/widget/LinearLayout;

    .line 142
    .line 143
    invoke-direct {v5, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 144
    .line 145
    .line 146
    invoke-static {}, Ll/amk0;->c()Landroid/widget/FrameLayout$LayoutParams;

    .line 147
    .line 148
    .line 149
    move-result-object v10

    .line 150
    invoke-virtual {v10, v2, v2, v2, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v5, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v5, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v8, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 163
    .line 164
    .line 165
    new-instance v10, Landroid/widget/SeekBar;

    .line 166
    .line 167
    invoke-direct {v10, p1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 168
    .line 169
    .line 170
    iput-object v10, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->h:Landroid/widget/SeekBar;

    .line 171
    .line 172
    invoke-virtual {v10, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    .line 174
    .line 175
    iget-object v10, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->h:Landroid/widget/SeekBar;

    .line 176
    .line 177
    invoke-virtual {v5, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 178
    .line 179
    .line 180
    new-instance v10, Landroid/widget/TextView;

    .line 181
    .line 182
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 183
    .line 184
    .line 185
    move-result-object v11

    .line 186
    invoke-direct {v10, v11}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 187
    .line 188
    .line 189
    iput-object v10, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->l:Landroid/widget/TextView;

    .line 190
    .line 191
    iget v11, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->g:I

    .line 192
    .line 193
    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 194
    .line 195
    .line 196
    const/high16 v10, 0x42480000    # 50.0f

    .line 197
    .line 198
    invoke-static {v10, v0}, Ll/amk0;->d(FLandroid/content/res/Resources;)I

    .line 199
    .line 200
    .line 201
    move-result v11

    .line 202
    invoke-static {v11, v6}, Ll/amk0;->a(II)Landroid/widget/FrameLayout$LayoutParams;

    .line 203
    .line 204
    .line 205
    move-result-object v11

    .line 206
    iget-object v12, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->l:Landroid/widget/TextView;

    .line 207
    .line 208
    const/16 v13, 0x13

    .line 209
    .line 210
    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setGravity(I)V

    .line 211
    .line 212
    .line 213
    iget-object v12, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->l:Landroid/widget/TextView;

    .line 214
    .line 215
    invoke-virtual {v12, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 216
    .line 217
    .line 218
    iget-object v11, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->l:Landroid/widget/TextView;

    .line 219
    .line 220
    invoke-virtual {v11, v9}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 221
    .line 222
    .line 223
    iget-object v11, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->l:Landroid/widget/TextView;

    .line 224
    .line 225
    invoke-virtual {v5, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 226
    .line 227
    .line 228
    new-instance v5, Landroid/widget/LinearLayout;

    .line 229
    .line 230
    invoke-direct {v5, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 231
    .line 232
    .line 233
    invoke-static {}, Ll/amk0;->c()Landroid/widget/FrameLayout$LayoutParams;

    .line 234
    .line 235
    .line 236
    move-result-object v11

    .line 237
    invoke-virtual {v11, v2, v2, v2, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v5, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v5, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v8, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 250
    .line 251
    .line 252
    new-instance v2, Landroid/widget/SeekBar;

    .line 253
    .line 254
    invoke-direct {v2, p1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 255
    .line 256
    .line 257
    iput-object v2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->i:Landroid/widget/SeekBar;

    .line 258
    .line 259
    invoke-virtual {v2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 260
    .line 261
    .line 262
    iget-object v2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->i:Landroid/widget/SeekBar;

    .line 263
    .line 264
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 265
    .line 266
    .line 267
    new-instance v2, Landroid/widget/TextView;

    .line 268
    .line 269
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 270
    .line 271
    .line 272
    move-result-object v3

    .line 273
    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 274
    .line 275
    .line 276
    iput-object v2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->k:Landroid/widget/TextView;

    .line 277
    .line 278
    iget v3, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->g:I

    .line 279
    .line 280
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 281
    .line 282
    .line 283
    invoke-static {v10, v0}, Ll/amk0;->d(FLandroid/content/res/Resources;)I

    .line 284
    .line 285
    .line 286
    move-result v2

    .line 287
    invoke-static {v2, v6}, Ll/amk0;->a(II)Landroid/widget/FrameLayout$LayoutParams;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    iget-object v3, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->k:Landroid/widget/TextView;

    .line 292
    .line 293
    invoke-virtual {v3, v13}, Landroid/widget/TextView;->setGravity(I)V

    .line 294
    .line 295
    .line 296
    iget-object v3, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->k:Landroid/widget/TextView;

    .line 297
    .line 298
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 299
    .line 300
    .line 301
    iget-object v2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->k:Landroid/widget/TextView;

    .line 302
    .line 303
    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 304
    .line 305
    .line 306
    iget-object v2, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->k:Landroid/widget/TextView;

    .line 307
    .line 308
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 309
    .line 310
    .line 311
    new-instance v2, Landroid/view/View;

    .line 312
    .line 313
    invoke-direct {v2, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 314
    .line 315
    .line 316
    const/high16 p1, 0x42700000    # 60.0f

    .line 317
    .line 318
    invoke-static {p1, v0}, Ll/amk0;->d(FLandroid/content/res/Resources;)I

    .line 319
    .line 320
    .line 321
    move-result p1

    .line 322
    const/high16 v3, 0x42200000    # 40.0f

    .line 323
    .line 324
    invoke-static {v3, v0}, Ll/amk0;->d(FLandroid/content/res/Resources;)I

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    invoke-static {p1, v0}, Ll/amk0;->a(II)Landroid/widget/FrameLayout$LayoutParams;

    .line 329
    .line 330
    .line 331
    move-result-object p1

    .line 332
    const/16 v0, 0x31

    .line 333
    .line 334
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 335
    .line 336
    invoke-virtual {v2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 337
    .line 338
    .line 339
    new-instance p1, Lcom/facebook/rebound/ui/SpringConfiguratorView$b;

    .line 340
    .line 341
    const/4 v0, 0x0

    .line 342
    invoke-direct {p1, p0, v0}, Lcom/facebook/rebound/ui/SpringConfiguratorView$b;-><init>(Lcom/facebook/rebound/ui/SpringConfiguratorView;Lcom/facebook/rebound/ui/SpringConfiguratorView$a;)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v2, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 346
    .line 347
    .line 348
    const/16 p0, 0xa4

    .line 349
    .line 350
    const/16 p1, 0xd1

    .line 351
    .line 352
    const/16 v0, 0xff

    .line 353
    .line 354
    invoke-static {v0, v7, p0, p1}, Landroid/graphics/Color;->argb(IIII)I

    .line 355
    .line 356
    .line 357
    move-result p0

    .line 358
    invoke-virtual {v2, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 362
    .line 363
    .line 364
    return-object v1
.end method

.method public o()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->f:Ll/vyf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vyf0;->b()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView$e;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/facebook/rebound/ui/SpringConfiguratorView$e;->b()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->b:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Ljava/util/Map$Entry;

    .line 36
    .line 37
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    sget-object v4, Ll/uyf0;->c:Ll/uyf0;

    .line 42
    .line 43
    if-ne v3, v4, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v3, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->b:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    iget-object v3, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView$e;

    .line 56
    .line 57
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v3, v2}, Lcom/facebook/rebound/ui/SpringConfiguratorView$e;->a(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    iget-object v1, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->b:Ljava/util/List;

    .line 68
    .line 69
    sget-object v2, Ll/uyf0;->c:Ll/uyf0;

    .line 70
    .line 71
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView$e;

    .line 75
    .line 76
    sget-object v2, Ll/uyf0;->c:Ll/uyf0;

    .line 77
    .line 78
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, v0}, Lcom/facebook/rebound/ui/SpringConfiguratorView$e;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->a:Lcom/facebook/rebound/ui/SpringConfiguratorView$e;

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->b:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-lez v0, :cond_2

    .line 99
    .line 100
    iget-object p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->j:Landroid/widget/Spinner;

    .line 101
    .line 102
    const/4 v0, 0x0

    .line 103
    invoke-virtual {p0, v0}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 104
    .line 105
    .line 106
    :cond_2
    return-void
.end method

.method public final p()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->c:Ll/syf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/syf0;->f()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->c:Ll/syf0;

    .line 8
    .line 9
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 10
    .line 11
    cmpl-double v0, v0, v2

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0, v2, v3}, Ll/syf0;->o(D)Ll/syf0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final q(Ll/uyf0;)V
    .locals 5

    .line 1
    iget-wide v0, p1, Ll/uyf0;->b:D

    .line 2
    .line 3
    invoke-static {v0, v1}, Ll/b660;->c(D)D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    double-to-float v0, v0

    .line 8
    const/4 v1, 0x0

    .line 9
    sub-float/2addr v0, v1

    .line 10
    const v2, 0x47c35000    # 100000.0f

    .line 11
    .line 12
    .line 13
    mul-float/2addr v0, v2

    .line 14
    const/high16 v3, 0x43480000    # 200.0f

    .line 15
    .line 16
    div-float/2addr v0, v3

    .line 17
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-wide v3, p1, Ll/uyf0;->a:D

    .line 22
    .line 23
    invoke-static {v3, v4}, Ll/b660;->b(D)D

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    double-to-float p1, v3

    .line 28
    sub-float/2addr p1, v1

    .line 29
    mul-float/2addr p1, v2

    .line 30
    const/high16 v1, 0x42480000    # 50.0f

    .line 31
    .line 32
    div-float/2addr p1, v1

    .line 33
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object v1, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->h:Landroid/widget/SeekBar;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/facebook/rebound/ui/SpringConfiguratorView;->i:Landroid/widget/SeekBar;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
