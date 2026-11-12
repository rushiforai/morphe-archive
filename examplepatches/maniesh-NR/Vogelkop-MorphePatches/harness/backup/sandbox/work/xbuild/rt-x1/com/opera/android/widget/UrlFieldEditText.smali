.class public Lcom/opera/android/widget/UrlFieldEditText;
.super Lcom/opera/android/custom_views/ObservableEditText;
.source "SourceFile"

# interfaces
.implements Lwpm;


# static fields
.field public static final synthetic i0:I


# instance fields
.field public A:Z

.field public final B:Ltpm;

.field public final C:Ltpm;

.field public final D:Lvr3;

.field public E:I

.field public F:Ljava/lang/CharSequence;

.field public G:Ljava/lang/String;

.field public H:Z

.field public I:Z

.field public J:I

.field public K:I

.field public L:I

.field public M:I

.field public N:Z

.field public O:Z

.field public P:I

.field public Q:I

.field public R:B

.field public S:Ljava/lang/String;

.field public T:I

.field public U:I

.field public V:F

.field public W:Z

.field public a0:Ljava/lang/String;

.field public b0:Lwpg;

.field public c0:Lesk;

.field public d0:Z

.field public e0:I

.field public f0:I

.field public g0:B

.field public h0:Z

.field public final v:Landroid/view/accessibility/AccessibilityManager;

.field public final w:Lpde;

.field public x:Lywj;

.field public y:Z

