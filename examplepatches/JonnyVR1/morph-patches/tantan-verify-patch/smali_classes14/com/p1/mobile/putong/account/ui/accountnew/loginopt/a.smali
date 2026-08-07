.class public Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$d;,
        Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$b;,
        Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$a;,
        Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$c;
    }
.end annotation


# static fields
.field public static g:F


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/text/TextPaint;

.field public c:Z

.field public d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$c;",
            ">;"
        }
    .end annotation
.end field

.field public e:Landroid/text/TextWatcher;

.field public f:Landroid/view/View$OnLayoutChangeListener;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$b;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$b;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;Ll/uj1;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->e:Landroid/text/TextWatcher;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$a;

    .line 13
    .line 14
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$a;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;Ll/uj1;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->f:Landroid/view/View$OnLayoutChangeListener;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->a:Landroid/widget/TextView;

    .line 20
    .line 21
    new-instance p1, Landroid/text/TextPaint;

    .line 22
    .line 23
    invoke-direct {p1}, Landroid/text/TextPaint;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->b:Landroid/text/TextPaint;

    .line 27
    .line 28
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$d;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->d()V

    return-void
.end method

.method public static e(Landroid/widget/TextView;Landroid/text/TextPaint;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    if-gtz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p0}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    invoke-interface {v2, v1, p0}, Landroid/text/method/TransformationMethod;->getTransformation(Ljava/lang/CharSequence;Landroid/view/View;)Ljava/lang/CharSequence;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string v4, "account"

    .line 45
    .line 46
    sget-object v5, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 47
    .line 48
    invoke-static {v2, v4, v5}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-eqz v4, :cond_2

    .line 53
    .line 54
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    :cond_2
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    sget v3, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->g:F

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {p1, v4}, Landroid/text/TextPaint;->set(Landroid/text/TextPaint;)V

    .line 69
    .line 70
    .line 71
    sget v4, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->g:F

    .line 72
    .line 73
    invoke-virtual {p1, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 74
    .line 75
    .line 76
    int-to-float v0, v0

    .line 77
    invoke-static {v1, p1, v3, v0, v2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->g(Ljava/lang/CharSequence;Landroid/text/TextPaint;FFLandroid/util/DisplayMetrics;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    const/4 v1, 0x2

    .line 82
    if-lt v0, v1, :cond_3

    .line 83
    .line 84
    const/16 v0, 0xe

    .line 85
    .line 86
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    int-to-float v0, v0

    .line 91
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    instance-of p1, p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 99
    .line 100
    if-eqz p1, :cond_4

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 107
    .line 108
    const/high16 v1, 0x40800000    # 4.0f

    .line 109
    .line 110
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_3
    sget v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->g:F

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    instance-of p1, p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 127
    .line 128
    if-eqz p1, :cond_4

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 135
    .line 136
    const/4 v1, 0x0

    .line 137
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 142
    .line 143
    :cond_4
    :goto_0
    const/4 p1, 0x0

    .line 144
    invoke-virtual {p0, p1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public static f(Landroid/widget/TextView;Landroid/util/AttributeSet;I)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;-><init>(Landroid/widget/TextView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    sput p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->g:F

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->i(Z)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;

    .line 14
    .line 15
    .line 16
    return-object p1
.end method

.method public static g(Ljava/lang/CharSequence;Landroid/text/TextPaint;FFLandroid/util/DisplayMetrics;)I
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p2, p4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 3
    .line 4
    .line 5
    move-result p2

    .line 6
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Landroid/text/StaticLayout;

    .line 10
    .line 11
    float-to-int v3, p3

    .line 12
    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 13
    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v7, 0x1

    .line 16
    const/high16 v5, 0x3f800000    # 1.0f

    .line 17
    .line 18
    move-object v1, p0

    .line 19
    move-object v2, p1

    .line 20
    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/text/StaticLayout;->getLineCount()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$c;)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->d:Ljava/util/ArrayList;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->d:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public final d()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getTextSize()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->a:Landroid/widget/TextView;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->b:Landroid/text/TextPaint;

    .line 10
    .line 11
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->e(Landroid/widget/TextView;Landroid/text/TextPaint;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->a:Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/widget/TextView;->getTextSize()F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    cmpl-float v2, v1, v0

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->h(FF)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final h(FF)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$c;

    .line 21
    .line 22
    invoke-interface {v0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$c;->a(FF)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    :goto_1
    return-void
.end method

.method public i(Z)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->c:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->c:Z

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->a:Landroid/widget/TextView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->e:Landroid/text/TextWatcher;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->a:Landroid/widget/TextView;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->f:Landroid/view/View$OnLayoutChangeListener;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->d()V

    .line 24
    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->e:Landroid/text/TextWatcher;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->a:Landroid/widget/TextView;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->f:Landroid/view/View$OnLayoutChangeListener;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-object p0
.end method
