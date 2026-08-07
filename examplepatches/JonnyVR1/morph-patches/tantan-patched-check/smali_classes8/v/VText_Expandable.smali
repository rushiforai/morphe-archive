.class public Lv/VText_Expandable;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/VText_Expandable$c;
    }
.end annotation


# static fields
.field public static s:Ljava/lang/String;

.field public static t:Ljava/lang/String;


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;

.field public c:Z

.field public d:Z

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:F

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Lv/VText_Expandable$c;

.field public q:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 18
    invoke-direct {p0, p1, v0}, Lv/VText_Expandable;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lv/VText_Expandable;->d:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lv/VText_Expandable;->k:Z

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Lv/VText_Expandable;->l:Z

    .line 11
    .line 12
    iput-boolean p1, p0, Lv/VText_Expandable;->m:Z

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lv/VText_Expandable;->k(Landroid/util/AttributeSet;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lv/VText_Expandable;->d:Z

    .line 21
    iput-boolean p1, p0, Lv/VText_Expandable;->k:Z

    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Lv/VText_Expandable;->l:Z

    .line 23
    iput-boolean p1, p0, Lv/VText_Expandable;->m:Z

    .line 24
    invoke-virtual {p0, p2}, Lv/VText_Expandable;->k(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lv/VText_Expandable;Ljava/lang/Float;Landroid/view/animation/Transformation;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lv/VText_Expandable;->m(Ljava/lang/Float;Landroid/view/animation/Transformation;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic b(Lv/VText_Expandable;)F
    .locals 0

    .line 1
    iget p0, p0, Lv/VText_Expandable;->j:F

    return p0
.end method

.method public static bridge synthetic c(Lv/VText_Expandable;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lv/VText_Expandable;->d:Z

    return p0
.end method

.method public static bridge synthetic d(Lv/VText_Expandable;)Lv/VText_Expandable$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VText_Expandable;->p:Lv/VText_Expandable$c;

    return-object p0
.end method

.method public static bridge synthetic e(Lv/VText_Expandable;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/VText_Expandable;->n:Z

    return-void
.end method

.method public static bridge synthetic f(Lv/VText_Expandable;I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VText_Expandable;->h:I

    return-void
.end method

.method public static bridge synthetic g(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lv/VText_Expandable;->h(Landroid/view/View;F)V

    return-void
.end method

.method public static h(Landroid/view/View;F)V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .line 1
    invoke-static {}, Lv/VText_Expandable;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    .line 12
    .line 13
    invoke-direct {v0, p1, p1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 14
    .line 15
    .line 16
    const-wide/16 v1, 0x0

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    invoke-virtual {v0, p1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static j(Landroid/widget/TextView;)I
    .locals 2
    .param p0    # Landroid/widget/TextView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/TextView;->getLineCount()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineTop(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingTop()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingBottom()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    add-int/2addr v1, p0

    .line 22
    add-int/2addr v0, v1

    .line 23
    return v0
.end method

.method public static l()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public getText()Ljava/lang/CharSequence;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public getTextView()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    check-cast v0, Lv/VText;

    .line 7
    .line 8
    iput-object v0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 9
    .line 10
    iget-boolean v1, p0, Lv/VText_Expandable;->l:Z

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VText;

    .line 23
    .line 24
    iput-object v0, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 25
    .line 26
    iget-boolean v1, p0, Lv/VText_Expandable;->m:Z

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 34
    .line 35
    iget-boolean v1, p0, Lv/VText_Expandable;->d:Z

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    sget-object v1, Lv/VText_Expandable;->s:Ljava/lang/String;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    sget-object v1, Lv/VText_Expandable;->t:Ljava/lang/String;

    .line 43
    .line 44
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final k(Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/hhc0;->u5:[I

    .line 6
    .line 7
    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Ll/hhc0;->y5:I

    .line 12
    .line 13
    const/4 v1, 0x4

    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lv/VText_Expandable;->g:I

    .line 19
    .line 20
    sget v0, Ll/hhc0;->w5:I

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lv/VText_Expandable;->i:I

    .line 28
    .line 29
    sget v0, Ll/hhc0;->v5:I

    .line 30
    .line 31
    const/high16 v2, 0x3f800000    # 1.0f

    .line 32
    .line 33
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lv/VText_Expandable;->j:F

    .line 38
    .line 39
    sget v0, Ll/hhc0;->z5:I

    .line 40
    .line 41
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput-boolean v0, p0, Lv/VText_Expandable;->l:Z

    .line 46
    .line 47
    sget v0, Ll/hhc0;->x5:I

    .line 48
    .line 49
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iput-boolean v0, p0, Lv/VText_Expandable;->m:Z

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    sget v0, Lcom/p1/mobile/android/R$string;->c:I

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sput-object p1, Lv/VText_Expandable;->s:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    sget v0, Lcom/p1/mobile/android/R$string;->a:I

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    sput-object p1, Lv/VText_Expandable;->t:Ljava/lang/String;

    .line 89
    .line 90
    const/4 p1, 0x1

    .line 91
    invoke-virtual {p0, p1}, Lv/VText_Expandable;->setOrientation(I)V

    .line 92
    .line 93
    .line 94
    const/16 p1, 0x8

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final synthetic m(Ljava/lang/Float;Landroid/view/animation/Transformation;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    sub-int/2addr p2, p4

    .line 10
    int-to-float p2, p2

    .line 11
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    mul-float/2addr p2, p4

    .line 16
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    int-to-float p3, p3

    .line 21
    add-float/2addr p2, p3

    .line 22
    float-to-int p2, p2

    .line 23
    iget-object p3, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 24
    .line 25
    iget p4, p0, Lv/VText_Expandable;->h:I

    .line 26
    .line 27
    sub-int/2addr p2, p4

    .line 28
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setMaxHeight(I)V

    .line 29
    .line 30
    .line 31
    iget p2, p0, Lv/VText_Expandable;->j:F

    .line 32
    .line 33
    const/high16 p3, 0x3f800000    # 1.0f

    .line 34
    .line 35
    invoke-static {p2, p3}, Ljava/lang/Float;->compare(FF)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_0

    .line 40
    .line 41
    iget-object p2, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 42
    .line 43
    iget p4, p0, Lv/VText_Expandable;->j:F

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iget p0, p0, Lv/VText_Expandable;->j:F

    .line 50
    .line 51
    sub-float/2addr p3, p0

    .line 52
    mul-float/2addr p1, p3

    .line 53
    add-float/2addr p4, p1

    .line 54
    invoke-static {p2, p4}, Lv/VText_Expandable;->h(Landroid/view/View;F)V

    .line 55
    .line 56
    .line 57
    :cond_0
    const/4 p0, 0x0

    .line 58
    return-object p0
.end method

.method public n(Ljava/util/HashMap;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/util/HashMap;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/VText_Expandable;->q:Ljava/util/HashMap;

    .line 2
    .line 3
    iput-object p2, p0, Lv/VText_Expandable;->r:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Boolean;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    :goto_0
    iput-boolean p1, p0, Lv/VText_Expandable;->d:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 25
    .line 26
    iget-boolean p2, p0, Lv/VText_Expandable;->d:Z

    .line 27
    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    sget-object p2, Lv/VText_Expandable;->s:Ljava/lang/String;

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    sget-object p2, Lv/VText_Expandable;->t:Ljava/lang/String;

    .line 34
    .line 35
    :goto_1
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const/4 p2, -0x2

    .line 43
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public o(Ljava/lang/CharSequence;Z)V
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-boolean p2, p0, Lv/VText_Expandable;->o:Z

    .line 2
    .line 3
    iget-object p2, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lv/VText_Expandable;->i()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p2, 0x1

    .line 11
    iput-boolean p2, p0, Lv/VText_Expandable;->c:Z

    .line 12
    .line 13
    iget-object p2, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const/16 p1, 0x8

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 p1, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p1, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-boolean p1, p0, Lv/VText_Expandable;->d:Z

    .line 11
    .line 12
    xor-int/lit8 v0, p1, 0x1

    .line 13
    .line 14
    iput-boolean v0, p0, Lv/VText_Expandable;->d:Z

    .line 15
    .line 16
    iget-object v0, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    sget-object p1, Lv/VText_Expandable;->s:Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget-object p1, Lv/VText_Expandable;->t:Ljava/lang/String;

    .line 24
    .line 25
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lv/VText_Expandable;->q:Ljava/util/HashMap;

    .line 29
    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lv/VText_Expandable;->r:Ljava/lang/String;

    .line 33
    .line 34
    iget-boolean v1, p0, Lv/VText_Expandable;->d:Z

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    :cond_2
    const/4 p1, 0x1

    .line 44
    iput-boolean p1, p0, Lv/VText_Expandable;->n:Z

    .line 45
    .line 46
    new-instance v6, Ll/vzk0;

    .line 47
    .line 48
    invoke-direct {v6, p0}, Ll/vzk0;-><init>(Lv/VText_Expandable;)V

    .line 49
    .line 50
    .line 51
    iget-boolean v0, p0, Lv/VText_Expandable;->d:Z

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget v1, p0, Lv/VText_Expandable;->e:I

    .line 60
    .line 61
    :goto_1
    move v2, v0

    .line 62
    move v3, v1

    .line 63
    goto :goto_2

    .line 64
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iget v2, p0, Lv/VText_Expandable;->f:I

    .line 73
    .line 74
    add-int/2addr v1, v2

    .line 75
    iget-object v2, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 76
    .line 77
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    sub-int/2addr v1, v2

    .line 82
    goto :goto_1

    .line 83
    :goto_2
    new-instance v0, Ll/xrf0;

    .line 84
    .line 85
    const-wide/16 v4, 0x0

    .line 86
    .line 87
    move-object v1, p0

    .line 88
    invoke-direct/range {v0 .. v6}, Ll/xrf0;-><init>(Landroid/view/View;IIJLl/tcj;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, p1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 92
    .line 93
    .line 94
    new-instance p0, Lv/VText_Expandable$a;

    .line 95
    .line 96
    invoke-direct {p0, v1}, Lv/VText_Expandable$a;-><init>(Lv/VText_Expandable;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/VText_Expandable;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lv/VText_Expandable;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lv/VText_Expandable;->n:Z

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lv/VText_Expandable;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_8

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    if-eq v0, v1, :cond_8

    .line 12
    .line 13
    iget-boolean v0, p0, Lv/VText_Expandable;->k:Z

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lv/VText_Expandable;->c:Z

    .line 21
    .line 22
    iget-object v2, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 28
    .line 29
    const v2, 0x7fffffff

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 33
    .line 34
    .line 35
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/widget/TextView;->getLineCount()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iget v3, p0, Lv/VText_Expandable;->g:I

    .line 45
    .line 46
    if-gt v1, v3, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v1, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 50
    .line 51
    invoke-static {v1}, Lv/VText_Expandable;->j(Landroid/widget/TextView;)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iput v1, p0, Lv/VText_Expandable;->f:I

    .line 56
    .line 57
    iget-boolean v1, p0, Lv/VText_Expandable;->d:Z

    .line 58
    .line 59
    if-nez v1, :cond_2

    .line 60
    .line 61
    iget v1, p0, Lv/VText_Expandable;->e:I

    .line 62
    .line 63
    if-nez v1, :cond_3

    .line 64
    .line 65
    :cond_2
    iget-object v1, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 66
    .line 67
    iget v3, p0, Lv/VText_Expandable;->g:I

    .line 68
    .line 69
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 73
    .line 74
    const/4 v3, 0x0

    .line 75
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 76
    .line 77
    .line 78
    :cond_3
    iget-object v1, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 81
    .line 82
    .line 83
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 84
    .line 85
    .line 86
    iget-boolean v1, p0, Lv/VText_Expandable;->d:Z

    .line 87
    .line 88
    if-nez v1, :cond_4

    .line 89
    .line 90
    iget v1, p0, Lv/VText_Expandable;->e:I

    .line 91
    .line 92
    if-nez v1, :cond_5

    .line 93
    .line 94
    :cond_4
    iget-object v1, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 95
    .line 96
    new-instance v3, Lv/VText_Expandable$b;

    .line 97
    .line 98
    invoke-direct {v3, p0}, Lv/VText_Expandable$b;-><init>(Lv/VText_Expandable;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    iput v1, p0, Lv/VText_Expandable;->e:I

    .line 109
    .line 110
    :cond_5
    iget-boolean v1, p0, Lv/VText_Expandable;->o:Z

    .line 111
    .line 112
    if-eqz v1, :cond_6

    .line 113
    .line 114
    iget-object v1, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 115
    .line 116
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 117
    .line 118
    .line 119
    iput-boolean v0, p0, Lv/VText_Expandable;->d:Z

    .line 120
    .line 121
    iget-object v0, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 122
    .line 123
    sget-object v1, Lv/VText_Expandable;->t:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    .line 127
    .line 128
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_6
    iget-boolean v0, p0, Lv/VText_Expandable;->d:Z

    .line 133
    .line 134
    if-nez v0, :cond_7

    .line 135
    .line 136
    iget-object v0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 137
    .line 138
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 139
    .line 140
    .line 141
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 142
    .line 143
    .line 144
    :cond_7
    :goto_0
    return-void

    .line 145
    :cond_8
    :goto_1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public setBtnColor(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lv/VText_Expandable;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setBtnTextSize(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lv/VText_Expandable;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lv/VText_Expandable;->b:Lv/VText;

    .line 9
    .line 10
    int-to-float p1, p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setExpandable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/VText_Expandable;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMaxCollapsedLines(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VText_Expandable;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setMovementMethod(Landroid/text/method/MovementMethod;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnExpandStateChangeListener(Lv/VText_Expandable$c;)V
    .locals 0
    .param p1    # Lv/VText_Expandable$c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lv/VText_Expandable;->p:Lv/VText_Expandable$c;

    .line 2
    .line 3
    return-void
.end method

.method public setOrientation(I)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const-string p0, "VText_Expandable only supports Vertical Orientation."

    .line 8
    .line 9
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lv/VText_Expandable;->o(Ljava/lang/CharSequence;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setTextColor(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lv/VText_Expandable;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setTextSize(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lv/VText_Expandable;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 9
    .line 10
    int-to-float p1, p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lv/VText_Expandable;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
