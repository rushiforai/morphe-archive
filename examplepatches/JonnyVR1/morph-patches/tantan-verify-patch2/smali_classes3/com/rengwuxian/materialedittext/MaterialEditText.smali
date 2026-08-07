.class public Lcom/rengwuxian/materialedittext/MaterialEditText;
.super Landroid/widget/EditText;
.source "SourceFile"


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private D:F

.field private E:F

.field private E0:I

.field private F:Ljava/lang/String;

.field private F0:I

.field private G:I

.field private G0:I

.field private H:Ljava/lang/String;

.field private H0:I

.field private I:F

.field private I0:Z

.field private J:Z

.field private J0:Z

.field private K:F

.field private K0:Landroid/content/res/ColorStateList;

.field private L:Landroid/graphics/Typeface;

.field private L0:Landroid/content/res/ColorStateList;

.field private M:Landroid/graphics/Typeface;

.field private M0:Landroid/animation/ArgbEvaluator;

.field private N:Ljava/lang/CharSequence;

.field N0:Landroid/graphics/Paint;

.field private O:Z

.field O0:Landroid/text/TextPaint;

.field private P:I

.field P0:Landroid/text/StaticLayout;

.field private Q:I

.field Q0:Landroid/animation/ObjectAnimator;

.field private R:Z

.field R0:Landroid/animation/ObjectAnimator;

.field private S:Z

.field S0:Landroid/animation/ObjectAnimator;

.field private T:Z

.field T0:Landroid/view/View$OnFocusChangeListener;