.field public z:Lx5f;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 7

    invoke-direct {p0, p1}, Lcom/opera/android/custom_views/ObservableEditText;-><init>(Landroid/content/Context;)V

    new-instance v0, Lpde;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->w:Lpde;

    const-string v0, "accessibility"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/AccessibilityManager;

    iput-object p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->v:Landroid/view/accessibility/AccessibilityManager;

    new-instance p1, Ltpm;

    invoke-direct {p1}, Ltpm;-><init>()V

    iput-object p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->B:Ltpm;

    new-instance v0, Ltpm;

    invoke-direct {v0}, Ltpm;-><init>()V

    iput-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->C:Ltpm;

    new-instance v1, Lvr3;

    invoke-direct {v1, p0}, Lvr3;-><init>(Lcom/opera/android/widget/UrlFieldEditText;)V

    iput-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->D:Lvr3;

    const/4 v1, -0x1

    iput v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->E:I

    const-string v2, ""

    iput-object v2, p0, Lcom/opera/android/widget/UrlFieldEditText;->F:Ljava/lang/CharSequence;

    iput-object v2, p0, Lcom/opera/android/widget/UrlFieldEditText;->G:Ljava/lang/String;

    iput v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->J:I

    iput v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->K:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->Q:I

    new-instance v2, Lfrk;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Lfrk;-><init>(B)V

    iput-object v2, p0, Lcom/opera/android/widget/UrlFieldEditText;->c0:Lesk;

    invoke-virtual {p0}, Landroid/widget/TextView;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p1, Ltpm;->a:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, v0, Ltpm;->a:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    new-instance v2, Lrpm;

    invoke-direct {v2, p0, v1}, Lrpm;-><init>(Ljava/lang/Object;B)V

    sget-object v3, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v3

    if-eqz v3, :cond_66

    invoke-static {v3, p0, v2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_66
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v2

    iget-object v3, p1, Ltpm;->b:[I

    invoke-static {v3, v2}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_77

    iput-object v2, p1, Ltpm;->b:[I

    move p1, v4

    goto :goto_78

    :cond_77
    move p1, v1

    :goto_78
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v2

    iget-object v3, v0, Ltpm;->b:[I

    invoke-static {v3, v2}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v3

    if-nez v3, :cond_87

    iput-object v2, v0, Ltpm;->b:[I

    move v1, v4

    :cond_87
    or-int/2addr p1, v1

    if-eqz p1, :cond_8d

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_8d
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 142
    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/ObservableEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 143
    new-instance p2, Lpde;

    .line 144
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 145
    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 146
    iput-object p2, p0, Lcom/opera/android/widget/UrlFieldEditText;->w:Lpde;

    .line 147
    const-string p2, "accessibility"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/AccessibilityManager;

    iput-object p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->v:Landroid/view/accessibility/AccessibilityManager;

    .line 148
    new-instance p1, Ltpm;

    invoke-direct {p1}, Ltpm;-><init>()V

    iput-object p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->B:Ltpm;

    .line 149
    new-instance p2, Ltpm;

    invoke-direct {p2}, Ltpm;-><init>()V

    iput-object p2, p0, Lcom/opera/android/widget/UrlFieldEditText;->C:Ltpm;

    .line 150
    new-instance v0, Lvr3;

    invoke-direct {v0, p0}, Lvr3;-><init>(Lcom/opera/android/widget/UrlFieldEditText;)V

    iput-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->D:Lvr3;

    const/4 v0, -0x1

    .line 151
    iput v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->E:I

    .line 152
    const-string v1, ""

    iput-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->F:Ljava/lang/CharSequence;

    .line 153
    iput-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->G:Ljava/lang/String;

    .line 154
    iput v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->J:I

    .line 155
    iput v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->K:I

    const/4 v0, 0x0

    .line 156
    iput v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->Q:I

    .line 157
    new-instance v1, Lfrk;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lfrk;-><init>(B)V

    iput-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->c0:Lesk;

    .line 158
    invoke-virtual {p0}, Landroid/widget/TextView;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p1, Ltpm;->a:Landroid/content/res/ColorStateList;

    .line 159
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p2, Ltpm;->a:Landroid/content/res/ColorStateList;

    .line 160
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 161
    new-instance v1, Lrpm;

    invoke-direct {v1, p0, v0}, Lrpm;-><init>(Ljava/lang/Object;B)V

    .line 162
    sget-object v2, Lq9n;->c:Ll5b;

    .line 163
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_66

    .line 164
    invoke-static {v2, p0, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    .line 165
    :cond_66
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    .line 166
    iget-object v2, p1, Ltpm;->b:[I

    .line 167
    invoke-static {v2, v1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_77

    .line 168
    iput-object v1, p1, Ltpm;->b:[I

    move p1, v3

    goto :goto_78

    :cond_77
    move p1, v0

    .line 169
    :goto_78
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    .line 170
    iget-object v2, p2, Ltpm;->b:[I

    .line 171
    invoke-static {v2, v1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-nez v2, :cond_87

    .line 172
    iput-object v1, p2, Ltpm;->b:[I

    move v0, v3

    :cond_87
    or-int/2addr p1, v0

    if-eqz p1, :cond_8d

    .line 173
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_8d
    return-void
.end method


# virtual methods
.method public final A(Z)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-eqz v0, :cond_6

    iput-boolean p1, v0, Lywj;->i:Z

    :cond_6
    iget-object p0, p0, Lcom/opera/android/widget/UrlFieldEditText;->w:Lpde;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final B(Ljava/lang/CharSequence;Ljava/lang/String;II)V
    .registers 7

    const-string v0, ""

    if-nez p1, :cond_5

    move-object p1, v0

    :cond_5
    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-nez p2, :cond_a

    move-object p2, v0

    :cond_a
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->G:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    return-void

    :cond_1d
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/UrlFieldEditText;->A(Z)V

    iput-object p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->F:Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/opera/android/widget/UrlFieldEditText;->G:Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    if-ne p3, v0, :cond_2e

    iput p4, p0, Lcom/opera/android/widget/UrlFieldEditText;->f0:I

    goto :goto_30

    :cond_2e
    iput p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->f0:I

    :goto_30
    iput-byte p3, p0, Lcom/opera/android/widget/UrlFieldEditText;->g0:B

    invoke-virtual {p0}, Landroid/view/View;->isLayoutRequested()Z

    move-result p2

    iget-byte p3, p0, Lcom/opera/android/widget/UrlFieldEditText;->g0:B

    if-eqz p2, :cond_40

    if-nez p3, :cond_3d

    move v0, p1

    :cond_3d
    iput-boolean v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->O:Z

    goto :goto_43

    :cond_40
    invoke-virtual {p0, p3}, Lcom/opera/android/widget/UrlFieldEditText;->v(I)V

    :goto_43
    invoke-virtual {p0, p1}, Lcom/opera/android/widget/UrlFieldEditText;->A(Z)V

    return-void
.end method

.method public final C()Z
    .registers 3

    iget-object p0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-eqz p0, :cond_54

    iget-object v0, p0, Lywj;->c:Lip2;

    iget v1, p0, Lywj;->j:I

    if-nez v1, :cond_54

    iget-boolean v1, p0, Lywj;->h:Z

    if-eqz v1, :cond_54

    invoke-virtual {v0}, Lip2;->d()Z

    move-result v1

    if-eqz v1, :cond_54

    iget-object p0, p0, Lywj;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v1, "default_input_method"

    invoke-static {p0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_28

    const-string p0, ""

    :cond_28
    const-string v1, ".iqqi"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_54

    const-string v1, "omronsoft"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_54

    const-string v1, ".iwnn"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_54

    iget-object p0, v0, Lip2;->a:Ljava/lang/CharSequence;

    sget-object v0, Lywj;->o:Ljava/util/regex/Pattern;

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    if-eqz p0, :cond_54

    const/4 p0, 0x1

    return p0

    :cond_54
    const/4 p0, 0x0

    return p0
.end method

.method public final D()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->b0:Lwpg;

    if-eqz v0, :cond_50

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-eqz v0, :cond_50

    invoke-virtual {p0}, Landroid/view/View;->isFocused()Z

    move-result v0

    if-nez v0, :cond_50

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->c0:Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_47

    invoke-virtual {p0}, Landroid/view/View;->isInLayout()Z

    move-result v0

    if-nez v0, :cond_47

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->b0:Lwpg;

    iget v2, v1, Lwpg;->c:I

    if-gt v2, v0, :cond_3b

    iget-object v0, v1, Lwpg;->b:Ljava/lang/String;

    goto :goto_3d

    :cond_3b
    iget-object v0, v1, Lwpg;->a:Ljava/lang/String;

    :goto_3d
    invoke-virtual {p0}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    move-result-object v1

    if-eq v0, v1, :cond_50

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/OperaEditText;->g(Ljava/lang/String;)V

    return-void

    :cond_47
    new-instance v0, Lwv7;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lwv7;-><init>(Lcom/opera/android/widget/UrlFieldEditText;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_50
    return-void
.end method

.method public final E(Z)V
    .registers 10

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroid/view/View;->isFocused()Z

    move-result v2

    iget-object v3, p0, Lcom/opera/android/widget/UrlFieldEditText;->B:Ltpm;

    invoke-interface {v0, v3}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/opera/android/widget/UrlFieldEditText;->C:Ltpm;

    invoke-interface {v0, v4}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    const/4 v5, 0x0

    if-eqz v2, :cond_22

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v6

    const/16 v7, 0x12

    invoke-interface {v0, v4, v5, v6, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    :cond_22
    iget-object p0, p0, Lcom/opera/android/widget/UrlFieldEditText;->D:Lvr3;

    iget-boolean v4, p0, Lvr3;->b:Z

    if-eq v4, v2, :cond_48

    iput-boolean v2, p0, Lvr3;->b:Z

    if-eqz v2, :cond_48

    iget-object v4, p0, Lvr3;->d:Ljava/lang/Object;

    check-cast v4, Landroid/animation/ValueAnimator;

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v6, 0x2

    new-array v6, v6, [F

    fill-array-data v6, :array_88

    invoke-virtual {v4, v6}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->start()V

    iget-object v4, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/widget/UrlFieldEditText;

    iget p0, p0, Lvr3;->a:I

    invoke-virtual {v4, p0}, Lcom/opera/android/widget/UrlFieldEditText;->setHighlightColor(I)V

    :cond_48
    if-nez v2, :cond_87

    if-eqz p1, :cond_87

    sget-object p0, Lwqm;->a:[Ljava/lang/String;

    const/16 p0, 0x3a

    invoke-virtual {v1, p0}, Ljava/lang/String;->indexOf(I)I

    move-result p0

    const/16 p1, 0x2f

    const/4 v2, -0x1

    if-eq p0, v2, :cond_78

    invoke-virtual {v1, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-eq v4, v2, :cond_61

    if-lt v4, p0, :cond_78

    :cond_61
    const-string v4, "://"

    invoke-virtual {v1, v4, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_76

    add-int/lit8 v5, p0, 0x3

    const-string v4, "www."

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_78

    add-int/lit8 v5, p0, 0x7

    goto :goto_78

    :cond_76
    add-int/lit8 v5, p0, 0x1

    :cond_78
    :goto_78
    invoke-virtual {v1, p1, v5}, Ljava/lang/String;->indexOf(II)I

    move-result p0

    if-eq p0, v2, :cond_87

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result p1

    const/16 v1, 0x21

    invoke-interface {v0, v3, p0, p1, v1}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    :cond_87
    return-void

    :array_88
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final L()I
    .registers 1

    iget p0, p0, Lcom/opera/android/widget/UrlFieldEditText;->Q:I

    return p0
.end method

.method public final bringPointIntoView(I)Z
    .registers 4

    iget v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->E:I

    const/4 v1, 0x0

    if-ne p1, v0, :cond_6

    return v1

    :cond_6
    iget-boolean v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->N:Z

    if-nez v0, :cond_b

    return v1

    :cond_b
    invoke-virtual {p0, p1}, Lcom/opera/android/widget/UrlFieldEditText;->o(I)Z

    move-result p0

    return p0
.end method

.method public final dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 8

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-nez v0, :cond_9

    invoke-super {p0, p1}, Lcom/opera/android/custom_views/ObservableEditText;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p0

    return p0

    :cond_9
    iget-object p0, v0, Lywj;->c:Lip2;

    iget-object v1, v0, Lywj;->a:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v2, v0, Lywj;->g:Lxwj;

    if-nez v2, :cond_16

    invoke-super {v1, p1}, Lcom/opera/android/custom_views/ObservableEditText;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p0

    return p0

    :cond_16
    invoke-virtual {v2}, Lxwj;->d()V

    invoke-virtual {p0}, Lip2;->c()Z

    move-result v2

    const/4 v3, 0x0

    const/16 v4, 0x70

    if-eqz v2, :cond_83

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_83

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    const/4 v5, 0x1

    if-ne v2, v4, :cond_3a

    iget-object p1, v0, Lywj;->e:Lip2;

    const-string v1, ""

    iput-object v1, p1, Lip2;->b:Ljava/lang/CharSequence;

    iput-object v1, p0, Lip2;->b:Ljava/lang/CharSequence;

    iput-boolean v3, v0, Lywj;->h:Z

    goto :goto_95

    :cond_3a
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    const/16 v3, 0x7b

    if-eq v2, v3, :cond_61

    const/16 v3, 0x7a

    if-eq v2, v3, :cond_61

    const/16 v3, 0x15

    if-eq v2, v3, :cond_61

    const/16 v3, 0x16

    if-eq v2, v3, :cond_61

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p0

    const/16 v2, 0x3d

    if-ne p0, v2, :cond_5c

    iget-object p0, v0, Lywj;->g:Lxwj;

    invoke-virtual {p0}, Lxwj;->a()V

    goto :goto_95

    :cond_5c
    invoke-super {v1, p1}, Lcom/opera/android/custom_views/ObservableEditText;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v5

    goto :goto_95

    :cond_61
    iget v2, p0, Lip2;->c:I

    iget-object v3, p0, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    invoke-virtual {p0}, Lip2;->c()Z

    move-result v4

    if-eqz v4, :cond_76

    iget-object p0, p0, Lip2;->b:Ljava/lang/CharSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    add-int/2addr v3, p0

    :cond_76
    iget-object p0, v0, Lywj;->g:Lxwj;

    invoke-virtual {p0}, Lxwj;->a()V

    invoke-virtual {v1, v2, v3}, Landroid/widget/EditText;->setSelection(II)V

    invoke-super {v1, p1}, Lcom/opera/android/custom_views/ObservableEditText;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v5

    goto :goto_95

    :cond_83
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result p0

    if-nez p0, :cond_91

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p0

    if-ne p0, v4, :cond_91

    iput-boolean v3, v0, Lywj;->h:Z

    :cond_91
    invoke-super {v1, p1}, Lcom/opera/android/custom_views/ObservableEditText;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v5

    :goto_95
    iget-object p0, v0, Lywj;->g:Lxwj;

    invoke-virtual {p0}, Lxwj;->e()Z

    return v5
.end method

.method public final drawableStateChanged()V
    .registers 7

    invoke-super {p0}, Lbq1;->drawableStateChanged()V

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->B:Ltpm;

    if-eqz v0, :cond_31

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    iget-object v2, v0, Ltpm;->b:[I

    invoke-static {v2, v1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_19

    iput-object v1, v0, Ltpm;->b:[I

    move v0, v4

    goto :goto_1a

    :cond_19
    move v0, v3

    :goto_1a
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    iget-object v2, p0, Lcom/opera/android/widget/UrlFieldEditText;->C:Ltpm;

    iget-object v5, v2, Ltpm;->b:[I

    invoke-static {v5, v1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v5

    if-nez v5, :cond_2b

    iput-object v1, v2, Ltpm;->b:[I

    move v3, v4

    :cond_2b
    or-int/2addr v0, v3

    if-eqz v0, :cond_31

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_31
    return-void
.end method

.method public final getTextDirection()I
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->I:Z

    if-eqz v0, :cond_6

    const/4 p0, 0x3

    return p0

    :cond_6
    invoke-super {p0}, Landroid/view/View;->getTextDirection()I

    move-result p0

    return p0
.end method

.method public final o(I)Z
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->A:Z

    if-eqz v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-super {p0, p1}, Landroid/widget/TextView;->bringPointIntoView(I)Z

    move-result p0

    return p0
.end method

.method public final onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .registers 5

    invoke-super {p0, p1}, Lbq1;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_c

    iget-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-nez v1, :cond_c

    return-object v0

    :cond_c
    invoke-virtual {p0}, Lcom/opera/android/widget/UrlFieldEditText;->p()V

    iget-object p0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    iget-object v1, p0, Lywj;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v2

    iput v2, p0, Lywj;->l:I

    invoke-virtual {v1}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v1

    iput v1, p0, Lywj;->m:I

    const/4 v1, 0x0

    iput v1, p0, Lywj;->j:I

    if-nez p1, :cond_27

    iput-object v0, p0, Lywj;->g:Lxwj;

    return-object v0

    :cond_27
    new-instance v0, Lxwj;

    invoke-direct {v0, p0}, Lxwj;-><init>(Lywj;)V

    iput-object v0, p0, Lywj;->g:Lxwj;

    invoke-virtual {v0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->setTarget(Landroid/view/inputmethod/InputConnection;)V

    iget-object p0, p0, Lywj;->g:Lxwj;

    return-object p0
.end method

.method public final onDetachedFromWindow()V
    .registers 3

    invoke-super {p0}, Lbq1;->onDetachedFromWindow()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ne v0, v1, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v0, p0}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    :cond_18
    return-void
.end method

.method public final onFocusChanged(ZILandroid/graphics/Rect;)V
    .registers 5

    if-eqz p1, :cond_11

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    goto :goto_12

    :cond_11
    const/4 v0, -0x1

    :goto_12
    iput v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->E:I

    iput-boolean p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->N:Z

    invoke-virtual {p0, p1, p2, p3}, Lcom/opera/android/widget/UrlFieldEditText;->t(ZILandroid/graphics/Rect;)V

    if-eqz p1, :cond_22

    iget-boolean p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->h0:Z

    if-nez p1, :cond_22

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->O:Z

    :cond_22
    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3

    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v0

    :try_start_4
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_b

    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    return-void

    :catchall_b
    move-exception p0

    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    throw p0
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    iget-boolean p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->O:Z

    if-eqz p1, :cond_d

    iget-byte p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->g0:B

    invoke-virtual {p0, p1}, Lcom/opera/android/widget/UrlFieldEditText;->v(I)V

    return-void

    :cond_d
    iget p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->P:I

    sub-int/2addr p4, p2

    if-eq p1, p4, :cond_19

    iget-byte p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->g0:B

    invoke-virtual {p0, p1}, Lcom/opera/android/widget/UrlFieldEditText;->v(I)V

    iput p4, p0, Lcom/opera/android/widget/UrlFieldEditText;->P:I

    :cond_19
    return-void
.end method

.method public final onMeasure(II)V
    .registers 4

    iget v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->J:I

    if-ne v0, p1, :cond_16

    iget v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->K:I

    if-ne v0, p2, :cond_16

    invoke-virtual {p0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v0

    if-eqz v0, :cond_16

    iget p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->L:I

    iget p2, p0, Lcom/opera/android/widget/UrlFieldEditText;->M:I

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void

    :cond_16
    iput p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->J:I

    iput p2, p0, Lcom/opera/android/widget/UrlFieldEditText;->K:I

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    iput p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->L:I

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    iput p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->M:I

    return-void
.end method

.method public final onPreDraw()Z
    .registers 3

    invoke-super {p0}, Landroid/widget/TextView;->onPreDraw()Z

    move-result v0

    iget-boolean v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->A:Z

    if-eqz v1, :cond_14

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->A:Z

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/UrlFieldEditText;->bringPointIntoView(I)Z

    const/4 p0, 0x1

    return p0

    :cond_14
    return v0
.end method

.method public final onProvideAutofillStructure(Landroid/view/ViewStructure;I)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->a0:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_44

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->a0:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v2, "http"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_26

    const-string v2, "https"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_44

    :cond_26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_44

    new-instance v2, Landroid/net/Uri$Builder;

    invoke-direct {v2}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v2, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/ViewStructure;->setWebDomain(Ljava/lang/String;)V

    :cond_44
    invoke-super {p0, p1, p2}, Landroid/view/View;->onProvideAutofillStructure(Landroid/view/ViewStructure;I)V

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "id"

    const-string v1, "url_bar"

    invoke-virtual {p1, p2, p0, v0, v1}, Landroid/view/ViewStructure;->setId(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final onSelectionChanged(II)V
    .registers 4

    iget v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->E:I

    if-eq p2, v0, :cond_7

    const/4 v0, -0x1

    iput v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->E:I

    :cond_7
    invoke-virtual {p0, p1, p2}, Lcom/opera/android/widget/UrlFieldEditText;->u(II)V

    return-void
.end method

.method public final onSizeChanged(IIII)V
    .registers 6

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    invoke-virtual {p0}, Lcom/opera/android/widget/UrlFieldEditText;->D()V

    invoke-virtual {p0}, Landroid/widget/TextView;->getGravity()I

    move-result p2

    const/4 p3, 0x5

    and-int/2addr p2, p3

    const/4 p4, 0x0

    if-ne p2, p3, :cond_11

    const/4 p2, 0x1

    goto :goto_12

    :cond_11
    move p2, p4

    :goto_12
    invoke-virtual {p0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object p3

    iget-boolean v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->H:Z

    if-eqz v0, :cond_34

    if-eqz p3, :cond_34

    if-eqz p2, :cond_31

    invoke-virtual {p3}, Landroid/text/Layout;->getWidth()I

    move-result p2

    sub-int/2addr p2, p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p1

    add-int/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p2

    add-int/2addr p2, p1

    invoke-virtual {p0, p2, p4}, Landroid/view/View;->scrollTo(II)V

    return-void

    :cond_31
    invoke-virtual {p0, p4, p4}, Landroid/view/View;->scrollTo(II)V

    :cond_34
    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Lcom/opera/android/custom_views/OperaEditText;->onTextChanged(Ljava/lang/CharSequence;III)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/opera/android/widget/UrlFieldEditText;->y:Z

    iget-object p0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-eqz p0, :cond_d

    invoke-virtual {p0, p1}, Lywj;->d(Ljava/lang/CharSequence;)V

    :cond_d
    return-void
.end method

.method public final onTextContextMenuItem(I)Z
    .registers 5

    const v0, 0x1020021

    if-eq p1, v0, :cond_a

    const v1, 0x1020020

    if-ne p1, v1, :cond_45

    :cond_a
    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v1

    if-nez v1, :cond_45

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ne v1, v2, :cond_45

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    iget-object v2, p0, Lcom/opera/android/widget/UrlFieldEditText;->F:Ljava/lang/CharSequence;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_45

    iget-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->G:Ljava/lang/String;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->G:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Landroid/widget/EditText;->setSelection(II)V

    invoke-super {p0, p1}, Lcom/opera/android/custom_views/ObservableEditText;->onTextContextMenuItem(I)Z

    move-result v1

    if-ne p1, v0, :cond_44

    iget-object p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->F:Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_44
    return v1

    :cond_45
    invoke-super {p0, p1}, Lcom/opera/android/custom_views/ObservableEditText;->onTextContextMenuItem(I)Z

    move-result p0

    return p0
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    iput v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->Q:I

    :cond_c
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final p()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lywj;

    iget-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->z:Lx5f;

    invoke-direct {v0, p0, v1}, Lywj;-><init>(Lcom/opera/android/widget/UrlFieldEditText;Lx5f;)V

    iput-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->w:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/opera/android/widget/UrlFieldEditText;->A(Z)V

    iget-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z

    move-result v2

    if-nez v2, :cond_34

    iget-object v2, v1, Lywj;->d:Lip2;

    const/4 v3, 0x0

    iput v3, v2, Lip2;->c:I

    iput v3, v2, Lip2;->d:I

    iget-object v1, v1, Lywj;->c:Lip2;

    iput v3, v1, Lip2;->c:I

    iput v3, v1, Lip2;->d:I

    goto :goto_37

    :cond_34
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_37
    iget-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lywj;->c(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    invoke-virtual {v1, v2}, Lywj;->d(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lywj;->b(II)V

    iget-boolean v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->y:Z

    if-eqz v1, :cond_66

    iget-object v1, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_66
    invoke-virtual {p0, v0}, Lcom/opera/android/widget/UrlFieldEditText;->A(Z)V

    return-void
.end method

.method public final q()Ljava/lang/CharSequence;
    .registers 2

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-nez v0, :cond_f

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_e

    const-string p0, ""

    :cond_e
    return-object p0

    :cond_f
    iget-object p0, v0, Lywj;->c:Lip2;

    invoke-virtual {p0}, Lip2;->b()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final r()Ljava/lang/CharSequence;
    .registers 2

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-nez v0, :cond_f

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_e

    const-string p0, ""

    :cond_e
    return-object p0

    :cond_f
    iget-object p0, v0, Lywj;->c:Lip2;

    iget-object p0, p0, Lip2;->a:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public final s()Z
    .registers 1

    iget-object p0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-nez p0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    iget-object p0, p0, Lywj;->c:Lip2;

    invoke-virtual {p0}, Lip2;->c()Z

    move-result p0

    return p0
.end method

.method public final sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x2000

    if-eq v0, v1, :cond_c

    const/16 v1, 0x10

    if-ne v0, v1, :cond_24

    :cond_c
    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->w:Lpde;

    if-eqz v0, :cond_27

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_27

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-eqz v0, :cond_24

    iget-boolean v0, v0, Lywj;->n:Z

    if-nez v0, :cond_27

    :cond_24
    invoke-super {p0, p1}, Landroid/view/View;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    :cond_27
    return-void
.end method

.method public final setHighlightColor(I)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->D:Lvr3;

    if-nez v0, :cond_8

    invoke-virtual {p0, p1}, Lcom/opera/android/widget/UrlFieldEditText;->z(I)V

    return-void

    :cond_8
    iput p1, v0, Lvr3;->a:I

    iget-object v0, v0, Lvr3;->d:Ljava/lang/Object;

    check-cast v0, Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v1

    if-nez v1, :cond_1c

    const/4 v0, 0x0

    goto :goto_26

    :cond_1c
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    :goto_26
    invoke-static {v0, p1}, Lp37;->a0(FI)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/widget/UrlFieldEditText;->z(I)V

    return-void
.end method

.method public final setHorizontallyScrolling(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    iput-boolean p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->H:Z

    return-void
.end method

.method public final setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .registers 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->A:Z

    invoke-virtual {p0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1d

    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v0

    :try_start_11
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_18

    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    goto :goto_1d

    :catchall_18
    move-exception p0

    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    throw p0

    :cond_1d
    :goto_1d
    iget-object p0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-eqz p0, :cond_24

    invoke-virtual {p0, p1}, Lywj;->c(Ljava/lang/CharSequence;)V

    :cond_24
    return-void
.end method

.method public final t(ZILandroid/graphics/Rect;)V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-eqz v0, :cond_13

    if-nez p1, :cond_13

    iget-object v1, v0, Lywj;->d:Lip2;

    const/4 v2, 0x0

    iput v2, v1, Lip2;->c:I

    iput v2, v1, Lip2;->d:I

    iget-object v0, v0, Lywj;->c:Lip2;

    iput v2, v0, Lip2;->c:I

    iput v2, v0, Lip2;->d:I

    :cond_13
    invoke-super {p0, p1, p2, p3}, Lcom/opera/android/custom_views/ObservableEditText;->onFocusChanged(ZILandroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setCursorVisible(Z)V

    return-void
.end method

.method public final u(II)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-eqz v0, :cond_7

    invoke-virtual {v0, p1, p2}, Lywj;->b(II)V

    :cond_7
    invoke-super {p0, p1, p2}, Lcom/opera/android/custom_views/ObservableEditText;->onSelectionChanged(II)V

    return-void
.end method

.method public final v(I)V
    .registers 20

    move-object/from16 v0, p0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/opera/android/widget/UrlFieldEditText;->O:Z

    iget-boolean v2, v0, Lcom/opera/android/widget/UrlFieldEditText;->N:Z

    if-eqz v2, :cond_d

    iget-boolean v2, v0, Lcom/opera/android/widget/UrlFieldEditText;->h0:Z

    if-eqz v2, :cond_195

    :cond_d
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x2

    if-eqz v3, :cond_1a

    move v3, v4

    goto :goto_1c

    :cond_1a
    move/from16 v3, p1

    :goto_1c
    iget-boolean v5, v0, Lcom/opera/android/widget/UrlFieldEditText;->h0:Z

    if-nez v5, :cond_23

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    :cond_23
    invoke-virtual {v0}, Landroid/widget/TextView;->getTextSize()F

    move-result v5

    invoke-static {v0}, Lcs5;->W(Landroid/view/View;)Z

    move-result v6

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v8

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v9

    add-int/2addr v9, v8

    sub-int/2addr v7, v9

    iget-byte v8, v0, Lcom/opera/android/widget/UrlFieldEditText;->R:B

    if-ne v3, v8, :cond_5d

    iget-object v8, v0, Lcom/opera/android/widget/UrlFieldEditText;->S:Ljava/lang/String;

    invoke-static {v2, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_5d

    iget v8, v0, Lcom/opera/android/widget/UrlFieldEditText;->T:I

    if-ne v7, v8, :cond_5d

    iget v8, v0, Lcom/opera/android/widget/UrlFieldEditText;->V:F

    cmpl-float v8, v5, v8

    if-nez v8, :cond_5d

    iget-boolean v8, v0, Lcom/opera/android/widget/UrlFieldEditText;->W:Z

    if-ne v6, v8, :cond_5d

    iget v1, v0, Lcom/opera/android/widget/UrlFieldEditText;->U:I

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->scrollTo(II)V

    return-void

    :cond_5d
    if-eqz v3, :cond_195

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-eq v3, v9, :cond_f3

    if-ne v3, v4, :cond_181

    iget-boolean v4, v0, Lcom/opera/android/widget/UrlFieldEditText;->H:Z

    if-nez v4, :cond_72

    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result v4

    invoke-virtual {v0, v4, v1}, Landroid/view/View;->scrollTo(II)V

    goto/16 :goto_181

    :cond_72
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v11

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v12

    add-int/2addr v12, v11

    sub-int/2addr v10, v12

    invoke-static {v0}, Lcs5;->W(Landroid/view/View;)Z

    move-result v11

    if-eqz v11, :cond_e9

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_c0

    sget-object v4, Lbe3;->b:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result v4

    if-ne v4, v9, :cond_9f

    sget-object v4, Lbe3;->e:Lbe3;

    goto :goto_a1

    :cond_9f
    sget-object v4, Lbe3;->d:Lbe3;

    :goto_a1
    invoke-virtual {v0}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lkgl;->c:Ln9k;

    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    move-result v11

    invoke-virtual {v4, v11, v9}, Ln9k;->k(ILjava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_e9

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v1

    float-to-int v1, v1

    sub-int/2addr v1, v10

    int-to-float v8, v1

    goto :goto_e9

    :cond_c0
    invoke-static {v4}, Lcs5;->J(Ljava/lang/CharSequence;)I

    move-result v1

    if-eqz v1, :cond_e9

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v1

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v9

    invoke-virtual {v1, v9}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v1

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v9

    invoke-virtual {v9}, Landroid/text/Layout;->getPaint()Landroid/text/TextPaint;

    move-result-object v9

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v9, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v4

    int-to-float v9, v10

    sub-float/2addr v1, v9

    add-float/2addr v1, v4

    invoke-static {v8, v1}, Ljava/lang/Math;->max(FF)F

    move-result v8

    :cond_e9
    :goto_e9
    float-to-int v1, v8

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v4

    invoke-virtual {v0, v1, v4}, Landroid/view/View;->scrollTo(II)V

    goto/16 :goto_181

    :cond_f3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v10

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v11

    add-int/2addr v11, v10

    sub-int/2addr v9, v11

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v10

    iget v11, v0, Lcom/opera/android/widget/UrlFieldEditText;->f0:I

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v12

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    invoke-virtual {v10, v11}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v12

    add-int/lit8 v13, v11, -0x1

    invoke-static {v1, v13}, Ljava/lang/Math;->max(II)I

    move-result v14

    invoke-virtual {v10, v14}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v14

    invoke-virtual {v0}, Landroid/view/View;->computeHorizontalScrollRange()I

    move-result v15

    sub-int/2addr v15, v9

    invoke-static {v1, v15}, Ljava/lang/Math;->max(II)I

    move-result v15

    int-to-float v15, v15

    invoke-virtual {v0}, Landroid/view/View;->getHorizontalFadingEdgeLength()I

    move-result v8

    cmpg-float v14, v14, v12

    if-gez v14, :cond_13c

    int-to-float v1, v9

    sub-float/2addr v12, v1

    :goto_138
    int-to-float v1, v8

    add-float/2addr v12, v1

    :goto_13a
    const/4 v1, 0x0

    goto :goto_175

    :cond_13c
    invoke-static {v1, v13}, Ljava/lang/Math;->max(II)I

    move-result v13

    add-int/lit8 v14, v11, -0x2

    :goto_142
    move/from16 v17, v14

    move v14, v13

    move/from16 v13, v17

    if-ltz v13, :cond_15a

    invoke-virtual {v10, v13}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v16

    cmpl-float v16, v16, v12

    if-lez v16, :cond_154

    add-int/lit8 v14, v13, -0x1

    goto :goto_142

    :cond_154
    add-int/lit8 v14, v14, -0x1

    invoke-static {v1, v14}, Ljava/lang/Math;->max(II)I

    move-result v14

    :cond_15a
    invoke-virtual {v10}, Landroid/text/Layout;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    invoke-interface {v4, v14, v11}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    int-to-float v4, v9

    cmpg-float v9, v1, v4

    if-gez v9, :cond_172

    add-float/2addr v12, v1

    sub-float/2addr v12, v4

    goto :goto_138

    :cond_172
    int-to-float v1, v8

    sub-float/2addr v12, v1

    goto :goto_13a

    :goto_175
    invoke-static {v12, v1, v15}, Lcs5;->s(FFF)F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v4

    invoke-virtual {v0, v1, v4}, Landroid/view/View;->scrollTo(II)V

    :cond_181
    :goto_181
    iput-byte v3, v0, Lcom/opera/android/widget/UrlFieldEditText;->R:B

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/opera/android/widget/UrlFieldEditText;->S:Ljava/lang/String;

    iput v7, v0, Lcom/opera/android/widget/UrlFieldEditText;->T:I

    iput v5, v0, Lcom/opera/android/widget/UrlFieldEditText;->V:F

    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result v1

    iput v1, v0, Lcom/opera/android/widget/UrlFieldEditText;->U:I

    iput-boolean v6, v0, Lcom/opera/android/widget/UrlFieldEditText;->W:Z

    :cond_195
    return-void
.end method

.method public final x(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .registers 6

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->A:Z

    :cond_9
    iget-object p0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-eqz p0, :cond_26

    iget-object v0, p0, Lywj;->e:Lip2;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2, p1, p2}, Lip2;->f(IILjava/lang/CharSequence;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lywj;->g:Lxwj;

    if-eqz p1, :cond_26

    invoke-virtual {p1}, Lxwj;->d()V

    iget-object p0, p0, Lywj;->g:Lxwj;

    invoke-virtual {p0}, Lxwj;->e()Z

    :cond_26
    return-void
.end method

.method public final y(Z)V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->d0:Z

    if-eq v0, p1, :cond_35

    iput-boolean p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->d0:Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    if-eqz p1, :cond_16

    invoke-virtual {p0}, Landroid/view/View;->getScrollBarSize()I

    move-result p1

    iput p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->e0:I

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setScrollBarSize(I)V

    return-void

    :cond_16
    iget p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->e0:I

    invoke-virtual {p0, p1}, Landroid/view/View;->setScrollBarSize(I)V

    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-nez v0, :cond_36

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v1

    if-nez v1, :cond_36

    invoke-virtual {p0, p1}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result p1

    if-nez p1, :cond_36

    invoke-virtual {p0, v0}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result p1

    if-nez p1, :cond_36

    :cond_35
    return-void

    :cond_36
    invoke-virtual {p0}, Landroid/view/View;->awakenScrollBars()Z

    return-void
.end method

.method public final z(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/TextView;->setHighlightColor(I)V

    invoke-virtual {p0}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result p1

    if-eqz p1, :cond_29

    iget-object p1, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-nez p1, :cond_f

    const/4 p1, 0x0

    goto :goto_17

    :cond_f
    iget-object p1, p1, Lywj;->c:Lip2;

    iget-object p1, p1, Lip2;->b:Ljava/lang/CharSequence;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    :goto_17
    if-lez p1, :cond_29

    iget-object p0, p0, Lcom/opera/android/widget/UrlFieldEditText;->x:Lywj;

    if-nez p0, :cond_1f

    const/4 p0, 0x0

    goto :goto_21

    :cond_1f
    iget-object p0, p0, Lywj;->g:Lxwj;

    :goto_21
    if-eqz p0, :cond_29

    invoke-virtual {p0}, Lxwj;->beginBatchEdit()Z

    invoke-virtual {p0}, Lxwj;->endBatchEdit()Z

    :cond_29
    return-void
.end method
