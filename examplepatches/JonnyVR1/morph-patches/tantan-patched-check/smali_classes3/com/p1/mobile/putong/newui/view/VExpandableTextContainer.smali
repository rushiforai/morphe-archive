.class public Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;,
        Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$f;
    }
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:I

.field public h:J

.field public i:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;

.field public k:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$f;

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Ljava/lang/CharSequence;

.field public r:Ljava/lang/CharSequence;

.field public s:I

.field public t:Ll/x20;

.field public u:Z

.field public v:Ll/a5l;

.field public w:I

.field public x:I

.field public y:I

.field public z:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->e:Z

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->h:J

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/b9c0;->h:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->s:I

    .line 27
    .line 28
    const v0, 0x7fffffff

    .line 29
    .line 30
    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->w:I

    .line 32
    .line 33
    const/4 v0, -0x1

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->x:I

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->y:I

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->w(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 44
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->e:Z

    const/4 v0, 0x3

    .line 46
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    const-wide/16 v0, 0x0

    .line 47
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->h:J

    .line 48
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Ll/b9c0;->h:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->s:I

    const v0, 0x7fffffff

    .line 49
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->w:I

    const/4 v0, -0x1

    .line 50
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->x:I

    const/4 v0, 0x0

    .line 51
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->y:I

    .line 52
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->w(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 53
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x1

    .line 54
    iput-boolean p3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->e:Z

    const/4 p3, 0x3

    .line 55
    iput p3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    const-wide/16 v0, 0x0

    .line 56
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->h:J

    .line 57
    sget-object p3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, Ll/b9c0;->h:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->s:I

    const p3, 0x7fffffff

    .line 58
    iput p3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->w:I

    const/4 p3, -0x1

    .line 59
    iput p3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->x:I

    const/4 p3, 0x0

    .line 60
    iput p3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->y:I

    .line 61
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->w(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->F()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->G(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->t:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->d:Z

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->s:I

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->f:Z

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->j:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;

    return-object p0
.end method

.method private getAnimMoveValue()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/pxk0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pxk0;-><init>(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private getLimitLineCount()I
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    .line 2
    .line 3
    const v0, 0x7fffffff

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->k:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$f;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->i:Ll/pf60;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->d:Z

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->l:Z

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;Ll/pf60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->i:Ll/pf60;

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->r(Z)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->I(Z)V

    return-void
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->J(Z)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->setExpandViewHeight(F)V

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->R(II)V

    return-void
.end method

.method private setExpandViewHeight(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    float-to-int p1, p1

    .line 10
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final A(ILandroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->o:Ljava/lang/String;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    invoke-virtual {p0, p4, p2, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->v(Ljava/lang/String;Landroid/text/TextPaint;F)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance p2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    add-int/lit8 p2, p2, -0x3

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    sub-int/2addr p2, p3

    .line 34
    const/4 p3, 0x0

    .line 35
    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    add-int/lit8 p3, p3, 0x3

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result p4

    .line 53
    add-int/2addr p3, p4

    .line 54
    new-instance p4, Landroid/text/SpannableStringBuilder;

    .line 55
    .line 56
    invoke-direct {p4}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p4, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p1, "..."

    .line 63
    .line 64
    invoke-virtual {p4, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p4, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 68
    .line 69
    .line 70
    new-instance p1, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$a;

    .line 71
    .line 72
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$a;-><init>(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)V

    .line 73
    .line 74
    .line 75
    sub-int p2, p3, p2

    .line 76
    .line 77
    const/16 v0, 0x11

    .line 78
    .line 79
    invoke-virtual {p4, p1, p2, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 80
    .line 81
    .line 82
    iget-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->u:Z

    .line 83
    .line 84
    if-eqz p1, :cond_0

    .line 85
    .line 86
    new-instance p1, Landroid/text/style/StyleSpan;

    .line 87
    .line 88
    const/4 v1, 0x1

    .line 89
    invoke-direct {p1, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p4, p1, p2, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 93
    .line 94
    .line 95
    :cond_0
    iput-object p4, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->q:Ljava/lang/CharSequence;

    .line 96
    .line 97
    return-object p4
.end method

.method public final C()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lv/VText;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VText;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->c:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->m:Z

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->c:Lv/VText;

    .line 38
    .line 39
    const/16 v0, 0x8

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    const-string p0, "FeedExpandableTextContainer\u6587\u672c\u4f38\u7f29\u63a7\u4ef6\u7684\u5b50view\u4e0d\u5408\u6cd5\u3002\u9700\u8981\u5b50View\u6570\u91cf\u5927\u4e8e\u4e24\u4e2a\uff0c\u5e76\u4e14\u90fd\u662fTextView\u3002"

    .line 46
    .line 47
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public D()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final E(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    move p1, v0

    .line 14
    :goto_0
    array-length v1, p0

    .line 15
    if-ge p1, v1, :cond_2

    .line 16
    .line 17
    aget-char v1, p0, p1

    .line 18
    .line 19
    invoke-static {v1}, Ll/a9g0;->i(C)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    return v0
.end method

.method public final synthetic F()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->d:Z

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 10
    .line 11
    const v3, 0x7fffffff

    .line 12
    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getLimitLineCount()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/high16 v2, -0x80000000

    .line 34
    .line 35
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    iget-object v5, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {v5, v1, v4}, Landroid/view/View;->measure(II)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iget-boolean v4, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->d:Z

    .line 56
    .line 57
    iget-object v5, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 58
    .line 59
    if-eqz v4, :cond_1

    .line 60
    .line 61
    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_1
    iget-boolean v3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->f:Z

    .line 66
    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getLimitLineCount()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    goto :goto_1

    .line 74
    :cond_2
    iget v3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    .line 75
    .line 76
    :goto_1
    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 77
    .line 78
    .line 79
    :goto_2
    if-ne v1, v0, :cond_3

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->c:Lv/VText;

    .line 82
    .line 83
    const/16 v0, 0x8

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_3
    iget-boolean v3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->f:Z

    .line 90
    .line 91
    if-nez v3, :cond_4

    .line 92
    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->c:Lv/VText;

    .line 94
    .line 95
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    :cond_4
    iget-boolean v2, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->d:Z

    .line 99
    .line 100
    if-nez v2, :cond_5

    .line 101
    .line 102
    new-instance v2, Ll/pf60;

    .line 103
    .line 104
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    add-int/lit8 v0, v0, 0x5

    .line 117
    .line 118
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-direct {v2, v3, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    iput-object v2, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->i:Ll/pf60;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_5
    new-instance v2, Ll/pf60;

    .line 129
    .line 130
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-direct {v2, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    iput-object v2, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->i:Ll/pf60;

    .line 142
    .line 143
    :goto_3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->d:Z

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->J(Z)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public final synthetic G(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->setExpandViewHeight(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public H()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getAnimMoveValue()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final I(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->v:Ll/a5l;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->r:Ljava/lang/CharSequence;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->q:Ljava/lang/CharSequence;

    .line 11
    .line 12
    :goto_0
    invoke-virtual {v0, v1, p0}, Ll/a5l;->a(Lv/VText;Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final J(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->c:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->p:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->o:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public K(I)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->s()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->s:I

    .line 5
    .line 6
    return-object p0
.end method

.method public L(Z)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->N(Ljava/lang/CharSequence;Ljava/util/List;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public N(Ljava/lang/CharSequence;Ljava/util/List;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/newui/view/HighlightData;",
            ">;)",
            "Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->z:Ljava/lang/CharSequence;

    .line 2
    .line 3
    new-instance v0, Ll/a5l;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/a5l;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->v:Ll/a5l;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->s()V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v1, 0x8

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->v:Ll/a5l;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {v0, v2, p1, p2}, Ll/a5l;->b(Lv/VText;Ljava/lang/CharSequence;Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    iget-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->f:Z

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->x()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->c:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->e:Z

    .line 46
    .line 47
    const p2, 0x7fffffff

    .line 48
    .line 49
    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    iget-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->d:Z

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 55
    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    iget p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->c:Lv/VText;

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 76
    .line 77
    .line 78
    :goto_0
    const/4 p1, 0x0

    .line 79
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->H()V

    .line 83
    .line 84
    .line 85
    return-object p0
.end method

.method public final varargs O(Ljava/lang/CharSequence;[Lcom/p1/mobile/putong/newui/view/HighlightData;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    array-length v0, p2

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->N(Ljava/lang/CharSequence;Ljava/util/List;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public P(FF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->j:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;

    .line 2
    .line 3
    return-object p0
.end method

.method public final R(II)V
    .locals 4

    .line 1
    int-to-float v0, p1

    .line 2
    int-to-float v1, p2

    .line 3
    const/4 v2, 0x2

    .line 4
    new-array v2, v2, [F

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    aput v0, v2, v3

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aput v1, v2, v0

    .line 11
    .line 12
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/qxk0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/qxk0;-><init>(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$d;

    .line 25
    .line 26
    invoke-direct {v1, p0, p2, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$d;-><init>(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 30
    .line 31
    .line 32
    iget-wide p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->h:J

    .line 33
    .line 34
    invoke-virtual {v0, p0, p1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public getTextView()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->i:Ll/pf60;

    .line 10
    .line 11
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->i:Ll/pf60;

    .line 20
    .line 21
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->R(II)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->n:Z

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->z:Ljava/lang/CharSequence;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_1

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->i:Ll/pf60;

    .line 52
    .line 53
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast p1, Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->i:Ll/pf60;

    .line 62
    .line 63
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v0, Ljava/lang/Integer;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->R(II)V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->C()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget p2, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->y:I

    .line 11
    .line 12
    if-eq p2, p1, :cond_0

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->y:I

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->z:Ljava/lang/CharSequence;

    .line 17
    .line 18
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    iget-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->f:Z

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->x()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final r(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->f:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getLimitLineCount()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    const p0, 0x7fffffff

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final s()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->C()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setLineLimit(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setNeedBoldExpand(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOnSizeChangeEndListener(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->k:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$f;

    .line 2
    .line 3
    return-void
.end method

.method public t()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-le v0, v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v0, v0, Lv/VText;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    instance-of p0, p0, Lv/VText;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    return v2

    .line 26
    :cond_0
    return v1
.end method

.method public final u(Ljava/lang/CharSequence;)Landroid/text/Layout;
    .locals 10

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->y:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sub-int/2addr v0, v1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int v5, v0, v1

    .line 13
    .line 14
    new-instance v2, Landroid/text/StaticLayout;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineSpacingMultiplier()F

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/TextView;->getLineSpacingExtra()F

    .line 33
    .line 34
    .line 35
    move-result v8

    .line 36
    const/4 v9, 0x0

    .line 37
    move-object v3, p1

    .line 38
    invoke-direct/range {v2 .. v9}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 39
    .line 40
    .line 41
    return-object v2
.end method

.method public final v(Ljava/lang/String;Landroid/text/TextPaint;F)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "..."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->o:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "\r|\n"

    .line 18
    .line 19
    const-string v2, ""

    .line 20
    .line 21
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->u:Z

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->o:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    int-to-float v1, v1

    .line 43
    invoke-virtual {p2}, Landroid/graphics/Paint;->getTextSize()F

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const/high16 v3, 0x41200000    # 10.0f

    .line 48
    .line 49
    div-float/2addr v2, v3

    .line 50
    mul-float/2addr v1, v2

    .line 51
    sub-float/2addr p3, v1

    .line 52
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/4 v2, 0x0

    .line 57
    :goto_0
    if-lez v1, :cond_4

    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    cmpg-float v3, v3, p3

    .line 73
    .line 74
    if-gtz v3, :cond_2

    .line 75
    .line 76
    return-object v2

    .line 77
    :cond_2
    add-int/lit8 v3, v1, -0x1

    .line 78
    .line 79
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->E(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-eqz v3, :cond_3

    .line 88
    .line 89
    add-int/lit8 v1, v1, -0x1

    .line 90
    .line 91
    const/4 v3, 0x1

    .line 92
    if-ne v1, v3, :cond_3

    .line 93
    .line 94
    move-object v2, v0

    .line 95
    :cond_3
    add-int/lit8 v1, v1, -0x1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_4
    return-object v2
.end method

.method public final w(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->a:Landroid/content/Context;

    .line 2
    .line 3
    new-instance p1, Ll/pf60;

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {p1, v1, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->i:Ll/pf60;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 17
    .line 18
    .line 19
    const/16 v1, 0x8

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget-object v2, Ll/jhc0;->V:[I

    .line 35
    .line 36
    invoke-virtual {v1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    sget v1, Ll/jhc0;->e0:I

    .line 41
    .line 42
    const/4 v2, 0x3

    .line 43
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    .line 48
    .line 49
    sget v1, Ll/jhc0;->W:I

    .line 50
    .line 51
    const/4 v2, 0x0

    .line 52
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    int-to-long v3, v1

    .line 57
    iput-wide v3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->h:J

    .line 58
    .line 59
    sget v1, Ll/jhc0;->g0:I

    .line 60
    .line 61
    invoke-virtual {p2, v1, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->e:Z

    .line 66
    .line 67
    sget p1, Ll/jhc0;->c0:I

    .line 68
    .line 69
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->m:Z

    .line 74
    .line 75
    sget p1, Ll/jhc0;->Y:I

    .line 76
    .line 77
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->n:Z

    .line 82
    .line 83
    sget p1, Ll/jhc0;->d0:I

    .line 84
    .line 85
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->f:Z

    .line 90
    .line 91
    sget p1, Ll/jhc0;->a0:I

    .line 92
    .line 93
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->o:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_0

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    sget v1, Lcom/p1/mobile/putong/common/R$string;->e:I

    .line 114
    .line 115
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->o:Ljava/lang/String;

    .line 120
    .line 121
    :cond_0
    sget p1, Ll/jhc0;->b0:I

    .line 122
    .line 123
    invoke-virtual {p2, p1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->u:Z

    .line 128
    .line 129
    sget p1, Ll/jhc0;->X:I

    .line 130
    .line 131
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->p:Ljava/lang/String;

    .line 136
    .line 137
    sget p1, Ll/jhc0;->Z:I

    .line 138
    .line 139
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->x:I

    .line 144
    .line 145
    sget p1, Ll/jhc0;->f0:I

    .line 146
    .line 147
    const v0, 0x7fffffff

    .line 148
    .line 149
    .line 150
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->w:I

    .line 155
    .line 156
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->p:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-eqz p1, :cond_1

    .line 163
    .line 164
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    sget v0, Lcom/p1/mobile/putong/common/R$string;->c:I

    .line 173
    .line 174
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->p:Ljava/lang/String;

    .line 179
    .line 180
    :cond_1
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 181
    .line 182
    .line 183
    :cond_2
    return-void
.end method

.method public final x()V
    .locals 10

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->y:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->z:Ljava/lang/CharSequence;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->u(Ljava/lang/CharSequence;)Landroid/text/Layout;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->z:Ljava/lang/CharSequence;

    .line 17
    .line 18
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget v3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    .line 23
    .line 24
    if-gt v1, v3, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->v:Ll/a5l;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->z:Ljava/lang/CharSequence;

    .line 31
    .line 32
    invoke-virtual {v0, v1, p0}, Ll/a5l;->a(Lv/VText;Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget v3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->w:I

    .line 37
    .line 38
    const-string v4, ""

    .line 39
    .line 40
    const/4 v5, 0x0

    .line 41
    if-gt v1, v3, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {p0, v2, v1, v3}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->z(Ljava/lang/String;Landroid/text/TextPaint;I)Ljava/lang/CharSequence;

    .line 56
    .line 57
    .line 58
    move-object v6, v4

    .line 59
    goto :goto_2

    .line 60
    :cond_2
    move-object v3, v4

    .line 61
    move-object v6, v3

    .line 62
    move v1, v5

    .line 63
    move v7, v1

    .line 64
    :goto_0
    iget v8, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->w:I

    .line 65
    .line 66
    if-ge v1, v8, :cond_4

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineEnd(I)I

    .line 69
    .line 70
    .line 71
    move-result v8

    .line 72
    invoke-virtual {v2, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    iget v9, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->w:I

    .line 77
    .line 78
    add-int/lit8 v9, v9, -0x1

    .line 79
    .line 80
    if-ne v1, v9, :cond_3

    .line 81
    .line 82
    move-object v6, v7

    .line 83
    goto :goto_1

    .line 84
    :cond_3
    new-instance v9, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 100
    .line 101
    move v7, v8

    .line 102
    goto :goto_0

    .line 103
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 104
    .line 105
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    iget-object v7, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 110
    .line 111
    invoke-virtual {v7}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    invoke-virtual {p0, v1, v7, v3, v6}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->y(ILandroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 116
    .line 117
    .line 118
    :goto_2
    move v1, v5

    .line 119
    :goto_3
    iget v3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->x:I

    .line 120
    .line 121
    const/4 v7, -0x1

    .line 122
    if-ne v3, v7, :cond_5

    .line 123
    .line 124
    iget v3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    .line 125
    .line 126
    :cond_5
    if-ge v5, v3, :cond_8

    .line 127
    .line 128
    invoke-virtual {v0, v5}, Landroid/text/Layout;->getLineEnd(I)I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    invoke-virtual {v2, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    iget v8, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->x:I

    .line 137
    .line 138
    if-ne v8, v7, :cond_6

    .line 139
    .line 140
    iget v8, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->g:I

    .line 141
    .line 142
    :cond_6
    add-int/lit8 v8, v8, -0x1

    .line 143
    .line 144
    if-ne v5, v8, :cond_7

    .line 145
    .line 146
    move-object v6, v1

    .line 147
    goto :goto_4

    .line 148
    :cond_7
    new-instance v7, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    move-object v4, v1

    .line 164
    :goto_4
    add-int/lit8 v5, v5, 0x1

    .line 165
    .line 166
    move v1, v3

    .line 167
    goto :goto_3

    .line 168
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 169
    .line 170
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 175
    .line 176
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {p0, v0, v1, v4, v6}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->A(ILandroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 181
    .line 182
    .line 183
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->d:Z

    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->v:Ll/a5l;

    .line 186
    .line 187
    if-eqz v0, :cond_9

    .line 188
    .line 189
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 190
    .line 191
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->r:Ljava/lang/CharSequence;

    .line 192
    .line 193
    invoke-virtual {v1, v0, p0}, Ll/a5l;->a(Lv/VText;Ljava/lang/CharSequence;)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->b:Lv/VText;

    .line 198
    .line 199
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->q:Ljava/lang/CharSequence;

    .line 200
    .line 201
    invoke-virtual {v1, v0, p0}, Ll/a5l;->a(Lv/VText;Ljava/lang/CharSequence;)V

    .line 202
    .line 203
    .line 204
    return-void
.end method

.method public final y(ILandroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->p:Ljava/lang/String;

    .line 2
    .line 3
    int-to-float v1, p1

    .line 4
    invoke-virtual {p0, p4, p2, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->v(Ljava/lang/String;Landroid/text/TextPaint;F)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p4

    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    add-int/lit8 p4, p4, -0x3

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    sub-int/2addr p4, v1

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {p3, v1, p4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result p4

    .line 43
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    add-int/lit8 v1, v1, 0x3

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    add-int/2addr v1, v2

    .line 54
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 55
    .line 56
    invoke-direct {v2}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p3, "..."

    .line 63
    .line 64
    invoke-virtual {v2, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 68
    .line 69
    .line 70
    new-instance p3, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$b;

    .line 71
    .line 72
    invoke-direct {p3, p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$b;-><init>(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)V

    .line 73
    .line 74
    .line 75
    sub-int p4, v1, p4

    .line 76
    .line 77
    const/16 v3, 0x11

    .line 78
    .line 79
    invoke-virtual {v2, p3, p4, v1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Landroid/graphics/Paint;->getTextSize()F

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    float-to-int p2, p2

    .line 87
    iget p3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->s:I

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    sget v4, Ll/b9c0;->o:I

    .line 94
    .line 95
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    invoke-static {v0, p2, p1, p3, v3}, Ll/g23;->c(Ljava/lang/String;IIII)Landroid/graphics/Bitmap;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    new-instance p2, Landroid/text/style/ImageSpan;

    .line 104
    .line 105
    iget-object p3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->a:Landroid/content/Context;

    .line 106
    .line 107
    invoke-direct {p2, p3, p1}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 108
    .line 109
    .line 110
    iget-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->u:Z

    .line 111
    .line 112
    if-eqz p1, :cond_0

    .line 113
    .line 114
    new-instance p1, Landroid/text/style/StyleSpan;

    .line 115
    .line 116
    const/4 p2, 0x1

    .line 117
    invoke-direct {p1, p2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 118
    .line 119
    .line 120
    const/16 p2, 0x12

    .line 121
    .line 122
    invoke-virtual {v2, p1, p4, v1, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_0
    const/16 p1, 0x21

    .line 127
    .line 128
    invoke-virtual {v2, p2, p4, v1, p1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 129
    .line 130
    .line 131
    :goto_0
    iput-object v2, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->r:Ljava/lang/CharSequence;

    .line 132
    .line 133
    return-object v2
.end method

.method public final z(Ljava/lang/String;Landroid/text/TextPaint;I)Ljava/lang/CharSequence;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->p:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    add-int/2addr v2, v3

    .line 16
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 17
    .line 18
    invoke-direct {v3}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 25
    .line 26
    .line 27
    new-instance p1, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$c;

    .line 28
    .line 29
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$c;-><init>(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;)V

    .line 30
    .line 31
    .line 32
    sub-int v1, v2, v1

    .line 33
    .line 34
    const/16 v4, 0x11

    .line 35
    .line 36
    invoke-virtual {v3, p1, v1, v2, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Landroid/graphics/Paint;->getTextSize()F

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    float-to-int p1, p1

    .line 44
    iget p2, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->s:I

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    sget v5, Ll/b9c0;->o:I

    .line 51
    .line 52
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-static {v0, p1, p3, p2, v4}, Ll/g23;->c(Ljava/lang/String;IIII)Landroid/graphics/Bitmap;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance p2, Landroid/text/style/ImageSpan;

    .line 61
    .line 62
    iget-object p3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->a:Landroid/content/Context;

    .line 63
    .line 64
    invoke-direct {p2, p3, p1}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 65
    .line 66
    .line 67
    iget-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->u:Z

    .line 68
    .line 69
    if-eqz p1, :cond_0

    .line 70
    .line 71
    new-instance p1, Landroid/text/style/StyleSpan;

    .line 72
    .line 73
    const/4 p2, 0x1

    .line 74
    invoke-direct {p1, p2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 75
    .line 76
    .line 77
    const/16 p2, 0x12

    .line 78
    .line 79
    invoke-virtual {v3, p1, v1, v2, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    const/16 p1, 0x21

    .line 84
    .line 85
    invoke-virtual {v3, p2, v1, v2, p1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 86
    .line 87
    .line 88
    :goto_0
    iput-object v3, p0, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->r:Ljava/lang/CharSequence;

    .line 89
    .line 90
    return-object v3
.end method