.field private U:[Landroid/graphics/Bitmap;

.field U0:Landroid/view/View$OnFocusChangeListener;

.field private V:[Landroid/graphics/Bitmap;

.field private V0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/yiw;",
            ">;"
        }
    .end annotation
.end field

.field private W:[Landroid/graphics/Bitmap;

.field W0:I

.field public X0:Z

.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:I

.field private k:Z

.field private k0:[Landroid/graphics/Bitmap;

.field private l:Z

.field private m:I

.field private n:I

.field private o:I

.field private p:I

.field private p0:Z

.field private q:I

.field private r:I

.field private s:Z

.field private t:I

.field private u:Z

.field private v:I

.field private w:I

.field private x:Z

.field private y:Z

.field private z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->s:Z

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G:I

    .line 9
    .line 10
    new-instance v1, Landroid/animation/ArgbEvaluator;

    .line 11
    .line 12
    invoke-direct {v1}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->M0:Landroid/animation/ArgbEvaluator;

    .line 16
    .line 17
    new-instance v1, Landroid/graphics/Paint;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 24
    .line 25
    new-instance v1, Landroid/text/TextPaint;

    .line 26
    .line 27
    invoke-direct {v1, v2}, Landroid/text/TextPaint;-><init>(I)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 31
    .line 32
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->W0:I

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->X0:Z

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-direct {p0, p1, v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->r(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 41
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    .line 42
    iput-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->s:Z

    const/4 v1, -0x1

    .line 43
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G:I

    .line 44
    new-instance v1, Landroid/animation/ArgbEvaluator;

    invoke-direct {v1}, Landroid/animation/ArgbEvaluator;-><init>()V

    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->M0:Landroid/animation/ArgbEvaluator;

    .line 45
    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 46
    new-instance v1, Landroid/text/TextPaint;

    invoke-direct {v1, v2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 47
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->W0:I

    .line 48
    iput-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->X0:Z

    .line 49
    invoke-direct {p0, p1, p2}, Lcom/rengwuxian/materialedittext/MaterialEditText;->r(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 50
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x0

    .line 51
    iput-boolean p3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->s:Z

    const/4 v0, -0x1

    .line 52
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G:I

    .line 53
    new-instance v0, Landroid/animation/ArgbEvaluator;

    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->M0:Landroid/animation/ArgbEvaluator;

    .line 54
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 55
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 56
    iput p3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->W0:I

    .line 57
    iput-boolean p3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->X0:Z

    .line 58
    invoke-direct {p0, p1, p2}, Lcom/rengwuxian/materialedittext/MaterialEditText;->r(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

.method private B()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->L0:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

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

.method private C()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->K0:Landroid/content/res/ColorStateList;

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
    sget-object v2, Landroid/widget/EditText;->EMPTY_STATE_SET:[I

    .line 15
    .line 16
    filled-new-array {v1, v2}, [[I

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

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
    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->K0:Landroid/content/res/ColorStateList;

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

.method private D(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
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
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->E0:I

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

.method public static synthetic a(Lcom/rengwuxian/materialedittext/MaterialEditText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/rengwuxian/materialedittext/MaterialEditText;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->R:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/rengwuxian/materialedittext/MaterialEditText;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Lcom/rengwuxian/materialedittext/MaterialEditText;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->J:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Lcom/rengwuxian/materialedittext/MaterialEditText;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->J:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic f(Lcom/rengwuxian/materialedittext/MaterialEditText;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getLabelAnimator()Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g(Lcom/rengwuxian/materialedittext/MaterialEditText;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method private getBottomEllipsisWidth()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->x:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->A:I

    .line 6
    .line 7
    mul-int/lit8 v0, v0, 0x5

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

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
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getCharactersCounterWidth()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getBottomEllipsisWidth()I

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
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getBottomEllipsisWidth()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getCharactersCounterWidth()I

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
    invoke-virtual {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->isShowClearButton()Z

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
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->v:I

    .line 2
    .line 3
    const-string v1, " / "

    .line 4
    .line 5
    if-gtz v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

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
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->w:I

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
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->w:I

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
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->w:I

    .line 72
    .line 73
    if-gtz v0, :cond_3

    .line 74
    .line 75
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

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
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->v:I

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
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->v:I

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
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

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
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->w:I

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
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->v:I

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
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->v:I

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
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->w:I

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
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getCharactersCounterText()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->Q0:Landroid/animation/ObjectAnimator;

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
    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->Q0:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->Q0:Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->T:Z

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
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->Q0:Landroid/animation/ObjectAnimator;

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
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->R0:Landroid/animation/ObjectAnimator;

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
    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->R0:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->R0:Landroid/animation/ObjectAnimator;

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

.method public static synthetic h(Lcom/rengwuxian/materialedittext/MaterialEditText;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getLabelFocusAnimator()Landroid/animation/ObjectAnimator;

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
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 10
    .line 11
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->g:I

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H:Ljava/lang/String;

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->B:I

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
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

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
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F:Ljava/lang/String;

    .line 71
    .line 72
    goto :goto_4

    .line 73
    :goto_5
    iget-object v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getBottomTextLeftOffset()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    sub-int/2addr v0, v4

    .line 84
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getBottomTextRightOffset()I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    sub-int v4, v0, v4

    .line 89
    .line 90
    const/4 v7, 0x0

    .line 91
    const/4 v8, 0x1

    .line 92
    const/high16 v6, 0x3f800000    # 1.0f

    .line 93
    .line 94
    invoke-direct/range {v1 .. v8}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 95
    .line 96
    .line 97
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->P0:Landroid/text/StaticLayout;

    .line 98
    .line 99
    invoke-virtual {v1}, Landroid/text/StaticLayout;->getLineCount()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->C:I

    .line 104
    .line 105
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    :goto_6
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->E:F

    .line 110
    .line 111
    int-to-float v0, v0

    .line 112
    cmpl-float v1, v1, v0

    .line 113
    .line 114
    if-eqz v1, :cond_7

    .line 115
    .line 116
    invoke-direct {p0, v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->n(F)Landroid/animation/ObjectAnimator;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    .line 121
    .line 122
    .line 123
    :cond_7
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->E:F

    .line 124
    .line 125
    const/4 p0, 0x1

    .line 126
    return p0
.end method

.method private j()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    :goto_0
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->W0:I

    .line 15
    .line 16
    sub-int/2addr v2, v0

    .line 17
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x3

    .line 22
    const/4 v4, 0x1

    .line 23
    if-le v2, v3, :cond_1

    .line 24
    .line 25
    iput-boolean v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->X0:Z

    .line 26
    .line 27
    :cond_1
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->W0:I

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->q()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    iput-boolean v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->S:Z

    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->v:I

    .line 39
    .line 40
    if-lt v0, v2, :cond_4

    .line 41
    .line 42
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->w:I

    .line 43
    .line 44
    if-lez v2, :cond_3

    .line 45
    .line 46
    if-gt v0, v2, :cond_4

    .line 47
    .line 48
    :cond_3
    move v1, v4

    .line 49
    :cond_4
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->S:Z

    .line 50
    .line 51
    return-void
.end method

.method private k()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getButtonsCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    mul-int/2addr v0, v1

    .line 8
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

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
    move v1, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v0

    .line 18
    move v0, v2

    .line 19
    :goto_0
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    iget-boolean v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->p0:Z

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    move v1, v2

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v2, v0

    .line 36
    :goto_1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->p:I

    .line 37
    .line 38
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->c:I

    .line 39
    .line 40
    add-int/2addr v0, v3

    .line 41
    add-int/2addr v0, v2

    .line 42
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->n:I

    .line 43
    .line 44
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->a:I

    .line 45
    .line 46
    add-int/2addr v2, v3

    .line 47
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->q:I

    .line 48
    .line 49
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->d:I

    .line 50
    .line 51
    add-int/2addr v3, v4

    .line 52
    add-int/2addr v3, v1

    .line 53
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->o:I

    .line 54
    .line 55
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->b:I

    .line 56
    .line 57
    add-int/2addr v1, v4

    .line 58
    invoke-super {p0, v0, v2, v3, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 59
    .line 60
    .line 61
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
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->E0:I

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
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->m(Landroid/graphics/Bitmap;)[Landroid/graphics/Bitmap;

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
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->D(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

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
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    aput-object v3, v0, v2

    .line 27
    .line 28
    new-instance v3, Landroid/graphics/Canvas;

    .line 29
    .line 30
    aget-object v4, v0, v2

    .line 31
    .line 32
    invoke-direct {v3, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 33
    .line 34
    .line 35
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->r:I

    .line 36
    .line 37
    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 38
    .line 39
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    const/4 v4, 0x2

    .line 47
    aput-object v3, v0, v4

    .line 48
    .line 49
    new-instance v3, Landroid/graphics/Canvas;

    .line 50
    .line 51
    aget-object v4, v0, v4

    .line 52
    .line 53
    invoke-direct {v3, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 54
    .line 55
    .line 56
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

    .line 57
    .line 58
    const v6, 0xffffff

    .line 59
    .line 60
    .line 61
    and-int/2addr v6, v4

    .line 62
    invoke-static {v4}, Ll/if5;->a(I)Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-eqz v4, :cond_1

    .line 67
    .line 68
    const/high16 v4, 0x4c000000    # 3.3554432E7f

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const/high16 v4, 0x42000000    # 32.0f

    .line 72
    .line 73
    :goto_0
    or-int/2addr v4, v6

    .line 74
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const/4 v1, 0x3

    .line 82
    aput-object p1, v0, v1

    .line 83
    .line 84
    new-instance p1, Landroid/graphics/Canvas;

    .line 85
    .line 86
    aget-object v1, v0, v1

    .line 87
    .line 88
    invoke-direct {p1, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 89
    .line 90
    .line 91
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->t:I

    .line 92
    .line 93
    invoke-virtual {p1, p0, v5}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 94
    .line 95
    .line 96
    return-object v0
.end method

.method private n(F)Landroid/animation/ObjectAnimator;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->S0:Landroid/animation/ObjectAnimator;

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
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->S0:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->S0:Landroid/animation/ObjectAnimator;

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
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->S0:Landroid/animation/ObjectAnimator;

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
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->v:I

    .line 2
    .line 3
    if-gtz v0, :cond_1

    .line 4
    .line 5
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->w:I

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
    invoke-direct {p0, v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->E0:I

    .line 8
    .line 9
    const/16 v1, 0x30

    .line 10
    .line 11
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G0:I

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
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

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
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->A:I

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
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->K0:Landroid/content/res/ColorStateList;

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
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->L0:Landroid/content/res/ColorStateList;

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
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

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
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

    .line 139
    .line 140
    :goto_0
    sget v3, Ll/whc0;->e:I

    .line 141
    .line 142
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

    .line 143
    .line 144
    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    iput v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

    .line 149
    .line 150
    sget v3, Ll/whc0;->h:I

    .line 151
    .line 152
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->j:I

    .line 153
    .line 154
    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    iput v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->j:I

    .line 159
    .line 160
    sget v3, Ll/whc0;->C:I

    .line 161
    .line 162
    invoke-virtual {v0, v3, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->r:I

    .line 167
    .line 168
    sget v1, Ll/whc0;->j:I

    .line 169
    .line 170
    const/4 v3, 0x0

    .line 171
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setFloatingLabelInternal(I)V

    .line 176
    .line 177
    .line 178
    sget v1, Ll/whc0;->i:I

    .line 179
    .line 180
    const-string v4, "#e7492E"

    .line 181
    .line 182
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 183
    .line 184
    .line 185
    move-result v4

    .line 186
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->t:I

    .line 191
    .line 192
    sget v1, Ll/whc0;->y:I

    .line 193
    .line 194
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->u:Z

    .line 199
    .line 200
    sget v1, Ll/whc0;->B:I

    .line 201
    .line 202
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->v:I

    .line 207
    .line 208
    sget v1, Ll/whc0;->z:I

    .line 209
    .line 210
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->w:I

    .line 215
    .line 216
    sget v1, Ll/whc0;->D:I

    .line 217
    .line 218
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->x:Z

    .line 223
    .line 224
    sget v1, Ll/whc0;->q:I

    .line 225
    .line 226
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F:Ljava/lang/String;

    .line 231
    .line 232
    sget v1, Ll/whc0;->s:I

    .line 233
    .line 234
    const/4 v4, -0x1

    .line 235
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G:I

    .line 240
    .line 241
    sget v1, Ll/whc0;->A:I

    .line 242
    .line 243
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->C:I

    .line 248
    .line 249
    sget v1, Ll/whc0;->b:I

    .line 250
    .line 251
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    if-eqz v1, :cond_1

    .line 256
    .line 257
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 258
    .line 259
    .line 260
    move-result v5

    .line 261
    if-nez v5, :cond_1

    .line 262
    .line 263
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->o(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->L:Landroid/graphics/Typeface;

    .line 268
    .line 269
    iget-object v5, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 270
    .line 271
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 272
    .line 273
    .line 274
    :cond_1
    sget v1, Ll/whc0;->G:I

    .line 275
    .line 276
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    if-eqz v1, :cond_2

    .line 281
    .line 282
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 283
    .line 284
    .line 285
    move-result v5

    .line 286
    if-nez v5, :cond_2

    .line 287
    .line 288
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->o(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->M:Landroid/graphics/Typeface;

    .line 293
    .line 294
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 295
    .line 296
    .line 297
    :cond_2
    sget v1, Ll/whc0;->n:I

    .line 298
    .line 299
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N:Ljava/lang/CharSequence;

    .line 304
    .line 305
    if-nez v1, :cond_3

    .line 306
    .line 307
    invoke-virtual {p0}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N:Ljava/lang/CharSequence;

    .line 312
    .line 313
    :cond_3
    sget v1, Ll/whc0;->m:I

    .line 314
    .line 315
    iget v5, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

    .line 316
    .line 317
    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->h:I

    .line 322
    .line 323
    sget v1, Ll/whc0;->p:I

    .line 324
    .line 325
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 326
    .line 327
    .line 328
    move-result-object v5

    .line 329
    sget v6, Ll/jac0;->c:I

    .line 330
    .line 331
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 332
    .line 333
    .line 334
    move-result v5

    .line 335
    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 336
    .line 337
    .line 338
    move-result v1

    .line 339
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->e:I

    .line 340
    .line 341
    sget v1, Ll/whc0;->o:I

    .line 342
    .line 343
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->f:I

    .line 348
    .line 349
    sget v1, Ll/whc0;->l:I

    .line 350
    .line 351
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 352
    .line 353
    .line 354
    move-result v1

    .line 355
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->T:Z

    .line 356
    .line 357
    sget v1, Ll/whc0;->f:I

    .line 358
    .line 359
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 360
    .line 361
    .line 362
    move-result-object v5

    .line 363
    sget v6, Ll/jac0;->b:I

    .line 364
    .line 365
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 366
    .line 367
    .line 368
    move-result v5

    .line 369
    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 370
    .line 371
    .line 372
    move-result v1

    .line 373
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->g:I

    .line 374
    .line 375
    sget v1, Ll/whc0;->t:I

    .line 376
    .line 377
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 378
    .line 379
    .line 380
    move-result v1

    .line 381
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O:Z

    .line 382
    .line 383
    sget v1, Ll/whc0;->H:I

    .line 384
    .line 385
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->P:I

    .line 390
    .line 391
    sget v1, Ll/whc0;->u:I

    .line 392
    .line 393
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 394
    .line 395
    .line 396
    move-result v1

    .line 397
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->Q:I

    .line 398
    .line 399
    sget v1, Ll/whc0;->c:I

    .line 400
    .line 401
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 402
    .line 403
    .line 404
    move-result v1

    .line 405
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->R:Z

    .line 406
    .line 407
    sget v1, Ll/whc0;->v:I

    .line 408
    .line 409
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 410
    .line 411
    .line 412
    move-result v1

    .line 413
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->l(I)[Landroid/graphics/Bitmap;

    .line 414
    .line 415
    .line 416
    move-result-object v1

    .line 417
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->U:[Landroid/graphics/Bitmap;

    .line 418
    .line 419
    sget v1, Ll/whc0;->x:I

    .line 420
    .line 421
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 422
    .line 423
    .line 424
    move-result v1

    .line 425
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->l(I)[Landroid/graphics/Bitmap;

    .line 426
    .line 427
    .line 428
    move-result-object v1

    .line 429
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->V:[Landroid/graphics/Bitmap;

    .line 430
    .line 431
    sget v1, Ll/whc0;->g:I

    .line 432
    .line 433
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 434
    .line 435
    .line 436
    move-result v1

    .line 437
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->p0:Z

    .line 438
    .line 439
    sget v1, Ll/qbc0;->a:I

    .line 440
    .line 441
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->l(I)[Landroid/graphics/Bitmap;

    .line 442
    .line 443
    .line 444
    move-result-object v1

    .line 445
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->W:[Landroid/graphics/Bitmap;

    .line 446
    .line 447
    sget v1, Ll/qbc0;->b:I

    .line 448
    .line 449
    invoke-direct {p0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->l(I)[Landroid/graphics/Bitmap;

    .line 450
    .line 451
    .line 452
    move-result-object v1

    .line 453
    iput-object v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->k0:[Landroid/graphics/Bitmap;

    .line 454
    .line 455
    sget v1, Ll/whc0;->w:I

    .line 456
    .line 457
    const/16 v4, 0x10

    .line 458
    .line 459
    invoke-direct {p0, v4}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 460
    .line 461
    .line 462
    move-result v4

    .line 463
    invoke-virtual {v0, v1, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 464
    .line 465
    .line 466
    move-result v1

    .line 467
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H0:I

    .line 468
    .line 469
    sget v1, Ll/whc0;->k:I

    .line 470
    .line 471
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 472
    .line 473
    .line 474
    move-result v1

    .line 475
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->y:Z

    .line 476
    .line 477
    sget v1, Ll/whc0;->r:I

    .line 478
    .line 479
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 480
    .line 481
    .line 482
    move-result v1

    .line 483
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->z:Z

    .line 484
    .line 485
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 486
    .line 487
    .line 488
    const v0, 0x10100d8

    .line 489
    .line 490
    .line 491
    const v1, 0x10100d9

    .line 492
    .line 493
    .line 494
    const v4, 0x10100d5

    .line 495
    .line 496
    .line 497
    const v5, 0x10100d6

    .line 498
    .line 499
    .line 500
    const v6, 0x10100d7

    .line 501
    .line 502
    .line 503
    filled-new-array {v4, v5, v6, v0, v1}, [I

    .line 504
    .line 505
    .line 506
    move-result-object v0

    .line 507
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 508
    .line 509
    .line 510
    move-result-object p1

    .line 511
    invoke-virtual {p1, v3, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 512
    .line 513
    .line 514
    move-result p2

    .line 515
    invoke-virtual {p1, v2, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 516
    .line 517
    .line 518
    move-result v0

    .line 519
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->p:I

    .line 520
    .line 521
    const/4 v0, 0x2

    .line 522
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 523
    .line 524
    .line 525
    move-result v0

    .line 526
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->n:I

    .line 527
    .line 528
    const/4 v0, 0x3

    .line 529
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 530
    .line 531
    .line 532
    move-result v0

    .line 533
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->q:I

    .line 534
    .line 535
    const/4 v0, 0x4

    .line 536
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 537
    .line 538
    .line 539
    move-result p2

    .line 540
    iput p2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->o:I

    .line 541
    .line 542
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 543
    .line 544
    .line 545
    const/4 p1, 0x0

    .line 546
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 547
    .line 548
    .line 549
    iget-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->x:Z

    .line 550
    .line 551
    if-eqz p1, :cond_4

    .line 552
    .line 553
    invoke-virtual {p0}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    .line 554
    .line 555
    .line 556
    move-result-object p1

    .line 557
    invoke-virtual {p0}, Landroid/widget/TextView;->setSingleLine()V

    .line 558
    .line 559
    .line 560
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 561
    .line 562
    .line 563
    :cond_4
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->t()V

    .line 564
    .line 565
    .line 566
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

    .line 567
    .line 568
    .line 569
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->v()V

    .line 570
    .line 571
    .line 572
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->s()V

    .line 573
    .line 574
    .line 575
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->w()V

    .line 576
    .line 577
    .line 578
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->j()V

    .line 579
    .line 580
    .line 581
    return-void
.end method

.method private s()V
    .locals 1

    .line 1
    new-instance v0, Lcom/rengwuxian/materialedittext/MaterialEditText$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/rengwuxian/materialedittext/MaterialEditText$b;-><init>(Lcom/rengwuxian/materialedittext/MaterialEditText;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/rengwuxian/materialedittext/MaterialEditText$c;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lcom/rengwuxian/materialedittext/MaterialEditText$c;-><init>(Lcom/rengwuxian/materialedittext/MaterialEditText;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->T0:Landroid/view/View$OnFocusChangeListener;

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
    iput-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->k:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->l:Z

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->k:Z

    .line 14
    .line 15
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->l:Z

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->k:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->l:Z

    .line 21
    .line 22
    return-void
.end method

.method private t()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->v:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-gtz v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->w:I

    .line 8
    .line 9
    if-gtz v0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->x:Z

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F:Ljava/lang/String;

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
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->C:I

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
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->B:I

    .line 38
    .line 39
    int-to-float v0, v1

    .line 40
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->D:F

    .line 41
    .line 42
    return-void
.end method

.method private u()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->e:I

    .line 6
    .line 7
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->h:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->h:I

    .line 12
    .line 13
    :goto_0
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->a:I

    .line 14
    .line 15
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 16
    .line 17
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->g:I

    .line 18
    .line 19
    int-to-float v1, v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

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
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->D:F

    .line 35
    .line 36
    mul-float/2addr v1, v0

    .line 37
    float-to-int v0, v1

    .line 38
    iget-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O:Z

    .line 39
    .line 40
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

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
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->b:I

    .line 49
    .line 50
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->U:[Landroid/graphics/Bitmap;

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
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 58
    .line 59
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H0:I

    .line 60
    .line 61
    add-int/2addr v0, v2

    .line 62
    :goto_2
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->c:I

    .line 63
    .line 64
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->V:[Landroid/graphics/Bitmap;

    .line 65
    .line 66
    if-nez v0, :cond_3

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_3
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 70
    .line 71
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H0:I

    .line 72
    .line 73
    add-int/2addr v1, v0

    .line 74
    :goto_3
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->d:I

    .line 75
    .line 76
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->k()V

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
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->B()V

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
    move-result v1

    .line 29
    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 30
    .line 31
    .line 32
    const/high16 v1, 0x3f800000    # 1.0f

    .line 33
    .line 34
    iput v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->I:F

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->J:Z

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->W0:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->B()V

    .line 47
    .line 48
    .line 49
    :goto_0
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->C()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private w()V
    .locals 1

    .line 1
    new-instance v0, Lcom/rengwuxian/materialedittext/MaterialEditText$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/rengwuxian/materialedittext/MaterialEditText$a;-><init>(Lcom/rengwuxian/materialedittext/MaterialEditText;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->W0:I

    .line 18
    .line 19
    return-void
.end method

.method private x(Landroid/view/MotionEvent;)Z
    .locals 5

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
    iget-object v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->U:[Landroid/graphics/Bitmap;

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
    iget v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 21
    .line 22
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H0:I

    .line 23
    .line 24
    add-int/2addr v2, v4

    .line 25
    :goto_0
    add-int/2addr v1, v2

    .line 26
    iget-object v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->V:[Landroid/graphics/Bitmap;

    .line 27
    .line 28
    if-nez v2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 40
    .line 41
    sub-int/2addr v2, v4

    .line 42
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H0:I

    .line 43
    .line 44
    sub-int/2addr v2, v4

    .line 45
    :goto_1
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_2

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_2
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 53
    .line 54
    sub-int/2addr v2, v1

    .line 55
    iget v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->q:I

    .line 56
    .line 57
    sub-int v1, v2, v1

    .line 58
    .line 59
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    add-int/2addr v2, v4

    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    sub-int/2addr v2, v4

    .line 73
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

    .line 74
    .line 75
    add-int/2addr v2, v4

    .line 76
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G0:I

    .line 77
    .line 78
    sub-int/2addr v2, v4

    .line 79
    const/16 v4, 0x9

    .line 80
    .line 81
    invoke-direct {p0, v4}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    sub-int/2addr v2, v4

    .line 86
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->j:I

    .line 87
    .line 88
    sub-int/2addr v2, v4

    .line 89
    int-to-float v4, v1

    .line 90
    cmpl-float v4, v0, v4

    .line 91
    .line 92
    if-ltz v4, :cond_3

    .line 93
    .line 94
    iget v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 95
    .line 96
    add-int/2addr v1, v4

    .line 97
    int-to-float v1, v1

    .line 98
    cmpg-float v0, v0, v1

    .line 99
    .line 100
    if-gez v0, :cond_3

    .line 101
    .line 102
    int-to-float v0, v2

    .line 103
    cmpl-float v0, p1, v0

    .line 104
    .line 105
    if-ltz v0, :cond_3

    .line 106
    .line 107
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G0:I

    .line 108
    .line 109
    add-int/2addr v2, p0

    .line 110
    int-to-float p0, v2

    .line 111
    cmpg-float p0, p1, p0

    .line 112
    .line 113
    if-gez p0, :cond_3

    .line 114
    .line 115
    const/4 p0, 0x1

    .line 116
    return p0

    .line 117
    :cond_3
    return v3
.end method

.method private z()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method


# virtual methods
.method public E(IIII)V
    .locals 0

    .line 1
    iput p2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->n:I

    .line 2
    .line 3
    iput p4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->o:I

    .line 4
    .line 5
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->p:I

    .line 6
    .line 7
    iput p3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->q:I

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->k()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public F()Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->V0:Ljava/util/List;

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
    iget-object v4, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->V0:Ljava/util/List;

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
    invoke-virtual {p0, v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    :cond_4
    if-eqz v5, :cond_5

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-virtual {p0, v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

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
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->L:Landroid/graphics/Typeface;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBottomTextSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public getCurrentBottomLines()F
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->D:F

    .line 2
    .line 3
    return p0
.end method

.method public getError()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getErrorColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public getFloatingLabelFraction()F
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->I:F

    .line 2
    .line 3
    return p0
.end method

.method public getFloatingLabelPadding()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public getFloatingLabelText()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFloatingLabelTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public getFloatingLabelTextSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public getFocusFraction()F
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->K:F

    .line 2
    .line 3
    return p0
.end method

.method public getHelperText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHelperTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public getInnerPaddingBottom()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public getInnerPaddingLeft()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public getInnerPaddingRight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public getInnerPaddingTop()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxCharacters()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinBottomTextLines()I
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->C:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinCharacters()I
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public getUnderlineColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->P:I

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
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->V0:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public isShowClearButton()Z
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->p0:Z

    .line 2
    .line 3
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 19
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
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->U:[Landroid/graphics/Bitmap;

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
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 17
    .line 18
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H0:I

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
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->V:[Landroid/graphics/Bitmap;

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
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 41
    .line 42
    sub-int/2addr v3, v5

    .line 43
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H0:I

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
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 63
    .line 64
    const/16 v5, 0xff

    .line 65
    .line 66
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 67
    .line 68
    .line 69
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->U:[Landroid/graphics/Bitmap;

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
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->z()Z

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
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H0:I

    .line 104
    .line 105
    sub-int v6, v7, v6

    .line 106
    .line 107
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

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
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

    .line 118
    .line 119
    add-int/2addr v12, v2

    .line 120
    iget v13, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G0:I

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
    iget-object v13, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 133
    .line 134
    invoke-virtual {v1, v3, v6, v12, v13}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 135
    .line 136
    .line 137
    :cond_5
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->V:[Landroid/graphics/Bitmap;

    .line 138
    .line 139
    if-eqz v3, :cond_9

    .line 140
    .line 141
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->z()Z

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
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H0:I

    .line 169
    .line 170
    add-int/2addr v6, v8

    .line 171
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

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
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

    .line 181
    .line 182
    add-int/2addr v12, v2

    .line 183
    iget v13, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G0:I

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
    iget-object v13, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

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
    const/16 v12, 0x9

    .line 205
    .line 206
    if-eqz v3, :cond_c

    .line 207
    .line 208
    iget-boolean v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->p0:Z

    .line 209
    .line 210
    if-eqz v3, :cond_c

    .line 211
    .line 212
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 213
    .line 214
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 215
    .line 216
    .line 217
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

    .line 218
    .line 219
    .line 220
    move-result v3

    .line 221
    if-eqz v3, :cond_a

    .line 222
    .line 223
    move v3, v7

    .line 224
    goto :goto_4

    .line 225
    :cond_a
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 226
    .line 227
    sub-int v3, v8, v3

    .line 228
    .line 229
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->q:I

    .line 230
    .line 231
    sub-int/2addr v3, v5

    .line 232
    :goto_4
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 233
    .line 234
    .line 235
    move-result-object v5

    .line 236
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 237
    .line 238
    .line 239
    move-result v5

    .line 240
    if-eqz v5, :cond_b

    .line 241
    .line 242
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->k0:[Landroid/graphics/Bitmap;

    .line 243
    .line 244
    aget-object v4, v5, v4

    .line 245
    .line 246
    goto :goto_5

    .line 247
    :cond_b
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->W:[Landroid/graphics/Bitmap;

    .line 248
    .line 249
    aget-object v4, v5, v4

    .line 250
    .line 251
    :goto_5
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F0:I

    .line 252
    .line 253
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    .line 254
    .line 255
    .line 256
    move-result v6

    .line 257
    sub-int/2addr v5, v6

    .line 258
    div-int/2addr v5, v11

    .line 259
    add-int/2addr v3, v5

    .line 260
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

    .line 261
    .line 262
    add-int/2addr v5, v2

    .line 263
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G0:I

    .line 264
    .line 265
    sub-int/2addr v5, v6

    .line 266
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 267
    .line 268
    .line 269
    move-result v13

    .line 270
    sub-int/2addr v6, v13

    .line 271
    div-int/2addr v6, v11

    .line 272
    add-int/2addr v5, v6

    .line 273
    invoke-direct {v0, v12}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 274
    .line 275
    .line 276
    move-result v6

    .line 277
    sub-int/2addr v5, v6

    .line 278
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->j:I

    .line 279
    .line 280
    sub-int/2addr v5, v6

    .line 281
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 282
    .line 283
    .line 284
    move-result-object v6

    .line 285
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 286
    .line 287
    .line 288
    move-result v6

    .line 289
    if-nez v6, :cond_c

    .line 290
    .line 291
    int-to-float v3, v3

    .line 292
    int-to-float v5, v5

    .line 293
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 294
    .line 295
    invoke-virtual {v1, v4, v3, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 296
    .line 297
    .line 298
    :cond_c
    iget-boolean v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O:Z

    .line 299
    .line 300
    const/high16 v13, 0x44000000    # 512.0f

    .line 301
    .line 302
    const v14, 0xffffff

    .line 303
    .line 304
    .line 305
    const/4 v15, -0x1

    .line 306
    if-nez v3, :cond_17

    .line 307
    .line 308
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

    .line 309
    .line 310
    add-int/2addr v2, v3

    .line 311
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->z()Z

    .line 312
    .line 313
    .line 314
    move-result v3

    .line 315
    if-nez v3, :cond_f

    .line 316
    .line 317
    iget-boolean v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->u:Z

    .line 318
    .line 319
    if-eqz v3, :cond_f

    .line 320
    .line 321
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 322
    .line 323
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->t:I

    .line 324
    .line 325
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 326
    .line 327
    .line 328
    int-to-float v3, v7

    .line 329
    move v4, v3

    .line 330
    int-to-float v3, v2

    .line 331
    move v5, v2

    .line 332
    move v2, v4

    .line 333
    int-to-float v4, v8

    .line 334
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->Q:I

    .line 335
    .line 336
    if-eq v6, v15, :cond_d

    .line 337
    .line 338
    goto :goto_6

    .line 339
    :cond_d
    invoke-direct {v0, v11}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 340
    .line 341
    .line 342
    move-result v6

    .line 343
    :goto_6
    add-int/2addr v6, v5

    .line 344
    int-to-float v6, v6

    .line 345
    move/from16 v16, v5

    .line 346
    .line 347
    move v5, v6

    .line 348
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 349
    .line 350
    move/from16 v17, v12

    .line 351
    .line 352
    move/from16 v12, v16

    .line 353
    .line 354
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 355
    .line 356
    .line 357
    :cond_e
    move-object/from16 v1, p1

    .line 358
    .line 359
    goto/16 :goto_c

    .line 360
    .line 361
    :cond_f
    move/from16 v17, v12

    .line 362
    .line 363
    move v12, v2

    .line 364
    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    .line 365
    .line 366
    .line 367
    move-result v1

    .line 368
    if-nez v1, :cond_11

    .line 369
    .line 370
    iget-object v1, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 371
    .line 372
    iget v2, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->P:I

    .line 373
    .line 374
    if-eq v2, v15, :cond_10

    .line 375
    .line 376
    goto :goto_7

    .line 377
    :cond_10
    iget v2, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

    .line 378
    .line 379
    and-int/2addr v2, v14

    .line 380
    or-int/2addr v2, v13

    .line 381
    :goto_7
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 382
    .line 383
    .line 384
    invoke-direct {v0, v10}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    int-to-float v1, v1

    .line 389
    const/4 v2, 0x0

    .line 390
    move/from16 v16, v2

    .line 391
    .line 392
    :goto_8
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 393
    .line 394
    .line 395
    move-result v2

    .line 396
    int-to-float v2, v2

    .line 397
    cmpg-float v2, v16, v2

    .line 398
    .line 399
    if-gez v2, :cond_e

    .line 400
    .line 401
    int-to-float v2, v7

    .line 402
    add-float v2, v2, v16

    .line 403
    .line 404
    int-to-float v3, v12

    .line 405
    add-float v4, v2, v1

    .line 406
    .line 407
    invoke-direct {v0, v10}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 408
    .line 409
    .line 410
    move-result v5

    .line 411
    add-int/2addr v5, v12

    .line 412
    int-to-float v5, v5

    .line 413
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 414
    .line 415
    move/from16 v18, v1

    .line 416
    .line 417
    move-object/from16 v1, p1

    .line 418
    .line 419
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 420
    .line 421
    .line 422
    const/high16 v1, 0x40400000    # 3.0f

    .line 423
    .line 424
    mul-float v1, v1, v18

    .line 425
    .line 426
    add-float v16, v16, v1

    .line 427
    .line 428
    move/from16 v1, v18

    .line 429
    .line 430
    goto :goto_8

    .line 431
    :cond_11
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 432
    .line 433
    .line 434
    move-result v1

    .line 435
    if-eqz v1, :cond_13

    .line 436
    .line 437
    iget-object v1, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 438
    .line 439
    iget v2, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->r:I

    .line 440
    .line 441
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 442
    .line 443
    .line 444
    int-to-float v2, v7

    .line 445
    int-to-float v3, v12

    .line 446
    int-to-float v4, v8

    .line 447
    iget v1, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->Q:I

    .line 448
    .line 449
    if-eq v1, v15, :cond_12

    .line 450
    .line 451
    goto :goto_9

    .line 452
    :cond_12
    invoke-direct {v0, v11}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 453
    .line 454
    .line 455
    move-result v1

    .line 456
    :goto_9
    add-int/2addr v1, v12

    .line 457
    int-to-float v5, v1

    .line 458
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 459
    .line 460
    move-object/from16 v1, p1

    .line 461
    .line 462
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 463
    .line 464
    .line 465
    goto :goto_c

    .line 466
    :cond_13
    iget-boolean v1, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->s:Z

    .line 467
    .line 468
    iget-object v2, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 469
    .line 470
    if-eqz v1, :cond_15

    .line 471
    .line 472
    iget v1, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->r:I

    .line 473
    .line 474
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 475
    .line 476
    .line 477
    int-to-float v2, v7

    .line 478
    int-to-float v3, v12

    .line 479
    int-to-float v4, v8

    .line 480
    iget v1, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->Q:I

    .line 481
    .line 482
    if-eq v1, v15, :cond_14

    .line 483
    .line 484
    goto :goto_a

    .line 485
    :cond_14
    invoke-direct {v0, v11}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 486
    .line 487
    .line 488
    move-result v1

    .line 489
    :goto_a
    add-int/2addr v1, v12

    .line 490
    int-to-float v5, v1

    .line 491
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 492
    .line 493
    move-object/from16 v1, p1

    .line 494
    .line 495
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 496
    .line 497
    .line 498
    goto :goto_c

    .line 499
    :cond_15
    iget v1, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->P:I

    .line 500
    .line 501
    if-eq v1, v15, :cond_16

    .line 502
    .line 503
    goto :goto_b

    .line 504
    :cond_16
    iget v1, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

    .line 505
    .line 506
    and-int/2addr v1, v14

    .line 507
    const/high16 v3, 0x1e000000

    .line 508
    .line 509
    or-int/2addr v1, v3

    .line 510
    :goto_b
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 511
    .line 512
    .line 513
    int-to-float v2, v7

    .line 514
    int-to-float v3, v12

    .line 515
    int-to-float v4, v8

    .line 516
    invoke-direct {v0, v10}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

    .line 517
    .line 518
    .line 519
    move-result v1

    .line 520
    add-int/2addr v1, v12

    .line 521
    int-to-float v5, v1

    .line 522
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 523
    .line 524
    move-object/from16 v1, p1

    .line 525
    .line 526
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 527
    .line 528
    .line 529
    :goto_c
    move v2, v12

    .line 530
    goto :goto_d

    .line 531
    :cond_17
    move/from16 v17, v12

    .line 532
    .line 533
    :goto_d
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 534
    .line 535
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->g:I

    .line 536
    .line 537
    int-to-float v4, v4

    .line 538
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 539
    .line 540
    .line 541
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 542
    .line 543
    invoke-virtual {v3}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 544
    .line 545
    .line 546
    move-result-object v3

    .line 547
    iget v4, v3, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 548
    .line 549
    neg-float v5, v4

    .line 550
    iget v3, v3, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 551
    .line 552
    sub-float/2addr v5, v3

    .line 553
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->g:I

    .line 554
    .line 555
    int-to-float v6, v6

    .line 556
    add-float/2addr v6, v4

    .line 557
    add-float/2addr v6, v3

    .line 558
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 559
    .line 560
    .line 561
    move-result v3

    .line 562
    if-eqz v3, :cond_1a

    .line 563
    .line 564
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->q()Z

    .line 565
    .line 566
    .line 567
    move-result v3

    .line 568
    if-eqz v3, :cond_1a

    .line 569
    .line 570
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 571
    .line 572
    invoke-virtual {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->y()Z

    .line 573
    .line 574
    .line 575
    move-result v4

    .line 576
    if-eqz v4, :cond_18

    .line 577
    .line 578
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

    .line 579
    .line 580
    and-int/2addr v4, v14

    .line 581
    or-int/2addr v4, v13

    .line 582
    goto :goto_e

    .line 583
    :cond_18
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->t:I

    .line 584
    .line 585
    :goto_e
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 586
    .line 587
    .line 588
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getCharactersCounterText()Ljava/lang/String;

    .line 589
    .line 590
    .line 591
    move-result-object v3

    .line 592
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

    .line 593
    .line 594
    .line 595
    move-result v4

    .line 596
    if-eqz v4, :cond_19

    .line 597
    .line 598
    int-to-float v4, v7

    .line 599
    goto :goto_f

    .line 600
    :cond_19
    int-to-float v4, v8

    .line 601
    iget-object v12, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 602
    .line 603
    invoke-virtual {v12, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 604
    .line 605
    .line 606
    move-result v12

    .line 607
    sub-float/2addr v4, v12

    .line 608
    :goto_f
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

    .line 609
    .line 610
    add-int/2addr v12, v2

    .line 611
    int-to-float v12, v12

    .line 612
    add-float/2addr v12, v5

    .line 613
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 614
    .line 615
    invoke-virtual {v1, v3, v4, v12, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 616
    .line 617
    .line 618
    :cond_1a
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->P0:Landroid/text/StaticLayout;

    .line 619
    .line 620
    if-eqz v3, :cond_1f

    .line 621
    .line 622
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H:Ljava/lang/String;

    .line 623
    .line 624
    if-nez v3, :cond_1c

    .line 625
    .line 626
    iget-boolean v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->z:Z

    .line 627
    .line 628
    if-nez v3, :cond_1b

    .line 629
    .line 630
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 631
    .line 632
    .line 633
    move-result v3

    .line 634
    if-eqz v3, :cond_1f

    .line 635
    .line 636
    :cond_1b
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F:Ljava/lang/String;

    .line 637
    .line 638
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 639
    .line 640
    .line 641
    move-result v3

    .line 642
    if-nez v3, :cond_1f

    .line 643
    .line 644
    :cond_1c
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 645
    .line 646
    iget-object v4, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H:Ljava/lang/String;

    .line 647
    .line 648
    if-eqz v4, :cond_1d

    .line 649
    .line 650
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->t:I

    .line 651
    .line 652
    goto :goto_10

    .line 653
    :cond_1d
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G:I

    .line 654
    .line 655
    if-eq v4, v15, :cond_1e

    .line 656
    .line 657
    goto :goto_10

    .line 658
    :cond_1e
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

    .line 659
    .line 660
    and-int/2addr v4, v14

    .line 661
    or-int/2addr v4, v13

    .line 662
    :goto_10
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 663
    .line 664
    .line 665
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 666
    .line 667
    .line 668
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getBottomTextLeftOffset()I

    .line 669
    .line 670
    .line 671
    move-result v3

    .line 672
    add-int/2addr v3, v7

    .line 673
    int-to-float v3, v3

    .line 674
    iget v4, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

    .line 675
    .line 676
    add-int/2addr v4, v2

    .line 677
    int-to-float v4, v4

    .line 678
    sub-float/2addr v4, v6

    .line 679
    invoke-virtual {v1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 680
    .line 681
    .line 682
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->P0:Landroid/text/StaticLayout;

    .line 683
    .line 684
    invoke-virtual {v3, v1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 685
    .line 686
    .line 687
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 688
    .line 689
    .line 690
    :cond_1f
    iget-boolean v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->k:Z

    .line 691
    .line 692
    const/4 v4, 0x5

    .line 693
    if-eqz v3, :cond_27

    .line 694
    .line 695
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N:Ljava/lang/CharSequence;

    .line 696
    .line 697
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 698
    .line 699
    .line 700
    move-result v3

    .line 701
    if-nez v3, :cond_27

    .line 702
    .line 703
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 704
    .line 705
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->e:I

    .line 706
    .line 707
    int-to-float v5, v5

    .line 708
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 709
    .line 710
    .line 711
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 712
    .line 713
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->M0:Landroid/animation/ArgbEvaluator;

    .line 714
    .line 715
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->K:F

    .line 716
    .line 717
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->f:I

    .line 718
    .line 719
    if-eq v12, v15, :cond_20

    .line 720
    .line 721
    goto :goto_11

    .line 722
    :cond_20
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

    .line 723
    .line 724
    and-int/2addr v12, v14

    .line 725
    or-int/2addr v12, v13

    .line 726
    :goto_11
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 727
    .line 728
    .line 729
    move-result-object v12

    .line 730
    iget v13, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->r:I

    .line 731
    .line 732
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 733
    .line 734
    .line 735
    move-result-object v13

    .line 736
    invoke-virtual {v5, v6, v12, v13}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 737
    .line 738
    .line 739
    move-result-object v5

    .line 740
    check-cast v5, Ljava/lang/Integer;

    .line 741
    .line 742
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 743
    .line 744
    .line 745
    move-result v5

    .line 746
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 747
    .line 748
    .line 749
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 750
    .line 751
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N:Ljava/lang/CharSequence;

    .line 752
    .line 753
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 754
    .line 755
    .line 756
    move-result-object v5

    .line 757
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 758
    .line 759
    .line 760
    move-result v3

    .line 761
    invoke-virtual {v0}, Landroid/widget/TextView;->getGravity()I

    .line 762
    .line 763
    .line 764
    move-result v5

    .line 765
    and-int/2addr v5, v4

    .line 766
    if-eq v5, v4, :cond_23

    .line 767
    .line 768
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

    .line 769
    .line 770
    .line 771
    move-result v5

    .line 772
    if-eqz v5, :cond_21

    .line 773
    .line 774
    goto :goto_12

    .line 775
    :cond_21
    invoke-virtual {v0}, Landroid/widget/TextView;->getGravity()I

    .line 776
    .line 777
    .line 778
    move-result v5

    .line 779
    and-int/2addr v5, v9

    .line 780
    if-ne v5, v9, :cond_22

    .line 781
    .line 782
    move v3, v7

    .line 783
    goto :goto_13

    .line 784
    :cond_22
    invoke-virtual {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getInnerPaddingLeft()I

    .line 785
    .line 786
    .line 787
    move-result v5

    .line 788
    int-to-float v5, v5

    .line 789
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 790
    .line 791
    .line 792
    move-result v6

    .line 793
    invoke-virtual {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getInnerPaddingLeft()I

    .line 794
    .line 795
    .line 796
    move-result v9

    .line 797
    sub-int/2addr v6, v9

    .line 798
    invoke-virtual {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->getInnerPaddingRight()I

    .line 799
    .line 800
    .line 801
    move-result v9

    .line 802
    sub-int/2addr v6, v9

    .line 803
    int-to-float v6, v6

    .line 804
    sub-float/2addr v6, v3

    .line 805
    const/high16 v3, 0x40000000    # 2.0f

    .line 806
    .line 807
    div-float/2addr v6, v3

    .line 808
    add-float/2addr v5, v6

    .line 809
    float-to-int v3, v5

    .line 810
    add-int/2addr v3, v7

    .line 811
    goto :goto_13

    .line 812
    :cond_23
    :goto_12
    int-to-float v5, v8

    .line 813
    sub-float/2addr v5, v3

    .line 814
    float-to-int v3, v5

    .line 815
    :goto_13
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->n:I

    .line 816
    .line 817
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->e:I

    .line 818
    .line 819
    add-int/2addr v5, v6

    .line 820
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->h:I

    .line 821
    .line 822
    add-int/2addr v5, v6

    .line 823
    int-to-float v5, v5

    .line 824
    int-to-float v6, v6

    .line 825
    iget-boolean v9, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->y:Z

    .line 826
    .line 827
    const/high16 v12, 0x3f800000    # 1.0f

    .line 828
    .line 829
    if-eqz v9, :cond_24

    .line 830
    .line 831
    move v13, v12

    .line 832
    goto :goto_14

    .line 833
    :cond_24
    iget v13, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->I:F

    .line 834
    .line 835
    :goto_14
    mul-float/2addr v6, v13

    .line 836
    sub-float/2addr v5, v6

    .line 837
    float-to-int v5, v5

    .line 838
    if-eqz v9, :cond_25

    .line 839
    .line 840
    move v6, v12

    .line 841
    goto :goto_15

    .line 842
    :cond_25
    iget v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->I:F

    .line 843
    .line 844
    :goto_15
    const/high16 v9, 0x437f0000    # 255.0f

    .line 845
    .line 846
    mul-float/2addr v6, v9

    .line 847
    iget v9, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->f:I

    .line 848
    .line 849
    if-eq v9, v15, :cond_26

    .line 850
    .line 851
    goto :goto_16

    .line 852
    :cond_26
    const v9, 0x3f3d70a4    # 0.74f

    .line 853
    .line 854
    .line 855
    iget v12, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->K:F

    .line 856
    .line 857
    mul-float/2addr v12, v9

    .line 858
    const v9, 0x3e851eb8    # 0.26f

    .line 859
    .line 860
    .line 861
    add-float/2addr v12, v9

    .line 862
    :goto_16
    mul-float/2addr v6, v12

    .line 863
    float-to-int v6, v6

    .line 864
    iget-object v9, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 865
    .line 866
    invoke-virtual {v9, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 867
    .line 868
    .line 869
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N:Ljava/lang/CharSequence;

    .line 870
    .line 871
    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 872
    .line 873
    .line 874
    move-result-object v6

    .line 875
    int-to-float v3, v3

    .line 876
    int-to-float v5, v5

    .line 877
    iget-object v9, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

    .line 878
    .line 879
    invoke-virtual {v1, v6, v3, v5, v9}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 880
    .line 881
    .line 882
    :cond_27
    invoke-virtual {v0}, Landroid/view/View;->hasFocus()Z

    .line 883
    .line 884
    .line 885
    move-result v3

    .line 886
    if-eqz v3, :cond_2a

    .line 887
    .line 888
    iget-boolean v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->x:Z

    .line 889
    .line 890
    if-eqz v3, :cond_2a

    .line 891
    .line 892
    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    .line 893
    .line 894
    .line 895
    move-result v3

    .line 896
    if-eqz v3, :cond_2a

    .line 897
    .line 898
    iget-object v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 899
    .line 900
    iget v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->r:I

    .line 901
    .line 902
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 903
    .line 904
    .line 905
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->i:I

    .line 906
    .line 907
    add-int/2addr v2, v3

    .line 908
    int-to-float v2, v2

    .line 909
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

    .line 910
    .line 911
    .line 912
    move-result v3

    .line 913
    if-eqz v3, :cond_28

    .line 914
    .line 915
    move v7, v8

    .line 916
    :cond_28
    invoke-direct {v0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->A()Z

    .line 917
    .line 918
    .line 919
    move-result v3

    .line 920
    if-eqz v3, :cond_29

    .line 921
    .line 922
    move v10, v15

    .line 923
    :cond_29
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->A:I

    .line 924
    .line 925
    mul-int v5, v10, v3

    .line 926
    .line 927
    div-int/2addr v5, v11

    .line 928
    add-int/2addr v5, v7

    .line 929
    int-to-float v5, v5

    .line 930
    div-int/lit8 v6, v3, 0x2

    .line 931
    .line 932
    int-to-float v6, v6

    .line 933
    add-float/2addr v6, v2

    .line 934
    div-int/2addr v3, v11

    .line 935
    int-to-float v3, v3

    .line 936
    iget-object v8, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 937
    .line 938
    invoke-virtual {v1, v5, v6, v3, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 939
    .line 940
    .line 941
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->A:I

    .line 942
    .line 943
    mul-int v5, v10, v3

    .line 944
    .line 945
    mul-int/2addr v5, v4

    .line 946
    div-int/2addr v5, v11

    .line 947
    add-int/2addr v5, v7

    .line 948
    int-to-float v4, v5

    .line 949
    div-int/lit8 v5, v3, 0x2

    .line 950
    .line 951
    int-to-float v5, v5

    .line 952
    add-float/2addr v5, v2

    .line 953
    div-int/2addr v3, v11

    .line 954
    int-to-float v3, v3

    .line 955
    iget-object v6, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 956
    .line 957
    invoke-virtual {v1, v4, v5, v3, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 958
    .line 959
    .line 960
    iget v3, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->A:I

    .line 961
    .line 962
    mul-int/2addr v10, v3

    .line 963
    mul-int/lit8 v10, v10, 0x9

    .line 964
    .line 965
    div-int/2addr v10, v11

    .line 966
    add-int/2addr v7, v10

    .line 967
    int-to-float v4, v7

    .line 968
    div-int/lit8 v5, v3, 0x2

    .line 969
    .line 970
    int-to-float v5, v5

    .line 971
    add-float/2addr v2, v5

    .line 972
    div-int/2addr v3, v11

    .line 973
    int-to-float v3, v3

    .line 974
    iget-object v5, v0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N0:Landroid/graphics/Paint;

    .line 975
    .line 976
    invoke-virtual {v1, v4, v2, v3, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 977
    .line 978
    .line 979
    :cond_2a
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 980
    .line 981
    .line 982
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
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->i()Z

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->x:Z

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
    invoke-direct {p0, v2}, Lcom/rengwuxian/materialedittext/MaterialEditText;->p(I)I

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
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->b:I

    .line 42
    .line 43
    sub-int/2addr v2, v3

    .line 44
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->o:I

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
    iget v3, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->o:I

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
    if-eqz v0, :cond_9

    .line 77
    .line 78
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->p0:Z

    .line 79
    .line 80
    if-eqz v0, :cond_9

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
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->I0:Z

    .line 99
    .line 100
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->J0:Z

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->J0:Z

    .line 104
    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->x(Landroid/view/MotionEvent;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_3

    .line 112
    .line 113
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->J0:Z

    .line 114
    .line 115
    :cond_3
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->I0:Z

    .line 116
    .line 117
    if-eqz v0, :cond_9

    .line 118
    .line 119
    return v2

    .line 120
    :cond_4
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->J0:Z

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
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->J0:Z

    .line 139
    .line 140
    :cond_6
    iget-boolean v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->I0:Z

    .line 141
    .line 142
    if-eqz v0, :cond_7

    .line 143
    .line 144
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->I0:Z

    .line 145
    .line 146
    return v2

    .line 147
    :cond_7
    iput-boolean v1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->I0:Z

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_8
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->x(Landroid/view/MotionEvent;)Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-eqz v0, :cond_9

    .line 155
    .line 156
    iput-boolean v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->I0:Z

    .line 157
    .line 158
    iput-boolean v2, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->J0:Z

    .line 159
    .line 160
    return v2

    .line 161
    :cond_9
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
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->L:Landroid/graphics/Typeface;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O0:Landroid/text/TextPaint;

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
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->R:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->F()Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setBaseColor(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->m:I

    .line 6
    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->v()V

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
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->g:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCurrentBottomLines(F)V
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->D:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

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
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->H:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->i()Z

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

.method public setErrorBottomLineShown(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public setErrorColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->t:I

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
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setFloatingLabelInternal(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setFloatingLabelAlwaysShown(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->y:Z

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
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->T:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFloatingLabelFraction(F)V
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->I:F

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
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->h:I

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
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->N:Ljava/lang/CharSequence;

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
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->f:I

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
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->e:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFocusFraction(F)V
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->K:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setForcePrimaryColor(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->s:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

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
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->F:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->i()Z

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
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->z:Z

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
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->G:I

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
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->O:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setHighLightUnderlineWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->Q:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIconLeft(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->l(I)[Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->U:[Landroid/graphics/Bitmap;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setIconLeft(Landroid/graphics/Bitmap;)V
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 11
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->m(Landroid/graphics/Bitmap;)[Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->U:[Landroid/graphics/Bitmap;

    .line 12
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

    return-void
.end method

.method public setIconRight(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->l(I)[Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->V:[Landroid/graphics/Bitmap;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setIconRight(Landroid/graphics/Bitmap;)V
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 11
    invoke-direct {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->m(Landroid/graphics/Bitmap;)[Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->V:[Landroid/graphics/Bitmap;

    .line 12
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

    return-void
.end method

.method public setMaxCharacters(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->w:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->t()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

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
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->L0:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->B()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMetHintTextColor(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 11
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->L0:Landroid/content/res/ColorStateList;

    .line 12
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->B()V

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
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->K0:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->C()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMetTextColor(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 11
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->K0:Landroid/content/res/ColorStateList;

    .line 12
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->C()V

    return-void
.end method

.method public setMinBottomTextLines(I)V
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->C:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->t()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

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
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->v:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->t()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

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
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->T0:Landroid/view/View$OnFocusChangeListener;

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
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->U0:Landroid/view/View$OnFocusChangeListener;

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
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->r:I

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
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->p0:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->k()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSingleLineEllipsis(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->x:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->t()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->u()V

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
    iput p1, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->P:I

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
    iget-boolean p0, p0, Lcom/rengwuxian/materialedittext/MaterialEditText;->S:Z

    .line 2
    .line 3
    return p0
.end method
