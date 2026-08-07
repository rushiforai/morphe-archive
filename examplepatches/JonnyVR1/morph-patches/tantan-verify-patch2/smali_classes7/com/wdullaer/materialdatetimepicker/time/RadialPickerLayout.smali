.class public Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;
    }
.end annotation


# instance fields
.field private A:Landroid/view/accessibility/AccessibilityManager;

.field private B:Landroid/animation/AnimatorSet;

.field private C:Landroid/os/Handler;

.field private final a:I

.field private final b:I

.field private c:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

.field private d:Lcom/wdullaer/materialdatetimepicker/time/a;

.field private e:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;

.field private f:Z

.field private g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

.field private h:Z

.field private i:I

.field private j:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

.field private k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

.field private l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

.field private m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

.field private n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

.field private o:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

.field private p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

.field private q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

.field private r:Landroid/view/View;

.field private s:[I

.field private t:Z

.field private u:I

.field private v:Z

.field private w:Z

.field private x:I

.field private y:F

.field private z:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, -0x1

    .line 5
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 6
    .line 7
    new-instance v0, Landroid/os/Handler;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->C:Landroid/os/Handler;

    .line 13
    .line 14
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->a:I

    .line 26
    .line 27
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->b:I

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->v:Z

    .line 35
    .line 36
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    .line 37
    .line 38
    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->j:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 47
    .line 48
    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 57
    .line 58
    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;-><init>(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 67
    .line 68
    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;-><init>(Landroid/content/Context;)V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 72
    .line 73
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 74
    .line 75
    .line 76
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 77
    .line 78
    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;-><init>(Landroid/content/Context;)V

    .line 79
    .line 80
    .line 81
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 82
    .line 83
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 84
    .line 85
    .line 86
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 87
    .line 88
    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;-><init>(Landroid/content/Context;)V

    .line 89
    .line 90
    .line 91
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 94
    .line 95
    .line 96
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 97
    .line 98
    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;-><init>(Landroid/content/Context;)V

    .line 99
    .line 100
    .line 101
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 102
    .line 103
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 104
    .line 105
    .line 106
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 107
    .line 108
    invoke-direct {v1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;-><init>(Landroid/content/Context;)V

    .line 109
    .line 110
    .line 111
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 112
    .line 113
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 114
    .line 115
    .line 116
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->r()V

    .line 117
    .line 118
    .line 119
    const/4 v1, 0x0

    .line 120
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->c:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 121
    .line 122
    const/4 v1, 0x1

    .line 123
    iput-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->t:Z

    .line 124
    .line 125
    new-instance v1, Landroid/view/View;

    .line 126
    .line 127
    invoke-direct {v1, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 128
    .line 129
    .line 130
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->r:Landroid/view/View;

    .line 131
    .line 132
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 133
    .line 134
    invoke-direct {v2, p2, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 138
    .line 139
    .line 140
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->r:Landroid/view/View;

    .line 141
    .line 142
    sget v1, Ll/q9c0;->t:I

    .line 143
    .line 144
    invoke-static {p1, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    invoke-virtual {p2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 149
    .line 150
    .line 151
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->r:Landroid/view/View;

    .line 152
    .line 153
    const/4 v1, 0x4

    .line 154
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 155
    .line 156
    .line 157
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->r:Landroid/view/View;

    .line 158
    .line 159
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 160
    .line 161
    .line 162
    const-string p2, "accessibility"

    .line 163
    .line 164
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    check-cast p1, Landroid/view/accessibility/AccessibilityManager;

    .line 169
    .line 170
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->A:Landroid/view/accessibility/AccessibilityManager;

    .line 171
    .line 172
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->f:Z

    .line 173
    .line 174
    return-void
.end method

.method public static synthetic a(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;Lcom/wdullaer/materialdatetimepicker/time/Timepoint;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->s(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;ZI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->e:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 2
    .line 3
    return-object p0
.end method

.method private getCurrentlyShowingValue()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/4 p0, -0x1

    .line 14
    return p0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_2
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public static synthetic h(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->v:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic i(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->c:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->c:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic k(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;IZZ)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o(IZZ)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;Lcom/wdullaer/materialdatetimepicker/time/Timepoint;I)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->t(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;I)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private n(FFZ[Ljava/lang/Boolean;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/4 p0, -0x1

    .line 14
    return p0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a(FFZ[Ljava/lang/Boolean;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 23
    .line 24
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a(FFZ[Ljava/lang/Boolean;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_2
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->a(FFZ[Ljava/lang/Boolean;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method private o(IZZ)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;
    .locals 6

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x2

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x1

    .line 13
    if-nez p3, :cond_2

    .line 14
    .line 15
    if-eq v0, v3, :cond_1

    .line 16
    .line 17
    if-ne v0, v1, :cond_2

    .line 18
    .line 19
    :cond_1
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->x(I)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    goto :goto_0

    .line 24
    :cond_2
    invoke-static {p1, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->w(II)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    :goto_0
    if-eqz v0, :cond_3

    .line 29
    .line 30
    const/4 p3, 0x6

    .line 31
    goto :goto_1

    .line 32
    :cond_3
    const/16 p3, 0x1e

    .line 33
    .line 34
    :goto_1
    const/16 v4, 0x168

    .line 35
    .line 36
    if-nez v0, :cond_7

    .line 37
    .line 38
    iget-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 39
    .line 40
    if-eqz v5, :cond_6

    .line 41
    .line 42
    if-nez p1, :cond_4

    .line 43
    .line 44
    if-eqz p2, :cond_4

    .line 45
    .line 46
    :goto_2
    move p1, v4

    .line 47
    goto :goto_4

    .line 48
    :cond_4
    if-ne p1, v4, :cond_8

    .line 49
    .line 50
    if-nez p2, :cond_8

    .line 51
    .line 52
    :cond_5
    :goto_3
    move p1, v2

    .line 53
    goto :goto_4

    .line 54
    :cond_6
    if-nez p1, :cond_8

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_7
    if-ne p1, v4, :cond_8

    .line 58
    .line 59
    if-eq v0, v3, :cond_5

    .line 60
    .line 61
    if-ne v0, v1, :cond_8

    .line 62
    .line 63
    goto :goto_3

    .line 64
    :cond_8
    :goto_4
    div-int p3, p1, p3

    .line 65
    .line 66
    if-nez v0, :cond_9

    .line 67
    .line 68
    iget-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 69
    .line 70
    if-eqz v5, :cond_9

    .line 71
    .line 72
    if-nez p2, :cond_9

    .line 73
    .line 74
    if-eqz p1, :cond_9

    .line 75
    .line 76
    add-int/lit8 p3, p3, 0xc

    .line 77
    .line 78
    :cond_9
    if-eqz v0, :cond_c

    .line 79
    .line 80
    if-eq v0, v3, :cond_b

    .line 81
    .line 82
    if-eq v0, v1, :cond_a

    .line 83
    .line 84
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_a
    new-instance p1, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 88
    .line 89
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 90
    .line 91
    invoke-virtual {p2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    invoke-direct {p1, p2, p0, p3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(III)V

    .line 102
    .line 103
    .line 104
    return-object p1

    .line 105
    :cond_b
    new-instance p1, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 106
    .line 107
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 108
    .line 109
    invoke-virtual {p2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-direct {p1, p2, p3, p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(III)V

    .line 120
    .line 121
    .line 122
    return-object p1

    .line 123
    :cond_c
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 124
    .line 125
    if-nez p2, :cond_d

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getIsCurrentlyAmOrPm()I

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    if-ne p2, v3, :cond_d

    .line 132
    .line 133
    if-eq p1, v4, :cond_d

    .line 134
    .line 135
    add-int/lit8 p3, p3, 0xc

    .line 136
    .line 137
    :cond_d
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 138
    .line 139
    if-nez p2, :cond_e

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getIsCurrentlyAmOrPm()I

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    if-nez p2, :cond_e

    .line 146
    .line 147
    if-ne p1, v4, :cond_e

    .line 148
    .line 149
    goto :goto_5

    .line 150
    :cond_e
    move v2, p3

    .line 151
    :goto_5
    new-instance p1, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 152
    .line 153
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 154
    .line 155
    invoke-virtual {p2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    invoke-direct {p1, v2, p2, p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(III)V

    .line 166
    .line 167
    .line 168
    return-object p1
.end method

.method private q(I)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0xc

    .line 6
    .line 7
    if-gt p1, p0, :cond_0

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private r()V
    .locals 7

    .line 1
    const/16 v0, 0x169

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->s:[I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    const/16 v3, 0x8

    .line 10
    .line 11
    move v5, v2

    .line 12
    move v4, v3

    .line 13
    move v3, v1

    .line 14
    :goto_0
    if-ge v1, v0, :cond_3

    .line 15
    .line 16
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->s:[I

    .line 17
    .line 18
    aput v3, v6, v1

    .line 19
    .line 20
    if-ne v5, v4, :cond_2

    .line 21
    .line 22
    add-int/lit8 v3, v3, 0x6

    .line 23
    .line 24
    const/16 v4, 0x168

    .line 25
    .line 26
    if-ne v3, v4, :cond_0

    .line 27
    .line 28
    const/4 v4, 0x7

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    rem-int/lit8 v4, v3, 0x1e

    .line 31
    .line 32
    if-nez v4, :cond_1

    .line 33
    .line 34
    const/16 v4, 0xe

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    const/4 v4, 0x4

    .line 38
    :goto_1
    move v5, v2

    .line 39
    goto :goto_2

    .line 40
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 41
    .line 42
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    return-void
.end method

.method private s(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;ZI)V
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p3, :cond_2

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eq p3, v1, :cond_1

    .line 7
    .line 8
    if-eq p3, v0, :cond_0

    .line 9
    .line 10
    goto/16 :goto_0

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    mul-int/lit16 p3, p3, 0x168

    .line 17
    .line 18
    div-int/lit8 p3, p3, 0x3c

    .line 19
    .line 20
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 21
    .line 22
    invoke-virtual {v3, p3, v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c(IZZ)V

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p2, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 32
    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :cond_1
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    mul-int/lit16 p3, p3, 0x168

    .line 41
    .line 42
    div-int/lit8 p3, p3, 0x3c

    .line 43
    .line 44
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 45
    .line 46
    invoke-virtual {v3, p3, v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c(IZZ)V

    .line 47
    .line 48
    .line 49
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {p3, v3}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 59
    .line 60
    .line 61
    move-result p3

    .line 62
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 63
    .line 64
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eq p3, v3, :cond_6

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    mul-int/lit16 p3, p3, 0x168

    .line 75
    .line 76
    div-int/lit8 p3, p3, 0x3c

    .line 77
    .line 78
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 79
    .line 80
    invoke-virtual {v3, p3, v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c(IZZ)V

    .line 81
    .line 82
    .line 83
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-virtual {p2, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 94
    .line 95
    .line 96
    move-result p3

    .line 97
    invoke-direct {p0, p3}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q(I)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    rem-int/lit8 v3, p3, 0xc

    .line 102
    .line 103
    mul-int/lit16 v4, v3, 0x168

    .line 104
    .line 105
    div-int/lit8 v4, v4, 0xc

    .line 106
    .line 107
    iget-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 108
    .line 109
    if-nez v5, :cond_3

    .line 110
    .line 111
    move p3, v3

    .line 112
    :cond_3
    if-nez v5, :cond_4

    .line 113
    .line 114
    if-nez p3, :cond_4

    .line 115
    .line 116
    add-int/lit8 p3, p3, 0xc

    .line 117
    .line 118
    :cond_4
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 119
    .line 120
    invoke-virtual {v3, v4, v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c(IZZ)V

    .line 121
    .line 122
    .line 123
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 124
    .line 125
    invoke-virtual {v3, p3}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 129
    .line 130
    .line 131
    move-result p3

    .line 132
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 133
    .line 134
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-eq p3, v3, :cond_5

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 141
    .line 142
    .line 143
    move-result p3

    .line 144
    mul-int/lit16 p3, p3, 0x168

    .line 145
    .line 146
    div-int/lit8 p3, p3, 0x3c

    .line 147
    .line 148
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 149
    .line 150
    invoke-virtual {v3, p3, v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c(IZZ)V

    .line 151
    .line 152
    .line 153
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 154
    .line 155
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    invoke-virtual {p3, v3}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 160
    .line 161
    .line 162
    :cond_5
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 163
    .line 164
    .line 165
    move-result p3

    .line 166
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 167
    .line 168
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    if-eq p3, v3, :cond_6

    .line 173
    .line 174
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 175
    .line 176
    .line 177
    move-result p3

    .line 178
    mul-int/lit16 p3, p3, 0x168

    .line 179
    .line 180
    div-int/lit8 p3, p3, 0x3c

    .line 181
    .line 182
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 183
    .line 184
    invoke-virtual {v3, p3, v2, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->c(IZZ)V

    .line 185
    .line 186
    .line 187
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 188
    .line 189
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    invoke-virtual {p2, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 194
    .line 195
    .line 196
    :cond_6
    :goto_0
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-eqz p1, :cond_9

    .line 201
    .line 202
    if-eq p1, v1, :cond_8

    .line 203
    .line 204
    if-eq p1, v0, :cond_7

    .line 205
    .line 206
    return-void

    .line 207
    :cond_7
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 208
    .line 209
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 210
    .line 211
    .line 212
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 213
    .line 214
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :cond_8
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 219
    .line 220
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 221
    .line 222
    .line 223
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 224
    .line 225
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_9
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 230
    .line 231
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 232
    .line 233
    .line 234
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 235
    .line 236
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method private t(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;I)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;
    .locals 1

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p2, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p2, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 13
    .line 14
    sget-object p2, Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;->SECOND:Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;

    .line 15
    .line 16
    invoke-interface {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->b(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 22
    .line 23
    sget-object p2, Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;->MINUTE:Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;

    .line 24
    .line 25
    invoke-interface {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->b(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_2
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 31
    .line 32
    sget-object p2, Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;->HOUR:Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;

    .line 33
    .line 34
    invoke-interface {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->b(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method private v(ILcom/wdullaer/materialdatetimepicker/time/Timepoint;)V
    .locals 1

    .line 1
    invoke-direct {p0, p2, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->t(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;I)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p2, v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->s(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;ZI)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static w(II)I
    .locals 3

    .line 1
    div-int/lit8 v0, p0, 0x1e

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1e

    .line 4
    .line 5
    add-int/lit8 v1, v0, 0x1e

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-ne p1, v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v2, -0x1

    .line 12
    if-ne p1, v2, :cond_1

    .line 13
    .line 14
    if-ne p0, v0, :cond_2

    .line 15
    .line 16
    add-int/lit8 v0, v0, -0x1e

    .line 17
    .line 18
    return v0

    .line 19
    :cond_1
    sub-int p1, p0, v0

    .line 20
    .line 21
    sub-int p0, v1, p0

    .line 22
    .line 23
    if-ge p1, p0, :cond_3

    .line 24
    .line 25
    :cond_2
    return v0

    .line 26
    :cond_3
    :goto_0
    return v1
.end method

.method private x(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->s:[I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    aget p0, p0, p1

    .line 8
    .line 9
    return p0
.end method


# virtual methods
.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x20

    .line 6
    .line 7
    if-ne v0, v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/16 v1, 0xa

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 27
    .line 28
    .line 29
    const/16 v1, 0xc

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 36
    .line 37
    .line 38
    const/16 v1, 0xd

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getSeconds()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 52
    .line 53
    const/4 v3, 0x1

    .line 54
    if-eqz v2, :cond_0

    .line 55
    .line 56
    const/16 v2, 0x81

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    move v2, v3

    .line 60
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0, v0, v1, v2}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    return v3

    .line 76
    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    return p0
.end method

.method public getCurrentItemShowing()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->i:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "Current item showing was unfortunately set to "

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->i:I

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "RadialPickerLayout"

    .line 28
    .line 29
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    const/4 p0, -0x1

    .line 33
    return p0

    .line 34
    :cond_0
    return v0
.end method

.method public getHours()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getIsCurrentlyAmOrPm()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->i()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, -0x1

    .line 22
    return p0
.end method

.method public getMinutes()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSeconds()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getTime()Lcom/wdullaer/materialdatetimepicker/time/Timepoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    return-object p0
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0
    .param p1    # Landroid/view/accessibility/AccessibilityNodeInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_BACKWARD:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 7
    .line 8
    .line 9
    sget-object p0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->ACTION_SCROLL_FORWARD:Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 9

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 10
    .line 11
    filled-new-array {v1}, [Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, -0x1

    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x1

    .line 23
    if-eqz p2, :cond_11

    .line 24
    .line 25
    if-eq p2, v5, :cond_8

    .line 26
    .line 27
    const/4 v6, 0x2

    .line 28
    if-eq p2, v6, :cond_0

    .line 29
    .line 30
    goto/16 :goto_3

    .line 31
    .line 32
    :cond_0
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->t:Z

    .line 33
    .line 34
    if-nez p2, :cond_1

    .line 35
    .line 36
    const-string p0, "RadialPickerLayout"

    .line 37
    .line 38
    const-string p1, "Input was disabled, but received ACTION_MOVE."

    .line 39
    .line 40
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return v5

    .line 44
    :cond_1
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->z:F

    .line 45
    .line 46
    sub-float p2, v0, p2

    .line 47
    .line 48
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    iget v6, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->y:F

    .line 53
    .line 54
    sub-float v6, p1, v6

    .line 55
    .line 56
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    iget-boolean v7, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->v:Z

    .line 61
    .line 62
    if-nez v7, :cond_2

    .line 63
    .line 64
    iget v7, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->a:I

    .line 65
    .line 66
    int-to-float v8, v7

    .line 67
    cmpg-float v6, v6, v8

    .line 68
    .line 69
    if-gtz v6, :cond_2

    .line 70
    .line 71
    int-to-float v6, v7

    .line 72
    cmpg-float p2, p2, v6

    .line 73
    .line 74
    if-gtz p2, :cond_2

    .line 75
    .line 76
    goto/16 :goto_3

    .line 77
    .line 78
    :cond_2
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 79
    .line 80
    if-eqz p2, :cond_7

    .line 81
    .line 82
    if-ne p2, v5, :cond_3

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->x:I

    .line 86
    .line 87
    if-ne p2, v3, :cond_4

    .line 88
    .line 89
    goto/16 :goto_3

    .line 90
    .line 91
    :cond_4
    iput-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->v:Z

    .line 92
    .line 93
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->C:Landroid/os/Handler;

    .line 94
    .line 95
    invoke-virtual {p2, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    invoke-direct {p0, p1, v0, v5, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n(FFZ[Ljava/lang/Boolean;)I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eq p1, v3, :cond_6

    .line 103
    .line 104
    aget-object p2, v1, v4

    .line 105
    .line 106
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    invoke-direct {p0, p1, p2, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o(IZZ)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    invoke-direct {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->t(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;I)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    invoke-direct {p0, p1, v5, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->s(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;ZI)V

    .line 127
    .line 128
    .line 129
    if-eqz p1, :cond_6

    .line 130
    .line 131
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->c:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 132
    .line 133
    if-eqz p2, :cond_5

    .line 134
    .line 135
    invoke-virtual {p2, p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    if-nez p2, :cond_6

    .line 140
    .line 141
    :cond_5
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 142
    .line 143
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->w()V

    .line 144
    .line 145
    .line 146
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->c:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 147
    .line 148
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->e:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;

    .line 149
    .line 150
    invoke-interface {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;->c(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)V

    .line 151
    .line 152
    .line 153
    :cond_6
    return v5

    .line 154
    :cond_7
    :goto_0
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->C:Landroid/os/Handler;

    .line 155
    .line 156
    invoke-virtual {p2, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 160
    .line 161
    invoke-virtual {p2, p1, v0}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a(FF)I

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 166
    .line 167
    if-eq p1, p2, :cond_10

    .line 168
    .line 169
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 170
    .line 171
    invoke-virtual {p1, v3}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPmPressed(I)V

    .line 172
    .line 173
    .line 174
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 175
    .line 176
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 177
    .line 178
    .line 179
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 180
    .line 181
    goto/16 :goto_3

    .line 182
    .line 183
    :cond_8
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->t:Z

    .line 184
    .line 185
    if-nez p2, :cond_9

    .line 186
    .line 187
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->e:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;

    .line 188
    .line 189
    invoke-interface {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;->d()V

    .line 190
    .line 191
    .line 192
    return v5

    .line 193
    :cond_9
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->C:Landroid/os/Handler;

    .line 194
    .line 195
    invoke-virtual {p2, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 196
    .line 197
    .line 198
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->w:Z

    .line 199
    .line 200
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 201
    .line 202
    if-eqz p2, :cond_c

    .line 203
    .line 204
    if-ne p2, v5, :cond_a

    .line 205
    .line 206
    goto :goto_1

    .line 207
    :cond_a
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->x:I

    .line 208
    .line 209
    if-eq p2, v3, :cond_b

    .line 210
    .line 211
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->v:Z

    .line 212
    .line 213
    invoke-direct {p0, p1, v0, p2, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n(FFZ[Ljava/lang/Boolean;)I

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    if-eq p1, v3, :cond_b

    .line 218
    .line 219
    aget-object p2, v1, v4

    .line 220
    .line 221
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->v:Z

    .line 226
    .line 227
    xor-int/2addr v0, v5

    .line 228
    invoke-direct {p0, p1, p2, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o(IZZ)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 233
    .line 234
    .line 235
    move-result p2

    .line 236
    invoke-direct {p0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->t(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;I)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 241
    .line 242
    .line 243
    move-result p2

    .line 244
    invoke-direct {p0, p1, v4, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->s(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;ZI)V

    .line 245
    .line 246
    .line 247
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 248
    .line 249
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->e:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;

    .line 250
    .line 251
    invoke-interface {p2, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;->c(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)V

    .line 252
    .line 253
    .line 254
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->e:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;

    .line 255
    .line 256
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 257
    .line 258
    .line 259
    move-result p2

    .line 260
    invoke-interface {p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;->e(I)V

    .line 261
    .line 262
    .line 263
    :cond_b
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->v:Z

    .line 264
    .line 265
    return v5

    .line 266
    :cond_c
    :goto_1
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 267
    .line 268
    invoke-virtual {p2, p1, v0}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a(FF)I

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 273
    .line 274
    invoke-virtual {p2, v3}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPmPressed(I)V

    .line 275
    .line 276
    .line 277
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 278
    .line 279
    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    .line 280
    .line 281
    .line 282
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 283
    .line 284
    if-ne p1, p2, :cond_f

    .line 285
    .line 286
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 287
    .line 288
    invoke-virtual {p2, p1}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPm(I)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getIsCurrentlyAmOrPm()I

    .line 292
    .line 293
    .line 294
    move-result p2

    .line 295
    if-eq p2, p1, :cond_f

    .line 296
    .line 297
    new-instance p1, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 298
    .line 299
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 300
    .line 301
    invoke-direct {p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)V

    .line 302
    .line 303
    .line 304
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 305
    .line 306
    if-nez p2, :cond_d

    .line 307
    .line 308
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->m()V

    .line 309
    .line 310
    .line 311
    goto :goto_2

    .line 312
    :cond_d
    if-ne p2, v5, :cond_e

    .line 313
    .line 314
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->n()V

    .line 315
    .line 316
    .line 317
    :cond_e
    :goto_2
    invoke-direct {p0, p1, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->t(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;I)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    invoke-direct {p0, p1, v4, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->s(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;ZI)V

    .line 322
    .line 323
    .line 324
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 325
    .line 326
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->e:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;

    .line 327
    .line 328
    invoke-interface {p2, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;->c(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)V

    .line 329
    .line 330
    .line 331
    :cond_f
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 332
    .line 333
    :cond_10
    :goto_3
    return v4

    .line 334
    :cond_11
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->t:Z

    .line 335
    .line 336
    if-nez p2, :cond_12

    .line 337
    .line 338
    return v5

    .line 339
    :cond_12
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->y:F

    .line 340
    .line 341
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->z:F

    .line 342
    .line 343
    iput-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->c:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 344
    .line 345
    iput-boolean v4, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->v:Z

    .line 346
    .line 347
    iput-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->w:Z

    .line 348
    .line 349
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 350
    .line 351
    if-nez p2, :cond_13

    .line 352
    .line 353
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 354
    .line 355
    invoke-interface {p2}, Lcom/wdullaer/materialdatetimepicker/time/a;->getVersion()Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 356
    .line 357
    .line 358
    move-result-object p2

    .line 359
    sget-object v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;->VERSION_1:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 360
    .line 361
    if-ne p2, v2, :cond_13

    .line 362
    .line 363
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 364
    .line 365
    invoke-virtual {p2, p1, v0}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->a(FF)I

    .line 366
    .line 367
    .line 368
    move-result p2

    .line 369
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 370
    .line 371
    goto :goto_4

    .line 372
    :cond_13
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 373
    .line 374
    :goto_4
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u:I

    .line 375
    .line 376
    if-eqz p2, :cond_16

    .line 377
    .line 378
    if-ne p2, v5, :cond_14

    .line 379
    .line 380
    goto :goto_5

    .line 381
    :cond_14
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->A:Landroid/view/accessibility/AccessibilityManager;

    .line 382
    .line 383
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    .line 384
    .line 385
    .line 386
    move-result p2

    .line 387
    invoke-direct {p0, p1, v0, p2, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n(FFZ[Ljava/lang/Boolean;)I

    .line 388
    .line 389
    .line 390
    move-result p1

    .line 391
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->x:I

    .line 392
    .line 393
    aget-object p2, v1, v4

    .line 394
    .line 395
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 396
    .line 397
    .line 398
    move-result p2

    .line 399
    invoke-direct {p0, p1, p2, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o(IZZ)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 400
    .line 401
    .line 402
    move-result-object p1

    .line 403
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 404
    .line 405
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 406
    .line 407
    .line 408
    move-result v0

    .line 409
    invoke-interface {p2, p1, v0}, Lcom/wdullaer/materialdatetimepicker/time/a;->h(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;I)Z

    .line 410
    .line 411
    .line 412
    move-result p1

    .line 413
    if-eqz p1, :cond_15

    .line 414
    .line 415
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->x:I

    .line 416
    .line 417
    :cond_15
    iget p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->x:I

    .line 418
    .line 419
    if-eq p1, v3, :cond_17

    .line 420
    .line 421
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 422
    .line 423
    invoke-interface {p1}, Lcom/wdullaer/materialdatetimepicker/time/a;->w()V

    .line 424
    .line 425
    .line 426
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->C:Landroid/os/Handler;

    .line 427
    .line 428
    new-instance p2, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$e;

    .line 429
    .line 430
    invoke-direct {p2, p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$e;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;[Ljava/lang/Boolean;)V

    .line 431
    .line 432
    .line 433
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->b:I

    .line 434
    .line 435
    int-to-long v0, p0

    .line 436
    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 437
    .line 438
    .line 439
    goto :goto_6

    .line 440
    :cond_16
    :goto_5
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 441
    .line 442
    invoke-interface {p1}, Lcom/wdullaer/materialdatetimepicker/time/a;->w()V

    .line 443
    .line 444
    .line 445
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->x:I

    .line 446
    .line 447
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->C:Landroid/os/Handler;

    .line 448
    .line 449
    new-instance p2, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$d;

    .line 450
    .line 451
    invoke-direct {p2, p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$d;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)V

    .line 452
    .line 453
    .line 454
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->b:I

    .line 455
    .line 456
    int-to-long v0, p0

    .line 457
    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 458
    .line 459
    .line 460
    :cond_17
    :goto_6
    return v5
.end method

.method public p(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/a;Lcom/wdullaer/materialdatetimepicker/time/Timepoint;Z)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    iget-boolean v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->f:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v0, "RadialPickerLayout"

    .line 10
    .line 11
    const-string v1, "Time has already been initialized."

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    move-object/from16 v1, p2

    .line 18
    .line 19
    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 20
    .line 21
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->A:Landroid/view/accessibility/AccessibilityManager;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v3, 0x0

    .line 28
    const/4 v8, 0x1

    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    if-eqz p4, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    move v1, v3

    .line 35
    goto :goto_1

    .line 36
    :cond_2
    :goto_0
    move v1, v8

    .line 37
    :goto_1
    iput-boolean v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 38
    .line 39
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->j:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    .line 40
    .line 41
    iget-object v4, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 42
    .line 43
    invoke-virtual {v1, v2, v4}, Lcom/wdullaer/materialdatetimepicker/time/CircleView;->a(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/a;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->j:Lcom/wdullaer/materialdatetimepicker/time/CircleView;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    .line 49
    .line 50
    .line 51
    iget-boolean v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 52
    .line 53
    if-nez v1, :cond_3

    .line 54
    .line 55
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 56
    .line 57
    invoke-interface {v1}, Lcom/wdullaer/materialdatetimepicker/time/a;->getVersion()Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sget-object v4, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;->VERSION_1:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 62
    .line 63
    if-ne v1, v4, :cond_3

    .line 64
    .line 65
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 66
    .line 67
    iget-object v4, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 68
    .line 69
    invoke-virtual/range {p3 .. p3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->h()Z

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    xor-int/2addr v5, v8

    .line 74
    invoke-virtual {v1, v2, v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->b(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/a;I)V

    .line 75
    .line 76
    .line 77
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 78
    .line 79
    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    .line 80
    .line 81
    .line 82
    :cond_3
    new-instance v9, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$a;

    .line 83
    .line 84
    invoke-direct {v9, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$a;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)V

    .line 85
    .line 86
    .line 87
    new-instance v10, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$b;

    .line 88
    .line 89
    invoke-direct {v10, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$b;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)V

    .line 90
    .line 91
    .line 92
    new-instance v6, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$c;

    .line 93
    .line 94
    invoke-direct {v6, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$c;-><init>(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;)V

    .line 95
    .line 96
    .line 97
    const/16 v11, 0xc

    .line 98
    .line 99
    new-array v12, v11, [I

    .line 100
    .line 101
    fill-array-data v12, :array_0

    .line 102
    .line 103
    .line 104
    new-array v1, v11, [I

    .line 105
    .line 106
    fill-array-data v1, :array_1

    .line 107
    .line 108
    .line 109
    new-array v4, v11, [I

    .line 110
    .line 111
    fill-array-data v4, :array_2

    .line 112
    .line 113
    .line 114
    new-array v5, v11, [I

    .line 115
    .line 116
    fill-array-data v5, :array_3

    .line 117
    .line 118
    .line 119
    move v7, v3

    .line 120
    new-array v3, v11, [Ljava/lang/String;

    .line 121
    .line 122
    new-array v13, v11, [Ljava/lang/String;

    .line 123
    .line 124
    new-array v14, v11, [Ljava/lang/String;

    .line 125
    .line 126
    new-array v15, v11, [Ljava/lang/String;

    .line 127
    .line 128
    :goto_2
    if-ge v7, v11, :cond_5

    .line 129
    .line 130
    move/from16 p2, v11

    .line 131
    .line 132
    const-string v11, "%d"

    .line 133
    .line 134
    const-string v8, "%02d"

    .line 135
    .line 136
    if-eqz p4, :cond_4

    .line 137
    .line 138
    move-object/from16 v16, v1

    .line 139
    .line 140
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    aget v17, v16, v7

    .line 145
    .line 146
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 147
    .line 148
    .line 149
    move-result-object v17

    .line 150
    filled-new-array/range {v17 .. v17}, [Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-static {v1, v8, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    goto :goto_3

    .line 159
    :cond_4
    move-object/from16 v16, v1

    .line 160
    .line 161
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    aget v2, v12, v7

    .line 166
    .line 167
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-static {v1, v11, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    :goto_3
    aput-object v1, v3, v7

    .line 180
    .line 181
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    aget v2, v12, v7

    .line 186
    .line 187
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-static {v1, v11, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    aput-object v1, v13, v7

    .line 200
    .line 201
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    aget v2, v4, v7

    .line 206
    .line 207
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-static {v1, v8, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    aput-object v1, v14, v7

    .line 220
    .line 221
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    aget v2, v5, v7

    .line 226
    .line 227
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-static {v1, v8, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    aput-object v1, v15, v7

    .line 240
    .line 241
    add-int/lit8 v7, v7, 0x1

    .line 242
    .line 243
    move-object/from16 v2, p1

    .line 244
    .line 245
    move/from16 v11, p2

    .line 246
    .line 247
    move-object/from16 v1, v16

    .line 248
    .line 249
    const/4 v8, 0x1

    .line 250
    goto :goto_2

    .line 251
    :cond_5
    move/from16 p2, v11

    .line 252
    .line 253
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 254
    .line 255
    if-eqz p4, :cond_6

    .line 256
    .line 257
    :goto_4
    move-object v4, v13

    .line 258
    goto :goto_5

    .line 259
    :cond_6
    const/4 v13, 0x0

    .line 260
    goto :goto_4

    .line 261
    :goto_5
    iget-object v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 262
    .line 263
    const/4 v7, 0x1

    .line 264
    move-object/from16 v2, p1

    .line 265
    .line 266
    invoke-virtual/range {v1 .. v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->d(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Lcom/wdullaer/materialdatetimepicker/time/a;Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$c;Z)V

    .line 267
    .line 268
    .line 269
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 270
    .line 271
    invoke-virtual/range {p3 .. p3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 272
    .line 273
    .line 274
    move-result v2

    .line 275
    if-eqz p4, :cond_7

    .line 276
    .line 277
    goto :goto_6

    .line 278
    :cond_7
    rem-int/lit8 v2, v2, 0xc

    .line 279
    .line 280
    aget v2, v12, v2

    .line 281
    .line 282
    :goto_6
    invoke-virtual {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 283
    .line 284
    .line 285
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 286
    .line 287
    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    .line 288
    .line 289
    .line 290
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 291
    .line 292
    iget-object v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 293
    .line 294
    const/4 v7, 0x0

    .line 295
    const/4 v4, 0x0

    .line 296
    move-object/from16 v2, p1

    .line 297
    .line 298
    move-object v6, v10

    .line 299
    move-object v3, v14

    .line 300
    invoke-virtual/range {v1 .. v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->d(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Lcom/wdullaer/materialdatetimepicker/time/a;Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$c;Z)V

    .line 301
    .line 302
    .line 303
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 304
    .line 305
    invoke-virtual/range {p3 .. p3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 306
    .line 307
    .line 308
    move-result v2

    .line 309
    invoke-virtual {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 310
    .line 311
    .line 312
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 313
    .line 314
    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    .line 315
    .line 316
    .line 317
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 318
    .line 319
    iget-object v5, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 320
    .line 321
    move-object/from16 v2, p1

    .line 322
    .line 323
    move-object v6, v9

    .line 324
    move-object v3, v15

    .line 325
    invoke-virtual/range {v1 .. v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->d(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Lcom/wdullaer/materialdatetimepicker/time/a;Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView$c;Z)V

    .line 326
    .line 327
    .line 328
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 329
    .line 330
    invoke-virtual/range {p3 .. p3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 331
    .line 332
    .line 333
    move-result v2

    .line 334
    invoke-virtual {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->setSelection(I)V

    .line 335
    .line 336
    .line 337
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 338
    .line 339
    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    .line 340
    .line 341
    .line 342
    move-object/from16 v8, p3

    .line 343
    .line 344
    iput-object v8, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 345
    .line 346
    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 347
    .line 348
    .line 349
    move-result v1

    .line 350
    rem-int/lit8 v1, v1, 0xc

    .line 351
    .line 352
    mul-int/lit8 v6, v1, 0x1e

    .line 353
    .line 354
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 355
    .line 356
    iget-object v3, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 357
    .line 358
    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 359
    .line 360
    .line 361
    move-result v2

    .line 362
    invoke-direct {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q(I)Z

    .line 363
    .line 364
    .line 365
    move-result v7

    .line 366
    const/4 v5, 0x1

    .line 367
    move-object/from16 v2, p1

    .line 368
    .line 369
    move/from16 v4, p4

    .line 370
    .line 371
    invoke-virtual/range {v1 .. v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->b(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/a;ZZIZ)V

    .line 372
    .line 373
    .line 374
    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 375
    .line 376
    .line 377
    move-result v1

    .line 378
    mul-int/lit8 v6, v1, 0x6

    .line 379
    .line 380
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 381
    .line 382
    iget-object v3, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 383
    .line 384
    const/4 v5, 0x0

    .line 385
    const/4 v7, 0x0

    .line 386
    const/4 v4, 0x0

    .line 387
    invoke-virtual/range {v1 .. v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->b(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/a;ZZIZ)V

    .line 388
    .line 389
    .line 390
    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 391
    .line 392
    .line 393
    move-result v1

    .line 394
    mul-int/lit8 v6, v1, 0x6

    .line 395
    .line 396
    iget-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 397
    .line 398
    iget-object v3, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->d:Lcom/wdullaer/materialdatetimepicker/time/a;

    .line 399
    .line 400
    invoke-virtual/range {v1 .. v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->b(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/a;ZZIZ)V

    .line 401
    .line 402
    .line 403
    const/4 v1, 0x1

    .line 404
    iput-boolean v1, v0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->f:Z

    .line 405
    .line 406
    return-void

    .line 407
    :array_0
    .array-data 4
        0xc
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0xa
        0xb
    .end array-data

    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    :array_1
    .array-data 4
        0x0
        0xd
        0xe
        0xf
        0x10
        0x11
        0x12
        0x13
        0x14
        0x15
        0x16
        0x17
    .end array-data

    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    :array_2
    .array-data 4
        0x0
        0x5
        0xa
        0xf
        0x14
        0x19
        0x1e
        0x23
        0x28
        0x2d
        0x32
        0x37
    .end array-data

    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    :array_3
    .array-data 4
        0x0
        0x5
        0xa
        0xf
        0x14
        0x19
        0x1e
        0x23
        0x28
        0x2d
        0x32
        0x37
    .end array-data
.end method

.method public performAccessibilityAction(ILandroid/os/Bundle;)Z
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/16 p2, 0x1000

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-ne p1, p2, :cond_1

    .line 13
    .line 14
    move p1, v0

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/16 p2, 0x2000

    .line 17
    .line 18
    if-ne p1, p2, :cond_2

    .line 19
    .line 20
    const/4 p1, -0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_2
    move p1, v1

    .line 23
    :goto_0
    if-eqz p1, :cond_d

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentlyShowingValue()I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/4 v3, 0x2

    .line 34
    if-nez v2, :cond_3

    .line 35
    .line 36
    rem-int/lit8 p2, p2, 0xc

    .line 37
    .line 38
    const/16 v4, 0x1e

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_3
    const/4 v4, 0x6

    .line 42
    if-ne v2, v0, :cond_4

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_4
    if-ne v2, v3, :cond_5

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_5
    move v4, v1

    .line 49
    :goto_1
    mul-int/2addr p2, v4

    .line 50
    invoke-static {p2, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->w(II)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    div-int/2addr p1, v4

    .line 55
    if-nez v2, :cond_7

    .line 56
    .line 57
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->h:Z

    .line 58
    .line 59
    if-eqz p2, :cond_6

    .line 60
    .line 61
    const/16 p2, 0x17

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_6
    const/16 p2, 0xc

    .line 65
    .line 66
    move v1, v0

    .line 67
    goto :goto_2

    .line 68
    :cond_7
    const/16 p2, 0x37

    .line 69
    .line 70
    :goto_2
    if-le p1, p2, :cond_8

    .line 71
    .line 72
    move p1, v1

    .line 73
    goto :goto_3

    .line 74
    :cond_8
    if-ge p1, v1, :cond_9

    .line 75
    .line 76
    move p1, p2

    .line 77
    :cond_9
    :goto_3
    if-eqz v2, :cond_c

    .line 78
    .line 79
    if-eq v2, v0, :cond_b

    .line 80
    .line 81
    if-eq v2, v3, :cond_a

    .line 82
    .line 83
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 84
    .line 85
    goto :goto_5

    .line 86
    :cond_a
    new-instance p2, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 87
    .line 88
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 95
    .line 96
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-direct {p2, v1, v3, p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(III)V

    .line 101
    .line 102
    .line 103
    :goto_4
    move-object p1, p2

    .line 104
    goto :goto_5

    .line 105
    :cond_b
    new-instance p2, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 106
    .line 107
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 108
    .line 109
    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 114
    .line 115
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    invoke-direct {p2, v1, p1, v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(III)V

    .line 120
    .line 121
    .line 122
    goto :goto_4

    .line 123
    :cond_c
    new-instance p2, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 124
    .line 125
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 132
    .line 133
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    invoke-direct {p2, p1, v1, v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(III)V

    .line 138
    .line 139
    .line 140
    goto :goto_4

    .line 141
    :goto_5
    invoke-direct {p0, v2, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->v(ILcom/wdullaer/materialdatetimepicker/time/Timepoint;)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->e:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;

    .line 145
    .line 146
    invoke-interface {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;->c(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)V

    .line 147
    .line 148
    .line 149
    return v0

    .line 150
    :cond_d
    return v1
.end method

.method public setAmOrPm(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;->setAmOrPm(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->k:Lcom/wdullaer/materialdatetimepicker/time/AmPmCirclesView;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)V

    .line 16
    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->m()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x1

    .line 25
    if-ne p1, v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->n()V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 31
    invoke-direct {p0, v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->t(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;I)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-direct {p0, v0, p1, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->s(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;ZI)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->g:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->e:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;

    .line 41
    .line 42
    invoke-interface {p0, v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;->c(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public setOnValueSelectedListener(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->e:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;

    .line 2
    .line 3
    return-void
.end method

.method public setTime(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->v(ILcom/wdullaer/materialdatetimepicker/time/Timepoint;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public u(IZ)V
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    if-eq p1, v1, :cond_0

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p2, "TimePicker does not support view at index "

    .line 12
    .line 13
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "RadialPickerLayout"

    .line 24
    .line 25
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->i:I

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    if-eqz p2, :cond_8

    .line 37
    .line 38
    if-eq p1, v2, :cond_8

    .line 39
    .line 40
    const/4 p2, 0x4

    .line 41
    new-array p2, p2, [Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    const/4 v4, 0x3

    .line 44
    if-ne p1, v1, :cond_1

    .line 45
    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    aput-object p1, p2, v3

    .line 55
    .line 56
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    aput-object p1, p2, v1

    .line 63
    .line 64
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    aput-object p1, p2, v0

    .line 71
    .line 72
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    aput-object p1, p2, v4

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :cond_1
    if-nez p1, :cond_2

    .line 83
    .line 84
    if-ne v2, v1, :cond_2

    .line 85
    .line 86
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    aput-object p1, p2, v3

    .line 93
    .line 94
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    aput-object p1, p2, v1

    .line 101
    .line 102
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    aput-object p1, p2, v0

    .line 109
    .line 110
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    aput-object p1, p2, v4

    .line 117
    .line 118
    goto/16 :goto_0

    .line 119
    .line 120
    :cond_2
    if-ne p1, v1, :cond_3

    .line 121
    .line 122
    if-ne v2, v0, :cond_3

    .line 123
    .line 124
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    aput-object p1, p2, v3

    .line 131
    .line 132
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    aput-object p1, p2, v1

    .line 139
    .line 140
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    aput-object p1, p2, v0

    .line 147
    .line 148
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    aput-object p1, p2, v4

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_3
    if-nez p1, :cond_4

    .line 158
    .line 159
    if-ne v2, v0, :cond_4

    .line 160
    .line 161
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 162
    .line 163
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    aput-object p1, p2, v3

    .line 168
    .line 169
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 170
    .line 171
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    aput-object p1, p2, v1

    .line 176
    .line 177
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 178
    .line 179
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    aput-object p1, p2, v0

    .line 184
    .line 185
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 186
    .line 187
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    aput-object p1, p2, v4

    .line 192
    .line 193
    goto :goto_0

    .line 194
    :cond_4
    if-ne p1, v0, :cond_5

    .line 195
    .line 196
    if-ne v2, v1, :cond_5

    .line 197
    .line 198
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 199
    .line 200
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    aput-object p1, p2, v3

    .line 205
    .line 206
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 207
    .line 208
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    aput-object p1, p2, v1

    .line 213
    .line 214
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 215
    .line 216
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    aput-object p1, p2, v0

    .line 221
    .line 222
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 223
    .line 224
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    aput-object p1, p2, v4

    .line 229
    .line 230
    goto :goto_0

    .line 231
    :cond_5
    if-ne p1, v0, :cond_6

    .line 232
    .line 233
    if-nez v2, :cond_6

    .line 234
    .line 235
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 236
    .line 237
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    aput-object p1, p2, v3

    .line 242
    .line 243
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 244
    .line 245
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getReappearAnimator()Landroid/animation/ObjectAnimator;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    aput-object p1, p2, v1

    .line 250
    .line 251
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 252
    .line 253
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    aput-object p1, p2, v0

    .line 258
    .line 259
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 260
    .line 261
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;->getDisappearAnimator()Landroid/animation/ObjectAnimator;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    aput-object p1, p2, v4

    .line 266
    .line 267
    :cond_6
    :goto_0
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->B:Landroid/animation/AnimatorSet;

    .line 268
    .line 269
    if-eqz p1, :cond_7

    .line 270
    .line 271
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-eqz p1, :cond_7

    .line 276
    .line 277
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->B:Landroid/animation/AnimatorSet;

    .line 278
    .line 279
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->end()V

    .line 280
    .line 281
    .line 282
    :cond_7
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 283
    .line 284
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 285
    .line 286
    .line 287
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->B:Landroid/animation/AnimatorSet;

    .line 288
    .line 289
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 290
    .line 291
    .line 292
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->B:Landroid/animation/AnimatorSet;

    .line 293
    .line 294
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 295
    .line 296
    .line 297
    return-void

    .line 298
    :cond_8
    if-nez p1, :cond_9

    .line 299
    .line 300
    move p2, v1

    .line 301
    goto :goto_1

    .line 302
    :cond_9
    move p2, v3

    .line 303
    :goto_1
    if-ne p1, v1, :cond_a

    .line 304
    .line 305
    move v2, v1

    .line 306
    goto :goto_2

    .line 307
    :cond_a
    move v2, v3

    .line 308
    :goto_2
    if-ne p1, v0, :cond_b

    .line 309
    .line 310
    goto :goto_3

    .line 311
    :cond_b
    move v1, v3

    .line 312
    :goto_3
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->l:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 313
    .line 314
    int-to-float p2, p2

    .line 315
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 316
    .line 317
    .line 318
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 319
    .line 320
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 321
    .line 322
    .line 323
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->m:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 324
    .line 325
    int-to-float p2, v2

    .line 326
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 327
    .line 328
    .line 329
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 330
    .line 331
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 332
    .line 333
    .line 334
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->n:Lcom/wdullaer/materialdatetimepicker/time/RadialTextsView;

    .line 335
    .line 336
    int-to-float p2, v1

    .line 337
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 338
    .line 339
    .line 340
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->q:Lcom/wdullaer/materialdatetimepicker/time/RadialSelectorView;

    .line 341
    .line 342
    invoke-virtual {p0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 343
    .line 344
    .line 345
    return-void
.end method

.method public y(Z)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->w:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->t:Z

    .line 10
    .line 11
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->r:Landroid/view/View;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x4

    .line 16
    :cond_1
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0
.end method
