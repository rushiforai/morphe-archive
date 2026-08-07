.class public Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;
.super Landroid/widget/AutoCompleteTextView;
.source "SourceFile"


# instance fields
.field private A:F

.field private B:F

.field private C:Ljava/lang/String;

.field private D:I

.field private E:Ljava/lang/String;

.field private E0:Z

.field private F:F

.field private F0:Z

.field private G:Z

.field private G0:Landroid/content/res/ColorStateList;

.field private H:F

.field private H0:Landroid/content/res/ColorStateList;

.field private I:Landroid/graphics/Typeface;

.field private I0:Landroid/animation/ArgbEvaluator;

.field private J:Landroid/graphics/Typeface;

.field J0:Landroid/graphics/Paint;

.field private K:Ljava/lang/CharSequence;

.field K0:Landroid/text/TextPaint;

.field private L:Z

.field L0:Landroid/text/StaticLayout;

.field private M:I

.field M0:Landroid/animation/ObjectAnimator;

.field private N:Z

.field N0:Landroid/animation/ObjectAnimator;

.field private O:Z

.field O0:Landroid/animation/ObjectAnimator;

.field private P:Z

.field P0:Landroid/view/View$OnFocusChangeListener;

.field private Q:[Landroid/graphics/Bitmap;

.field Q0:Landroid/view/View$OnFocusChangeListener;

.field private R:[Landroid/graphics/Bitmap;

.field private R0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/yiw;",
            ">;"
        }
    .end annotation
.end field

.field private S:[Landroid/graphics/Bitmap;

.field private T:[Landroid/graphics/Bitmap;

.field private U:Z

.field private V:I

.field private W:I

.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:Z

.field private k:Z

.field private k0:I

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:I

.field private p0:I

.field private q:I

.field private r:I

.field private s:I

.field private t:I

.field private u:Z

.field private v:Z

.field private w:Z

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/AutoCompleteTextView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->D:I

    .line 6
    .line 7
    new-instance v0, Landroid/animation/ArgbEvaluator;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->I0:Landroid/animation/ArgbEvaluator;

    .line 13
    .line 14
    new-instance v0, Landroid/graphics/Paint;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 21
    .line 22
    new-instance v0, Landroid/text/TextPaint;

    .line 23
    .line 24
    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->r(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 34
    invoke-direct {p0, p1, p2}, Landroid/widget/AutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    .line 35
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->D:I

    .line 36
    new-instance v0, Landroid/animation/ArgbEvaluator;

    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->I0:Landroid/animation/ArgbEvaluator;

    .line 37
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 38
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->r(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 40
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/AutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, -0x1

    .line 41
    iput p3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->D:I

    .line 42
    new-instance p3, Landroid/animation/ArgbEvaluator;

    invoke-direct {p3}, Landroid/animation/ArgbEvaluator;-><init>()V

    iput-object p3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->I0:Landroid/animation/ArgbEvaluator;

    .line 43
    new-instance p3, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p3, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 44
    new-instance p3, Landroid/text/TextPaint;

    invoke-direct {p3, v0}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 45
    invoke-direct {p0, p1, p2}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->r(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private A()Z
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x1

    .line 14
    if-ne p0, v0, :cond_0

    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private C()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->H0:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 6
    .line 7
    const v1, 0xffffff

    .line 8
    .line 9
    .line 10
    and-int/2addr v0, v1

    .line 11
    const/high16 v1, 0x44000000    # 512.0f

    .line 12
    .line 13
    or-int/2addr v0, v1

    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private D()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->G0:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    const v1, 0x101009e

    .line 8
    .line 9
    .line 10
    filled-new-array {v1}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget-object v2, Landroid/widget/AutoCompleteTextView;->EMPTY_STATE_SET:[I

    .line 15
    .line 16
    filled-new-array {v1, v2}, [[I

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 21
    .line 22
    const v3, 0xffffff

    .line 23
    .line 24
    .line 25
    and-int v4, v2, v3

    .line 26
    .line 27
    const/high16 v5, -0x21000000

    .line 28
    .line 29
    or-int/2addr v4, v5

    .line 30
    and-int/2addr v2, v3

    .line 31
    const/high16 v3, 0x44000000    # 512.0f

    .line 32
    .line 33
    or-int/2addr v2, v3

    .line 34
    filled-new-array {v4, v2}, [I

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-direct {v0, v1, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->G0:Landroid/content/res/ColorStateList;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private E(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->V:I

    .line 14
    .line 15
    if-ne v2, p0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    if-le v2, p0, :cond_2

    .line 19
    .line 20
    if-le v0, p0, :cond_1

    .line 21
    .line 22
    int-to-float v2, p0

    .line 23
    int-to-float v1, v1

    .line 24
    int-to-float v0, v0

    .line 25
    div-float/2addr v1, v0

    .line 26
    mul-float/2addr v2, v1

    .line 27
    float-to-int v0, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    int-to-float v2, p0

    .line 30
    int-to-float v0, v0

    .line 31
    int-to-float v1, v1

    .line 32
    div-float/2addr v0, v1

    .line 33
    mul-float/2addr v2, v0

    .line 34
    float-to-int v0, v2

    .line 35
    move v3, v0

    .line 36
    move v0, p0

    .line 37
    move p0, v3

    .line 38
    :goto_0
    const/4 v1, 0x0

    .line 39
    invoke-static {p1, p0, v0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_2
    :goto_1
    return-object p1
.end method

.method public static synthetic a(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->N:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->G:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->G:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic f(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getLabelAnimator()Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method private getBottomEllipsisWidth()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->x:I

    .line 6
    .line 7
    mul-int/lit8 v0, v0, 0x5

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p(I)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    add-int/2addr v0, p0

    .line 15
    return v0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private getBottomTextLeftOffset()I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getCharactersCounterWidth()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getBottomEllipsisWidth()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method private getBottomTextRightOffset()I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getBottomEllipsisWidth()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getCharactersCounterWidth()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method private getButtonsCount()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private getCharactersCounterText()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s:I

    .line 2
    .line 3
    const-string v1, " / "

    .line 4
    .line 5
    if-gtz v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t:I

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t:I

    .line 72
    .line 73
    if-gtz v0, :cond_3

    .line 74
    .line 75
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const-string v2, "+"

    .line 80
    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s:I

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s:I

    .line 132
    .line 133
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    return-object p0

    .line 144
    :cond_3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    const-string v2, "-"

    .line 149
    .line 150
    if-eqz v0, :cond_4

    .line 151
    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .line 156
    .line 157
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t:I

    .line 158
    .line 159
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s:I

    .line 166
    .line 167
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    return-object p0

    .line 189
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s:I

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t:I

    .line 217
    .line 218
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    return-object p0
.end method

.method private getCharactersCounterWidth()I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getCharactersCounterText()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    float-to-int p0, p0

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private getLabelAnimator()Landroid/animation/ObjectAnimator;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->M0:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    const-string v1, "floatingLabelFraction"

    .line 12
    .line 13
    invoke-static {p0, v1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->M0:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->M0:Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->P:Z

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    const-wide/16 v1, 0x12c

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const-wide/16 v1, 0x0

    .line 29
    .line 30
    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->M0:Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    return-object p0

    .line 36
    nop

    .line 37
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private getLabelFocusAnimator()Landroid/animation/ObjectAnimator;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->N0:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    const-string v1, "focusFraction"

    .line 12
    .line 13
    invoke-static {p0, v1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->N0:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->N0:Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    return-object p0

    .line 22
    nop

    .line 23
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic h(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getLabelFocusAnimator()Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private i()Z
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 10
    .line 11
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->g:I

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E:Ljava/lang/String;

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->C:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->y:I

    .line 27
    .line 28
    goto :goto_6

    .line 29
    :cond_2
    :goto_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getGravity()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v1, 0x5

    .line 34
    and-int/2addr v0, v1

    .line 35
    if-eq v0, v1, :cond_5

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_3
    invoke-virtual {p0}, Landroid/widget/TextView;->getGravity()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const/4 v1, 0x3

    .line 49
    and-int/2addr v0, v1

    .line 50
    if-ne v0, v1, :cond_4

    .line 51
    .line 52
    sget-object v0, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 53
    .line 54
    :goto_1
    move-object v5, v0

    .line 55
    goto :goto_3

    .line 56
    :cond_4
    sget-object v0, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_5
    :goto_2
    sget-object v0, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :goto_3
    new-instance v1, Landroid/text/StaticLayout;

    .line 63
    .line 64
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v0, :cond_6

    .line 67
    .line 68
    :goto_4
    move-object v2, v0

    .line 69
    goto :goto_5

    .line 70
    :cond_6
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->C:Ljava/lang/String;

    .line 71
    .line 72
    goto :goto_4

    .line 73
    :goto_5
    iget-object v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getBottomTextLeftOffset()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    sub-int/2addr v0, v4

    .line 84
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getBottomTextRightOffset()I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    sub-int/2addr v0, v4

    .line 89
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    sub-int/2addr v0, v4

    .line 94
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    sub-int v4, v0, v4

    .line 99
    .line 100
    const/4 v7, 0x0

    .line 101
    const/4 v8, 0x1

    .line 102
    const/high16 v6, 0x3f800000    # 1.0f

    .line 103
    .line 104
    invoke-direct/range {v1 .. v8}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 105
    .line 106
    .line 107
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->L0:Landroid/text/StaticLayout;

    .line 108
    .line 109
    invoke-virtual {v1}, Landroid/text/StaticLayout;->getLineCount()I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->z:I

    .line 114
    .line 115
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    :goto_6
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->B:F

    .line 120
    .line 121
    int-to-float v0, v0

    .line 122
    cmpl-float v1, v1, v0

    .line 123
    .line 124
    if-eqz v1, :cond_7

    .line 125
    .line 126
    invoke-direct {p0, v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->n(F)Landroid/animation/ObjectAnimator;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    .line 131
    .line 132
    .line 133
    :cond_7
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->B:F

    .line 134
    .line 135
    const/4 p0, 0x1

    .line 136
    return p0
.end method

.method private j()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->O:Z

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v2, 0x0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    move v0, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    :goto_0
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s:I

    .line 25
    .line 26
    if-lt v0, v3, :cond_2

    .line 27
    .line 28
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t:I

    .line 29
    .line 30
    if-lez v3, :cond_3

    .line 31
    .line 32
    if-gt v0, v3, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    move v1, v2

    .line 36
    :cond_3
    :goto_1
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->O:Z

    .line 37
    .line 38
    return-void
.end method

.method private k()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getButtonsCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    mul-int/2addr v0, v1

    .line 8
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v5, v2

    .line 17
    move v2, v0

    .line 18
    move v0, v5

    .line 19
    :goto_0
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->o:I

    .line 20
    .line 21
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->c:I

    .line 22
    .line 23
    add-int/2addr v1, v3

    .line 24
    add-int/2addr v1, v0

    .line 25
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->m:I

    .line 26
    .line 27
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->a:I

    .line 28
    .line 29
    add-int/2addr v0, v3

    .line 30
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p:I

    .line 31
    .line 32
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->d:I

    .line 33
    .line 34
    add-int/2addr v3, v4

    .line 35
    add-int/2addr v3, v2

    .line 36
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->n:I

    .line 37
    .line 38
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->b:I

    .line 39
    .line 40
    add-int/2addr v2, v4

    .line 41
    invoke-super {p0, v1, v0, v3, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private l(I)[Landroid/graphics/Bitmap;
    .locals 4
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

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
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {v2, p1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 22
    .line 23
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 24
    .line 25
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->V:I

    .line 30
    .line 31
    if-le v2, v3, :cond_1

    .line 32
    .line 33
    div-int v1, v2, v3

    .line 34
    .line 35
    :cond_1
    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1, p1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->m(Landroid/graphics/Bitmap;)[Landroid/graphics/Bitmap;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method private m(Landroid/graphics/Bitmap;)[Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    const/4 v0, 0x4

    .line 6
    new-array v0, v0, [Landroid/graphics/Bitmap;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const/4 v4, 0x0

    .line 20
    aput-object v3, v0, v4

    .line 21
    .line 22
    new-instance v3, Landroid/graphics/Canvas;

    .line 23
    .line 24
    aget-object v4, v0, v4

    .line 25
    .line 26
    invoke-direct {v3, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 27
    .line 28
    .line 29
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 30
    .line 31
    const v5, 0xffffff

    .line 32
    .line 33
    .line 34
    and-int v6, v4, v5

    .line 35
    .line 36
    invoke-static {v4}, Ll/if5;->a(I)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    const/high16 v4, -0x1000000

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/high16 v4, -0x76000000

    .line 46
    .line 47
    :goto_0
    or-int/2addr v4, v6

    .line 48
    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 49
    .line 50
    invoke-virtual {v3, v4, v6}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    aput-object v3, v0, v2

    .line 58
    .line 59
    new-instance v3, Landroid/graphics/Canvas;

    .line 60
    .line 61
    aget-object v4, v0, v2

    .line 62
    .line 63
    invoke-direct {v3, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 64
    .line 65
    .line 66
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->q:I

    .line 67
    .line 68
    invoke-virtual {v3, v4, v6}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    const/4 v4, 0x2

    .line 76
    aput-object v3, v0, v4

    .line 77
    .line 78
    new-instance v3, Landroid/graphics/Canvas;

    .line 79
    .line 80
    aget-object v4, v0, v4

    .line 81
    .line 82
    invoke-direct {v3, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 83
    .line 84
    .line 85
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 86
    .line 87
    and-int/2addr v5, v4

    .line 88
    invoke-static {v4}, Ll/if5;->a(I)Z

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-eqz v4, :cond_2

    .line 93
    .line 94
    const/high16 v4, 0x4c000000    # 3.3554432E7f

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_2
    const/high16 v4, 0x42000000    # 32.0f

    .line 98
    .line 99
    :goto_1
    or-int/2addr v4, v5

    .line 100
    invoke-virtual {v3, v4, v6}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    const/4 v1, 0x3

    .line 108
    aput-object p1, v0, v1

    .line 109
    .line 110
    new-instance p1, Landroid/graphics/Canvas;

    .line 111
    .line 112
    aget-object v1, v0, v1

    .line 113
    .line 114
    invoke-direct {p1, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 115
    .line 116
    .line 117
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->r:I

    .line 118
    .line 119
    invoke-virtual {p1, p0, v6}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 120
    .line 121
    .line 122
    return-object v0
.end method

.method private n(F)Landroid/animation/ObjectAnimator;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->O0:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-array v0, v2, [F

    .line 8
    .line 9
    aput p1, v0, v1

    .line 10
    .line 11
    const-string p1, "currentBottomLines"

    .line 12
    .line 13
    invoke-static {p0, p1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->O0:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->O0:Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    new-array v2, v2, [F

    .line 26
    .line 27
    aput p1, v2, v1

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->O0:Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    return-object p0
.end method

.method private o(Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method private p(I)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    int-to-float p1, p1

    .line 6
    invoke-static {p0, p1}, Ll/jvd;->a(Landroid/content/Context;F)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private q()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s:I

    .line 2
    .line 3
    if-gtz v0, :cond_1

    .line 4
    .line 5
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t:I

    .line 6
    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method private r(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->V:I

    .line 8
    .line 9
    const/16 v1, 0x30

    .line 10
    .line 11
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->k0:I

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget v1, Ll/jac0;->d:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i:I

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget v1, Ll/jac0;->a:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->x:I

    .line 46
    .line 47
    sget-object v0, Ll/whc0;->a:[I

    .line 48
    .line 49
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sget v1, Ll/whc0;->E:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->G0:Landroid/content/res/ColorStateList;

    .line 60
    .line 61
    sget v1, Ll/whc0;->F:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->H0:Landroid/content/res/ColorStateList;

    .line 68
    .line 69
    sget v1, Ll/whc0;->d:I

    .line 70
    .line 71
    const/high16 v2, -0x1000000

    .line 72
    .line 73
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 78
    .line 79
    new-instance v1, Landroid/util/TypedValue;

    .line 80
    .line 81
    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 82
    .line 83
    .line 84
    const/4 v2, 0x1

    .line 85
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    const v4, 0x1010433

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3, v4, v1, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 93
    .line 94
    .line 95
    iget v1, v1, Landroid/util/TypedValue;->data:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :catch_0
    :try_start_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    const-string v4, "colorPrimary"

    .line 103
    .line 104
    const-string v5, "attr"

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    if-eqz v3, :cond_0

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-virtual {v4, v3, v1, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 125
    .line 126
    .line 127
    iget v1, v1, Landroid/util/TypedValue;->data:I

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    .line 131
    .line 132
    const-string v3, "colorPrimary not found"

    .line 133
    .line 134
    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    throw v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 138
    :catch_1
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 139
    .line 140
    :goto_0
    sget v3, Ll/whc0;->C:I

    .line 141
    .line 142
    invoke-virtual {v0, v3, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->q:I

    .line 147
    .line 148
    sget v1, Ll/whc0;->j:I

    .line 149
    .line 150
    const/4 v3, 0x0

    .line 151
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->setFloatingLabelInternal(I)V

    .line 156
    .line 157
    .line 158
    sget v1, Ll/whc0;->i:I

    .line 159
    .line 160
    const-string v4, "#e7492E"

    .line 161
    .line 162
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->r:I

    .line 171
    .line 172
    sget v1, Ll/whc0;->B:I

    .line 173
    .line 174
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s:I

    .line 179
    .line 180
    sget v1, Ll/whc0;->z:I

    .line 181
    .line 182
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t:I

    .line 187
    .line 188
    sget v1, Ll/whc0;->D:I

    .line 189
    .line 190
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u:Z

    .line 195
    .line 196
    sget v1, Ll/whc0;->q:I

    .line 197
    .line 198
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->C:Ljava/lang/String;

    .line 203
    .line 204
    sget v1, Ll/whc0;->s:I

    .line 205
    .line 206
    const/4 v4, -0x1

    .line 207
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->D:I

    .line 212
    .line 213
    sget v1, Ll/whc0;->A:I

    .line 214
    .line 215
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->z:I

    .line 220
    .line 221
    sget v1, Ll/whc0;->b:I

    .line 222
    .line 223
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    if-eqz v1, :cond_1

    .line 228
    .line 229
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 230
    .line 231
    .line 232
    move-result v5

    .line 233
    if-nez v5, :cond_1

    .line 234
    .line 235
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->o(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->I:Landroid/graphics/Typeface;

    .line 240
    .line 241
    iget-object v5, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 242
    .line 243
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 244
    .line 245
    .line 246
    :cond_1
    sget v1, Ll/whc0;->G:I

    .line 247
    .line 248
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    if-eqz v1, :cond_2

    .line 253
    .line 254
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 255
    .line 256
    .line 257
    move-result v5

    .line 258
    if-nez v5, :cond_2

    .line 259
    .line 260
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->o(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J:Landroid/graphics/Typeface;

    .line 265
    .line 266
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 267
    .line 268
    .line 269
    :cond_2
    sget v1, Ll/whc0;->n:I

    .line 270
    .line 271
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K:Ljava/lang/CharSequence;

    .line 276
    .line 277
    if-nez v1, :cond_3

    .line 278
    .line 279
    invoke-virtual {p0}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K:Ljava/lang/CharSequence;

    .line 284
    .line 285
    :cond_3
    sget v1, Ll/whc0;->m:I

    .line 286
    .line 287
    iget v5, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i:I

    .line 288
    .line 289
    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->h:I

    .line 294
    .line 295
    sget v1, Ll/whc0;->p:I

    .line 296
    .line 297
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 298
    .line 299
    .line 300
    move-result-object v5

    .line 301
    sget v6, Ll/jac0;->c:I

    .line 302
    .line 303
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 304
    .line 305
    .line 306
    move-result v5

    .line 307
    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->e:I

    .line 312
    .line 313
    sget v1, Ll/whc0;->o:I

    .line 314
    .line 315
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->f:I

    .line 320
    .line 321
    sget v1, Ll/whc0;->l:I

    .line 322
    .line 323
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->P:Z

    .line 328
    .line 329
    sget v1, Ll/whc0;->f:I

    .line 330
    .line 331
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 332
    .line 333
    .line 334
    move-result-object v5

    .line 335
    sget v6, Ll/jac0;->b:I

    .line 336
    .line 337
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 338
    .line 339
    .line 340
    move-result v5

    .line 341
    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->g:I

    .line 346
    .line 347
    sget v1, Ll/whc0;->t:I

    .line 348
    .line 349
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 350
    .line 351
    .line 352
    move-result v1

    .line 353
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->L:Z

    .line 354
    .line 355
    sget v1, Ll/whc0;->H:I

    .line 356
    .line 357
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 358
    .line 359
    .line 360
    move-result v1

    .line 361
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->M:I

    .line 362
    .line 363
    sget v1, Ll/whc0;->c:I

    .line 364
    .line 365
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 366
    .line 367
    .line 368
    move-result v1

    .line 369
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->N:Z

    .line 370
    .line 371
    sget v1, Ll/whc0;->v:I

    .line 372
    .line 373
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 374
    .line 375
    .line 376
    move-result v1

    .line 377
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l(I)[Landroid/graphics/Bitmap;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->Q:[Landroid/graphics/Bitmap;

    .line 382
    .line 383
    sget v1, Ll/whc0;->x:I

    .line 384
    .line 385
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l(I)[Landroid/graphics/Bitmap;

    .line 390
    .line 391
    .line 392
    move-result-object v1

    .line 393
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->R:[Landroid/graphics/Bitmap;

    .line 394
    .line 395
    sget v1, Ll/whc0;->g:I

    .line 396
    .line 397
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 398
    .line 399
    .line 400
    move-result v1

    .line 401
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->U:Z

    .line 402
    .line 403
    sget v1, Ll/qbc0;->a:I

    .line 404
    .line 405
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l(I)[Landroid/graphics/Bitmap;

    .line 406
    .line 407
    .line 408
    move-result-object v1

    .line 409
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->S:[Landroid/graphics/Bitmap;

    .line 410
    .line 411
    sget v1, Ll/qbc0;->b:I

    .line 412
    .line 413
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l(I)[Landroid/graphics/Bitmap;

    .line 414
    .line 415
    .line 416
    move-result-object v1

    .line 417
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->T:[Landroid/graphics/Bitmap;

    .line 418
    .line 419
    sget v1, Ll/whc0;->w:I

    .line 420
    .line 421
    const/16 v4, 0x10

    .line 422
    .line 423
    invoke-direct {p0, v4}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p(I)I

    .line 424
    .line 425
    .line 426
    move-result v4

    .line 427
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 428
    .line 429
    .line 430
    move-result v1

    .line 431
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p0:I

    .line 432
    .line 433
    sget v1, Ll/whc0;->k:I

    .line 434
    .line 435
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 436
    .line 437
    .line 438
    move-result v1

    .line 439
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->v:Z

    .line 440
    .line 441
    sget v1, Ll/whc0;->r:I

    .line 442
    .line 443
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 444
    .line 445
    .line 446
    move-result v1

    .line 447
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->w:Z

    .line 448
    .line 449
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 450
    .line 451
    .line 452
    const v0, 0x10100d8

    .line 453
    .line 454
    .line 455
    const v1, 0x10100d9

    .line 456
    .line 457
    .line 458
    const v4, 0x10100d5

    .line 459
    .line 460
    .line 461
    const v5, 0x10100d6

    .line 462
    .line 463
    .line 464
    const v6, 0x10100d7

    .line 465
    .line 466
    .line 467
    filled-new-array {v4, v5, v6, v0, v1}, [I

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 472
    .line 473
    .line 474
    move-result-object p1

    .line 475
    invoke-virtual {p1, v3, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 476
    .line 477
    .line 478
    move-result p2

    .line 479
    invoke-virtual {p1, v2, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 480
    .line 481
    .line 482
    move-result v0

    .line 483
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->o:I

    .line 484
    .line 485
    const/4 v0, 0x2

    .line 486
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 487
    .line 488
    .line 489
    move-result v0

    .line 490
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->m:I

    .line 491
    .line 492
    const/4 v0, 0x3

    .line 493
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 494
    .line 495
    .line 496
    move-result v0

    .line 497
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p:I

    .line 498
    .line 499
    const/4 v0, 0x4

    .line 500
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 501
    .line 502
    .line 503
    move-result p2

    .line 504
    iput p2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->n:I

    .line 505
    .line 506
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 507
    .line 508
    .line 509
    const/4 p1, 0x0

    .line 510
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 511
    .line 512
    .line 513
    iget-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u:Z

    .line 514
    .line 515
    if-eqz p1, :cond_4

    .line 516
    .line 517
    invoke-virtual {p0}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    .line 518
    .line 519
    .line 520
    move-result-object p1

    .line 521
    invoke-virtual {p0}, Landroid/widget/TextView;->setSingleLine()V

    .line 522
    .line 523
    .line 524
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 525
    .line 526
    .line 527
    :cond_4
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t()V

    .line 528
    .line 529
    .line 530
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 531
    .line 532
    .line 533
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->v()V

    .line 534
    .line 535
    .line 536
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s()V

    .line 537
    .line 538
    .line 539
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->w()V

    .line 540
    .line 541
    .line 542
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->j()V

    .line 543
    .line 544
    .line 545
    return-void
.end method

.method private s()V
    .locals 1

    .line 1
    new-instance v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$b;-><init>(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$c;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$c;-><init>(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->P0:Landroid/view/View$OnFocusChangeListener;

    .line 15
    .line 16
    invoke-super {p0, v0}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private setFloatingLabelInternal(I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p1, v1, :cond_1

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eq p1, v2, :cond_0

    .line 7
    .line 8
    iput-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->j:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->k:Z

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->j:Z

    .line 14
    .line 15
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->k:Z

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->j:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->k:Z

    .line 21
    .line 22
    return-void
.end method

.method private t()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-gtz v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t:I

    .line 8
    .line 9
    if-gtz v0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u:Z

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->C:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v0, v2

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    :goto_0
    move v0, v1

    .line 27
    :goto_1
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->z:I

    .line 28
    .line 29
    if-lez v3, :cond_2

    .line 30
    .line 31
    move v1, v3

    .line 32
    goto :goto_2

    .line 33
    :cond_2
    if-eqz v0, :cond_3

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_3
    move v1, v2

    .line 37
    :goto_2
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->y:I

    .line 38
    .line 39
    int-to-float v0, v1

    .line 40
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A:F

    .line 41
    .line 42
    return-void
.end method

.method private u()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->e:I

    .line 6
    .line 7
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->h:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->h:I

    .line 12
    .line 13
    :goto_0
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->a:I

    .line 14
    .line 15
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 16
    .line 17
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->g:I

    .line 18
    .line 19
    int-to-float v1, v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 30
    .line 31
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 32
    .line 33
    sub-float/2addr v1, v0

    .line 34
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A:F

    .line 35
    .line 36
    mul-float/2addr v1, v0

    .line 37
    float-to-int v0, v1

    .line 38
    iget-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->L:Z

    .line 39
    .line 40
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i:I

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    mul-int/lit8 v2, v2, 0x2

    .line 46
    .line 47
    :goto_1
    add-int/2addr v0, v2

    .line 48
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->b:I

    .line 49
    .line 50
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->Q:[Landroid/graphics/Bitmap;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    move v0, v1

    .line 56
    goto :goto_2

    .line 57
    :cond_2
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 58
    .line 59
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p0:I

    .line 60
    .line 61
    add-int/2addr v0, v2

    .line 62
    :goto_2
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->c:I

    .line 63
    .line 64
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->R:[Landroid/graphics/Bitmap;

    .line 65
    .line 66
    if-nez v0, :cond_3

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_3
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 70
    .line 71
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p0:I

    .line 72
    .line 73
    add-int/2addr v1, v0

    .line 74
    :goto_3
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->d:I

    .line 75
    .line 76
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->k()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private v()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->C()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 30
    .line 31
    .line 32
    const/high16 v0, 0x3f800000    # 1.0f

    .line 33
    .line 34
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F:F

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->G:Z

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->C()V

    .line 41
    .line 42
    .line 43
    :goto_0
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->D()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private w()V
    .locals 1

    .line 1
    new-instance v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$a;-><init>(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private x(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->Q:[Landroid/graphics/Bitmap;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    move v2, v3

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 21
    .line 22
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p0:I

    .line 23
    .line 24
    add-int/2addr v2, v4

    .line 25
    :goto_0
    add-int/2addr v1, v2

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    iget-object v4, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->R:[Landroid/graphics/Bitmap;

    .line 31
    .line 32
    if-nez v4, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    iget v5, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 44
    .line 45
    sub-int/2addr v4, v5

    .line 46
    iget v5, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p0:I

    .line 47
    .line 48
    sub-int/2addr v4, v5

    .line 49
    :goto_1
    add-int/2addr v2, v4

    .line 50
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_2

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_2
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 58
    .line 59
    sub-int v1, v2, v1

    .line 60
    .line 61
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    add-int/2addr v2, v4

    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    sub-int/2addr v2, v4

    .line 75
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i:I

    .line 76
    .line 77
    add-int/2addr v2, v4

    .line 78
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->k0:I

    .line 79
    .line 80
    sub-int/2addr v2, v4

    .line 81
    int-to-float v5, v1

    .line 82
    cmpl-float v5, v0, v5

    .line 83
    .line 84
    if-ltz v5, :cond_3

    .line 85
    .line 86
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 87
    .line 88
    add-int/2addr v1, p0

    .line 89
    int-to-float p0, v1

    .line 90
    cmpg-float p0, v0, p0

    .line 91
    .line 92
    if-gez p0, :cond_3

    .line 93
    .line 94
    int-to-float p0, v2

    .line 95
    cmpl-float p0, p1, p0

    .line 96
    .line 97
    if-ltz p0, :cond_3

    .line 98
    .line 99
    add-int/2addr v2, v4

    .line 100
    int-to-float p0, v2

    .line 101
    cmpg-float p0, p1, p0

    .line 102
    .line 103
    if-gez p0, :cond_3

    .line 104
    .line 105
    const/4 p0, 0x1

    .line 106
    return p0

    .line 107
    :cond_3
    return v3
.end method

.method private z()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->y()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

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


# virtual methods
.method public B()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->U:Z

    .line 2
    .line 3
    return p0
.end method

.method public F()Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->R0:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_6

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x0

    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    move v2, v1

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v2, v3

    .line 27
    :goto_0
    iget-object v4, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->R0:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    move v5, v1

    .line 34
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    if-eqz v6, :cond_4

    .line 39
    .line 40
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    check-cast v6, Ll/yiw;

    .line 45
    .line 46
    if-eqz v5, :cond_3

    .line 47
    .line 48
    invoke-virtual {v6, v0, v2}, Ll/yiw;->b(Ljava/lang/CharSequence;Z)Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    if-eqz v5, :cond_3

    .line 53
    .line 54
    move v5, v1

    .line 55
    goto :goto_1

    .line 56
    :cond_3
    move v5, v3

    .line 57
    :goto_1
    if-nez v5, :cond_2

    .line 58
    .line 59
    invoke-virtual {v6}, Ll/yiw;->a()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->setError(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    :cond_4
    if-eqz v5, :cond_5

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-virtual {p0, v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->setError(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 73
    .line 74
    .line 75
    return v5

    .line 76
    :cond_6
    :goto_2
    return v1
.end method

.method public getAccentTypeface()Landroid/graphics/Typeface;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->I:Landroid/graphics/Typeface;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBottomTextSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public getCurrentBottomLines()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A:F

    .line 2
    .line 3
    return p0
.end method

.method public getError()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getErrorColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public getFloatingLabelFraction()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F:F

    .line 2
    .line 3
    return p0
.end method

.method public getFloatingLabelPadding()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public getFloatingLabelText()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFloatingLabelTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public getFloatingLabelTextSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public getFocusFraction()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->H:F

    .line 2
    .line 3
    return p0
.end method

.method public getHelperText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->C:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHelperTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->D:I

    .line 2
    .line 3
    return p0
.end method

.method public getInnerPaddingBottom()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getInnerPaddingLeft()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public getInnerPaddingRight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public getInnerPaddingTop()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxCharacters()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinBottomTextLines()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinCharacters()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public getUnderlineColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->M:I

    .line 2
    .line 3
    return p0
.end method

.method public getValidators()Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/yiw;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->R0:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 18
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->Q:[Landroid/graphics/Bitmap;

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    move v3, v4

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 17
    .line 18
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p0:I

    .line 19
    .line 20
    add-int/2addr v3, v5

    .line 21
    :goto_0
    add-int v7, v2, v3

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->R:[Landroid/graphics/Bitmap;

    .line 28
    .line 29
    if-nez v3, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 41
    .line 42
    sub-int/2addr v3, v5

    .line 43
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p0:I

    .line 44
    .line 45
    sub-int/2addr v3, v5

    .line 46
    :goto_1
    add-int v8, v2, v3

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    add-int/2addr v2, v3

    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    sub-int/2addr v2, v3

    .line 62
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 63
    .line 64
    const/16 v5, 0xff

    .line 65
    .line 66
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 67
    .line 68
    .line 69
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->Q:[Landroid/graphics/Bitmap;

    .line 70
    .line 71
    const/4 v9, 0x3

    .line 72
    const/4 v10, 0x1

    .line 73
    const/4 v11, 0x2

    .line 74
    if-eqz v3, :cond_5

    .line 75
    .line 76
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->z()Z

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    if-nez v6, :cond_2

    .line 81
    .line 82
    move v6, v9

    .line 83
    goto :goto_2

    .line 84
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    if-nez v6, :cond_3

    .line 89
    .line 90
    move v6, v11

    .line 91
    goto :goto_2

    .line 92
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    if-eqz v6, :cond_4

    .line 97
    .line 98
    move v6, v10

    .line 99
    goto :goto_2

    .line 100
    :cond_4
    move v6, v4

    .line 101
    :goto_2
    aget-object v3, v3, v6

    .line 102
    .line 103
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p0:I

    .line 104
    .line 105
    sub-int v6, v7, v6

    .line 106
    .line 107
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 108
    .line 109
    sub-int/2addr v6, v12

    .line 110
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 111
    .line 112
    .line 113
    move-result v13

    .line 114
    sub-int/2addr v12, v13

    .line 115
    div-int/2addr v12, v11

    .line 116
    add-int/2addr v6, v12

    .line 117
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i:I

    .line 118
    .line 119
    add-int/2addr v12, v2

    .line 120
    iget v13, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->k0:I

    .line 121
    .line 122
    sub-int/2addr v12, v13

    .line 123
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 124
    .line 125
    .line 126
    move-result v14

    .line 127
    sub-int/2addr v13, v14

    .line 128
    div-int/2addr v13, v11

    .line 129
    add-int/2addr v12, v13

    .line 130
    int-to-float v6, v6

    .line 131
    int-to-float v12, v12

    .line 132
    iget-object v13, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 133
    .line 134
    invoke-virtual {v1, v3, v6, v12, v13}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 135
    .line 136
    .line 137
    :cond_5
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->R:[Landroid/graphics/Bitmap;

    .line 138
    .line 139
    if-eqz v3, :cond_9

    .line 140
    .line 141
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->z()Z

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    if-nez v6, :cond_6

    .line 146
    .line 147
    move v6, v9

    .line 148
    goto :goto_3

    .line 149
    :cond_6
    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    if-nez v6, :cond_7

    .line 154
    .line 155
    move v6, v11

    .line 156
    goto :goto_3

    .line 157
    :cond_7
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 158
    .line 159
    .line 160
    move-result v6

    .line 161
    if-eqz v6, :cond_8

    .line 162
    .line 163
    move v6, v10

    .line 164
    goto :goto_3

    .line 165
    :cond_8
    move v6, v4

    .line 166
    :goto_3
    aget-object v3, v3, v6

    .line 167
    .line 168
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p0:I

    .line 169
    .line 170
    add-int/2addr v6, v8

    .line 171
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 172
    .line 173
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 174
    .line 175
    .line 176
    move-result v13

    .line 177
    sub-int/2addr v12, v13

    .line 178
    div-int/2addr v12, v11

    .line 179
    add-int/2addr v6, v12

    .line 180
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i:I

    .line 181
    .line 182
    add-int/2addr v12, v2

    .line 183
    iget v13, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->k0:I

    .line 184
    .line 185
    sub-int/2addr v12, v13

    .line 186
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 187
    .line 188
    .line 189
    move-result v14

    .line 190
    sub-int/2addr v13, v14

    .line 191
    div-int/2addr v13, v11

    .line 192
    add-int/2addr v12, v13

    .line 193
    int-to-float v6, v6

    .line 194
    int-to-float v12, v12

    .line 195
    iget-object v13, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 196
    .line 197
    invoke-virtual {v1, v3, v6, v12, v13}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 198
    .line 199
    .line 200
    :cond_9
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    if-eqz v3, :cond_c

    .line 205
    .line 206
    iget-boolean v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->U:Z

    .line 207
    .line 208
    if-eqz v3, :cond_c

    .line 209
    .line 210
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 211
    .line 212
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 213
    .line 214
    .line 215
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    if-eqz v3, :cond_a

    .line 220
    .line 221
    move v3, v7

    .line 222
    goto :goto_4

    .line 223
    :cond_a
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 224
    .line 225
    sub-int v3, v8, v3

    .line 226
    .line 227
    :goto_4
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 232
    .line 233
    .line 234
    move-result v5

    .line 235
    if-eqz v5, :cond_b

    .line 236
    .line 237
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->T:[Landroid/graphics/Bitmap;

    .line 238
    .line 239
    aget-object v4, v5, v4

    .line 240
    .line 241
    goto :goto_5

    .line 242
    :cond_b
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->S:[Landroid/graphics/Bitmap;

    .line 243
    .line 244
    aget-object v4, v5, v4

    .line 245
    .line 246
    :goto_5
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->W:I

    .line 247
    .line 248
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    .line 249
    .line 250
    .line 251
    move-result v6

    .line 252
    sub-int/2addr v5, v6

    .line 253
    div-int/2addr v5, v11

    .line 254
    add-int/2addr v3, v5

    .line 255
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i:I

    .line 256
    .line 257
    add-int/2addr v5, v2

    .line 258
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->k0:I

    .line 259
    .line 260
    sub-int/2addr v5, v6

    .line 261
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 262
    .line 263
    .line 264
    move-result v12

    .line 265
    sub-int/2addr v6, v12

    .line 266
    div-int/2addr v6, v11

    .line 267
    add-int/2addr v5, v6

    .line 268
    int-to-float v3, v3

    .line 269
    int-to-float v5, v5

    .line 270
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 271
    .line 272
    invoke-virtual {v1, v4, v3, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 273
    .line 274
    .line 275
    :cond_c
    iget-boolean v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->L:Z

    .line 276
    .line 277
    const/high16 v12, 0x44000000    # 512.0f

    .line 278
    .line 279
    const v13, 0xffffff

    .line 280
    .line 281
    .line 282
    const/4 v14, -0x1

    .line 283
    if-nez v3, :cond_13

    .line 284
    .line 285
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i:I

    .line 286
    .line 287
    add-int v15, v2, v3

    .line 288
    .line 289
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->z()Z

    .line 290
    .line 291
    .line 292
    move-result v2

    .line 293
    if-nez v2, :cond_e

    .line 294
    .line 295
    iget-object v2, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 296
    .line 297
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->r:I

    .line 298
    .line 299
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 300
    .line 301
    .line 302
    int-to-float v2, v7

    .line 303
    int-to-float v3, v15

    .line 304
    int-to-float v4, v8

    .line 305
    invoke-direct {v0, v11}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p(I)I

    .line 306
    .line 307
    .line 308
    move-result v5

    .line 309
    add-int/2addr v5, v15

    .line 310
    int-to-float v5, v5

    .line 311
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 312
    .line 313
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 314
    .line 315
    .line 316
    :cond_d
    move-object/from16 v1, p1

    .line 317
    .line 318
    goto/16 :goto_9

    .line 319
    .line 320
    :cond_e
    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    .line 321
    .line 322
    .line 323
    move-result v1

    .line 324
    if-nez v1, :cond_10

    .line 325
    .line 326
    iget-object v1, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 327
    .line 328
    iget v2, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->M:I

    .line 329
    .line 330
    if-eq v2, v14, :cond_f

    .line 331
    .line 332
    goto :goto_6

    .line 333
    :cond_f
    iget v2, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 334
    .line 335
    and-int/2addr v2, v13

    .line 336
    or-int/2addr v2, v12

    .line 337
    :goto_6
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 338
    .line 339
    .line 340
    invoke-direct {v0, v10}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p(I)I

    .line 341
    .line 342
    .line 343
    move-result v1

    .line 344
    int-to-float v1, v1

    .line 345
    const/4 v2, 0x0

    .line 346
    move/from16 v16, v2

    .line 347
    .line 348
    :goto_7
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 349
    .line 350
    .line 351
    move-result v2

    .line 352
    int-to-float v2, v2

    .line 353
    cmpg-float v2, v16, v2

    .line 354
    .line 355
    if-gez v2, :cond_d

    .line 356
    .line 357
    int-to-float v2, v7

    .line 358
    add-float v2, v2, v16

    .line 359
    .line 360
    int-to-float v3, v15

    .line 361
    add-float v4, v2, v1

    .line 362
    .line 363
    invoke-direct {v0, v10}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p(I)I

    .line 364
    .line 365
    .line 366
    move-result v5

    .line 367
    add-int/2addr v5, v15

    .line 368
    int-to-float v5, v5

    .line 369
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 370
    .line 371
    move/from16 v17, v1

    .line 372
    .line 373
    move-object/from16 v1, p1

    .line 374
    .line 375
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 376
    .line 377
    .line 378
    const/high16 v1, 0x40400000    # 3.0f

    .line 379
    .line 380
    mul-float v1, v1, v17

    .line 381
    .line 382
    add-float v16, v16, v1

    .line 383
    .line 384
    move/from16 v1, v17

    .line 385
    .line 386
    goto :goto_7

    .line 387
    :cond_10
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 388
    .line 389
    .line 390
    move-result v1

    .line 391
    iget-object v2, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 392
    .line 393
    if-eqz v1, :cond_11

    .line 394
    .line 395
    iget v1, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->q:I

    .line 396
    .line 397
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 398
    .line 399
    .line 400
    int-to-float v2, v7

    .line 401
    int-to-float v3, v15

    .line 402
    int-to-float v4, v8

    .line 403
    invoke-direct {v0, v11}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p(I)I

    .line 404
    .line 405
    .line 406
    move-result v1

    .line 407
    add-int/2addr v1, v15

    .line 408
    int-to-float v5, v1

    .line 409
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 410
    .line 411
    move-object/from16 v1, p1

    .line 412
    .line 413
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 414
    .line 415
    .line 416
    goto :goto_9

    .line 417
    :cond_11
    iget v1, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->M:I

    .line 418
    .line 419
    if-eq v1, v14, :cond_12

    .line 420
    .line 421
    goto :goto_8

    .line 422
    :cond_12
    iget v1, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 423
    .line 424
    and-int/2addr v1, v13

    .line 425
    const/high16 v3, 0x1e000000

    .line 426
    .line 427
    or-int/2addr v1, v3

    .line 428
    :goto_8
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 429
    .line 430
    .line 431
    int-to-float v2, v7

    .line 432
    int-to-float v3, v15

    .line 433
    int-to-float v4, v8

    .line 434
    invoke-direct {v0, v10}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p(I)I

    .line 435
    .line 436
    .line 437
    move-result v1

    .line 438
    add-int/2addr v1, v15

    .line 439
    int-to-float v5, v1

    .line 440
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 441
    .line 442
    move-object/from16 v1, p1

    .line 443
    .line 444
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 445
    .line 446
    .line 447
    :goto_9
    move v2, v15

    .line 448
    :cond_13
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 449
    .line 450
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->g:I

    .line 451
    .line 452
    int-to-float v4, v4

    .line 453
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 454
    .line 455
    .line 456
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 457
    .line 458
    invoke-virtual {v3}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 459
    .line 460
    .line 461
    move-result-object v3

    .line 462
    iget v4, v3, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 463
    .line 464
    neg-float v5, v4

    .line 465
    iget v3, v3, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 466
    .line 467
    sub-float/2addr v5, v3

    .line 468
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->g:I

    .line 469
    .line 470
    int-to-float v6, v6

    .line 471
    add-float/2addr v6, v4

    .line 472
    add-float/2addr v6, v3

    .line 473
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 474
    .line 475
    .line 476
    move-result v3

    .line 477
    if-eqz v3, :cond_14

    .line 478
    .line 479
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->q()Z

    .line 480
    .line 481
    .line 482
    move-result v3

    .line 483
    if-nez v3, :cond_15

    .line 484
    .line 485
    :cond_14
    invoke-virtual {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->y()Z

    .line 486
    .line 487
    .line 488
    move-result v3

    .line 489
    if-nez v3, :cond_18

    .line 490
    .line 491
    :cond_15
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 492
    .line 493
    invoke-virtual {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->y()Z

    .line 494
    .line 495
    .line 496
    move-result v4

    .line 497
    if-eqz v4, :cond_16

    .line 498
    .line 499
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 500
    .line 501
    and-int/2addr v4, v13

    .line 502
    or-int/2addr v4, v12

    .line 503
    goto :goto_a

    .line 504
    :cond_16
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->r:I

    .line 505
    .line 506
    :goto_a
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 507
    .line 508
    .line 509
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getCharactersCounterText()Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object v3

    .line 513
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 514
    .line 515
    .line 516
    move-result v4

    .line 517
    if-eqz v4, :cond_17

    .line 518
    .line 519
    int-to-float v4, v7

    .line 520
    goto :goto_b

    .line 521
    :cond_17
    int-to-float v4, v8

    .line 522
    iget-object v15, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 523
    .line 524
    invoke-virtual {v15, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 525
    .line 526
    .line 527
    move-result v15

    .line 528
    sub-float/2addr v4, v15

    .line 529
    :goto_b
    iget v15, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i:I

    .line 530
    .line 531
    add-int/2addr v15, v2

    .line 532
    int-to-float v15, v15

    .line 533
    add-float/2addr v15, v5

    .line 534
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 535
    .line 536
    invoke-virtual {v1, v3, v4, v15, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 537
    .line 538
    .line 539
    :cond_18
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->L0:Landroid/text/StaticLayout;

    .line 540
    .line 541
    if-eqz v3, :cond_1d

    .line 542
    .line 543
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E:Ljava/lang/String;

    .line 544
    .line 545
    if-nez v3, :cond_1a

    .line 546
    .line 547
    iget-boolean v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->w:Z

    .line 548
    .line 549
    if-nez v3, :cond_19

    .line 550
    .line 551
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 552
    .line 553
    .line 554
    move-result v3

    .line 555
    if-eqz v3, :cond_1d

    .line 556
    .line 557
    :cond_19
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->C:Ljava/lang/String;

    .line 558
    .line 559
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 560
    .line 561
    .line 562
    move-result v3

    .line 563
    if-nez v3, :cond_1d

    .line 564
    .line 565
    :cond_1a
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 566
    .line 567
    iget-object v4, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E:Ljava/lang/String;

    .line 568
    .line 569
    if-eqz v4, :cond_1b

    .line 570
    .line 571
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->r:I

    .line 572
    .line 573
    goto :goto_c

    .line 574
    :cond_1b
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->D:I

    .line 575
    .line 576
    if-eq v4, v14, :cond_1c

    .line 577
    .line 578
    goto :goto_c

    .line 579
    :cond_1c
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 580
    .line 581
    and-int/2addr v4, v13

    .line 582
    or-int/2addr v4, v12

    .line 583
    :goto_c
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 584
    .line 585
    .line 586
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 587
    .line 588
    .line 589
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getBottomTextLeftOffset()I

    .line 590
    .line 591
    .line 592
    move-result v3

    .line 593
    add-int/2addr v3, v7

    .line 594
    int-to-float v3, v3

    .line 595
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i:I

    .line 596
    .line 597
    add-int/2addr v4, v2

    .line 598
    int-to-float v4, v4

    .line 599
    sub-float/2addr v4, v6

    .line 600
    invoke-virtual {v1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 601
    .line 602
    .line 603
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->L0:Landroid/text/StaticLayout;

    .line 604
    .line 605
    invoke-virtual {v3, v1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 606
    .line 607
    .line 608
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 609
    .line 610
    .line 611
    :cond_1d
    iget-boolean v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->j:Z

    .line 612
    .line 613
    const/4 v4, 0x5

    .line 614
    if-eqz v3, :cond_25

    .line 615
    .line 616
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K:Ljava/lang/CharSequence;

    .line 617
    .line 618
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 619
    .line 620
    .line 621
    move-result v3

    .line 622
    if-nez v3, :cond_25

    .line 623
    .line 624
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 625
    .line 626
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->e:I

    .line 627
    .line 628
    int-to-float v5, v5

    .line 629
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 630
    .line 631
    .line 632
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 633
    .line 634
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->I0:Landroid/animation/ArgbEvaluator;

    .line 635
    .line 636
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->H:F

    .line 637
    .line 638
    iget v15, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->f:I

    .line 639
    .line 640
    if-eq v15, v14, :cond_1e

    .line 641
    .line 642
    goto :goto_d

    .line 643
    :cond_1e
    iget v15, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 644
    .line 645
    and-int/2addr v13, v15

    .line 646
    or-int v15, v13, v12

    .line 647
    .line 648
    :goto_d
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 649
    .line 650
    .line 651
    move-result-object v12

    .line 652
    iget v13, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->q:I

    .line 653
    .line 654
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 655
    .line 656
    .line 657
    move-result-object v13

    .line 658
    invoke-virtual {v5, v6, v12, v13}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 659
    .line 660
    .line 661
    move-result-object v5

    .line 662
    check-cast v5, Ljava/lang/Integer;

    .line 663
    .line 664
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 665
    .line 666
    .line 667
    move-result v5

    .line 668
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 669
    .line 670
    .line 671
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 672
    .line 673
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K:Ljava/lang/CharSequence;

    .line 674
    .line 675
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 676
    .line 677
    .line 678
    move-result-object v5

    .line 679
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 680
    .line 681
    .line 682
    move-result v3

    .line 683
    invoke-virtual {v0}, Landroid/widget/TextView;->getGravity()I

    .line 684
    .line 685
    .line 686
    move-result v5

    .line 687
    and-int/2addr v5, v4

    .line 688
    if-eq v5, v4, :cond_21

    .line 689
    .line 690
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 691
    .line 692
    .line 693
    move-result v5

    .line 694
    if-eqz v5, :cond_1f

    .line 695
    .line 696
    goto :goto_e

    .line 697
    :cond_1f
    invoke-virtual {v0}, Landroid/widget/TextView;->getGravity()I

    .line 698
    .line 699
    .line 700
    move-result v5

    .line 701
    and-int/2addr v5, v9

    .line 702
    if-ne v5, v9, :cond_20

    .line 703
    .line 704
    move v3, v7

    .line 705
    goto :goto_f

    .line 706
    :cond_20
    invoke-virtual {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getInnerPaddingLeft()I

    .line 707
    .line 708
    .line 709
    move-result v5

    .line 710
    int-to-float v5, v5

    .line 711
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 712
    .line 713
    .line 714
    move-result v6

    .line 715
    invoke-virtual {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getInnerPaddingLeft()I

    .line 716
    .line 717
    .line 718
    move-result v9

    .line 719
    sub-int/2addr v6, v9

    .line 720
    invoke-virtual {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->getInnerPaddingRight()I

    .line 721
    .line 722
    .line 723
    move-result v9

    .line 724
    sub-int/2addr v6, v9

    .line 725
    int-to-float v6, v6

    .line 726
    sub-float/2addr v6, v3

    .line 727
    const/high16 v3, 0x40000000    # 2.0f

    .line 728
    .line 729
    div-float/2addr v6, v3

    .line 730
    add-float/2addr v5, v6

    .line 731
    float-to-int v3, v5

    .line 732
    add-int/2addr v3, v7

    .line 733
    goto :goto_f

    .line 734
    :cond_21
    :goto_e
    int-to-float v5, v8

    .line 735
    sub-float/2addr v5, v3

    .line 736
    float-to-int v3, v5

    .line 737
    :goto_f
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->m:I

    .line 738
    .line 739
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->e:I

    .line 740
    .line 741
    add-int/2addr v5, v6

    .line 742
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->h:I

    .line 743
    .line 744
    add-int/2addr v5, v6

    .line 745
    int-to-float v5, v5

    .line 746
    int-to-float v6, v6

    .line 747
    iget-boolean v9, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->v:Z

    .line 748
    .line 749
    const/high16 v12, 0x3f800000    # 1.0f

    .line 750
    .line 751
    if-eqz v9, :cond_22

    .line 752
    .line 753
    move v13, v12

    .line 754
    goto :goto_10

    .line 755
    :cond_22
    iget v13, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F:F

    .line 756
    .line 757
    :goto_10
    mul-float/2addr v6, v13

    .line 758
    sub-float/2addr v5, v6

    .line 759
    float-to-int v5, v5

    .line 760
    if-eqz v9, :cond_23

    .line 761
    .line 762
    move v6, v12

    .line 763
    goto :goto_11

    .line 764
    :cond_23
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F:F

    .line 765
    .line 766
    :goto_11
    const/high16 v9, 0x437f0000    # 255.0f

    .line 767
    .line 768
    mul-float/2addr v6, v9

    .line 769
    iget v9, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->f:I

    .line 770
    .line 771
    if-eq v9, v14, :cond_24

    .line 772
    .line 773
    goto :goto_12

    .line 774
    :cond_24
    const v9, 0x3f3d70a4    # 0.74f

    .line 775
    .line 776
    .line 777
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->H:F

    .line 778
    .line 779
    mul-float/2addr v12, v9

    .line 780
    const v9, 0x3e851eb8    # 0.26f

    .line 781
    .line 782
    .line 783
    add-float/2addr v12, v9

    .line 784
    :goto_12
    mul-float/2addr v6, v12

    .line 785
    float-to-int v6, v6

    .line 786
    iget-object v9, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 787
    .line 788
    invoke-virtual {v9, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 789
    .line 790
    .line 791
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K:Ljava/lang/CharSequence;

    .line 792
    .line 793
    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 794
    .line 795
    .line 796
    move-result-object v6

    .line 797
    int-to-float v3, v3

    .line 798
    int-to-float v5, v5

    .line 799
    iget-object v9, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 800
    .line 801
    invoke-virtual {v1, v6, v3, v5, v9}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 802
    .line 803
    .line 804
    :cond_25
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 805
    .line 806
    .line 807
    move-result v3

    .line 808
    if-eqz v3, :cond_28

    .line 809
    .line 810
    iget-boolean v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u:Z

    .line 811
    .line 812
    if-eqz v3, :cond_28

    .line 813
    .line 814
    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    .line 815
    .line 816
    .line 817
    move-result v3

    .line 818
    if-eqz v3, :cond_28

    .line 819
    .line 820
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 821
    .line 822
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->q:I

    .line 823
    .line 824
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 825
    .line 826
    .line 827
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i:I

    .line 828
    .line 829
    add-int/2addr v2, v3

    .line 830
    int-to-float v2, v2

    .line 831
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 832
    .line 833
    .line 834
    move-result v3

    .line 835
    if-eqz v3, :cond_26

    .line 836
    .line 837
    move v7, v8

    .line 838
    :cond_26
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A()Z

    .line 839
    .line 840
    .line 841
    move-result v3

    .line 842
    if-eqz v3, :cond_27

    .line 843
    .line 844
    move v10, v14

    .line 845
    :cond_27
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->x:I

    .line 846
    .line 847
    mul-int v5, v10, v3

    .line 848
    .line 849
    div-int/2addr v5, v11

    .line 850
    add-int/2addr v5, v7

    .line 851
    int-to-float v5, v5

    .line 852
    div-int/lit8 v6, v3, 0x2

    .line 853
    .line 854
    int-to-float v6, v6

    .line 855
    add-float/2addr v6, v2

    .line 856
    div-int/2addr v3, v11

    .line 857
    int-to-float v3, v3

    .line 858
    iget-object v8, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 859
    .line 860
    invoke-virtual {v1, v5, v6, v3, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 861
    .line 862
    .line 863
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->x:I

    .line 864
    .line 865
    mul-int v5, v10, v3

    .line 866
    .line 867
    mul-int/2addr v5, v4

    .line 868
    div-int/2addr v5, v11

    .line 869
    add-int/2addr v5, v7

    .line 870
    int-to-float v4, v5

    .line 871
    div-int/lit8 v5, v3, 0x2

    .line 872
    .line 873
    int-to-float v5, v5

    .line 874
    add-float/2addr v5, v2

    .line 875
    div-int/2addr v3, v11

    .line 876
    int-to-float v3, v3

    .line 877
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 878
    .line 879
    invoke-virtual {v1, v4, v5, v3, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 880
    .line 881
    .line 882
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->x:I

    .line 883
    .line 884
    mul-int/2addr v10, v3

    .line 885
    mul-int/lit8 v10, v10, 0x9

    .line 886
    .line 887
    div-int/2addr v10, v11

    .line 888
    add-int/2addr v7, v10

    .line 889
    int-to-float v4, v7

    .line 890
    div-int/lit8 v5, v3, 0x2

    .line 891
    .line 892
    int-to-float v5, v5

    .line 893
    add-float/2addr v2, v5

    .line 894
    div-int/2addr v3, v11

    .line 895
    int-to-float v3, v3

    .line 896
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->J0:Landroid/graphics/Paint;

    .line 897
    .line 898
    invoke-virtual {v1, v4, v2, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 899
    .line 900
    .line 901
    :cond_28
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 902
    .line 903
    .line 904
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i()Z

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/16 v2, 0x14

    .line 23
    .line 24
    invoke-direct {p0, v2}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->p(I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    int-to-float v2, v2

    .line 29
    cmpg-float v0, v0, v2

    .line 30
    .line 31
    if-gez v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->b:I

    .line 42
    .line 43
    sub-int/2addr v2, v3

    .line 44
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->n:I

    .line 45
    .line 46
    sub-int/2addr v2, v3

    .line 47
    int-to-float v2, v2

    .line 48
    cmpl-float v0, v0, v2

    .line 49
    .line 50
    if-lez v0, :cond_0

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->n:I

    .line 61
    .line 62
    sub-int/2addr v2, v3

    .line 63
    int-to-float v2, v2

    .line 64
    cmpg-float v0, v0, v2

    .line 65
    .line 66
    if-gez v0, :cond_0

    .line 67
    .line 68
    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 69
    .line 70
    .line 71
    return v1

    .line 72
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_a

    .line 77
    .line 78
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->U:Z

    .line 79
    .line 80
    if-eqz v0, :cond_a

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/4 v2, 0x1

    .line 87
    if-eqz v0, :cond_8

    .line 88
    .line 89
    if-eq v0, v2, :cond_4

    .line 90
    .line 91
    const/4 v3, 0x2

    .line 92
    if-eq v0, v3, :cond_2

    .line 93
    .line 94
    const/4 v2, 0x3

    .line 95
    if-eq v0, v2, :cond_1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E0:Z

    .line 99
    .line 100
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F0:Z

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F0:Z

    .line 104
    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->x(Landroid/view/MotionEvent;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_3

    .line 112
    .line 113
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F0:Z

    .line 114
    .line 115
    :cond_3
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E0:Z

    .line 116
    .line 117
    if-eqz v0, :cond_a

    .line 118
    .line 119
    return v2

    .line 120
    :cond_4
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F0:Z

    .line 121
    .line 122
    if-eqz v0, :cond_6

    .line 123
    .line 124
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-nez v0, :cond_5

    .line 133
    .line 134
    const/4 v0, 0x0

    .line 135
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    .line 137
    .line 138
    :cond_5
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F0:Z

    .line 139
    .line 140
    :cond_6
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E0:Z

    .line 141
    .line 142
    if-eqz v0, :cond_7

    .line 143
    .line 144
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E0:Z

    .line 145
    .line 146
    return v2

    .line 147
    :cond_7
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E0:Z

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_8
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->x(Landroid/view/MotionEvent;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-eqz p1, :cond_9

    .line 155
    .line 156
    iput-boolean v2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E0:Z

    .line 157
    .line 158
    iput-boolean v2, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F0:Z

    .line 159
    .line 160
    :cond_9
    return v2

    .line 161
    :cond_a
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    return p0
.end method

.method public setAccentTypeface(Landroid/graphics/Typeface;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->I:Landroid/graphics/Typeface;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K0:Landroid/text/TextPaint;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setAutoValidate(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->N:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F()Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setBaseColor(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l:I

    .line 6
    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->v()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setBottomTextSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->g:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCurrentBottomLines(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->A:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setError(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->E:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public setErrorColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->r:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFloatingLabel(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->setFloatingLabelInternal(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setFloatingLabelAlwaysShown(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->v:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFloatingLabelAnimating(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->P:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFloatingLabelFraction(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFloatingLabelPadding(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->h:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFloatingLabelText(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    :cond_0
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->K:Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setFloatingLabelTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->f:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFloatingLabelTextSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->e:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFocusFraction(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->H:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setHelperText(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->C:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->i()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public setHelperTextAlwaysShown(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->w:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setHelperTextColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->D:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setHideUnderline(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->L:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setIconLeft(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l(I)[Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->Q:[Landroid/graphics/Bitmap;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setIconLeft(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->m(Landroid/graphics/Bitmap;)[Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->Q:[Landroid/graphics/Bitmap;

    .line 12
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    return-void
.end method

.method public setIconRight(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->l(I)[Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->R:[Landroid/graphics/Bitmap;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setIconRight(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->m(Landroid/graphics/Bitmap;)[Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->R:[Landroid/graphics/Bitmap;

    .line 12
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    return-void
.end method

.method public setMaxCharacters(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setMetHintTextColor(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->H0:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->C()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMetHintTextColor(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 11
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->H0:Landroid/content/res/ColorStateList;

    .line 12
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->C()V

    return-void
.end method

.method public setMetTextColor(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->G0:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->D()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMetTextColor(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 11
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->G0:Landroid/content/res/ColorStateList;

    .line 12
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->D()V

    return-void
.end method

.method public setMinBottomTextLines(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->z:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setMinCharacters(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->s:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->P0:Landroid/view/View$OnFocusChangeListener;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->Q0:Landroid/view/View$OnFocusChangeListener;

    .line 10
    .line 11
    return-void
.end method

.method public final setPadding(IIII)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setPrimaryColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->q:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setShowClearButton(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->U:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->k()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSingleLineEllipsis(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->t()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->u()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setUnderlineColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->M:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->O:Z

    .line 2
    .line 3
    return p0
.end method
