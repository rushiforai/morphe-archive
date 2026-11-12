.class public final Ldw7;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Ljava/lang/String;

.field public c:I

.field public final d:Lu4l;

.field public final e:Lm4l;

.field public final f:Lkotlin/jvm/functions/Function0;

.field public final g:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lm4l;->Companion:Ll4l;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lu4l;ILkotlin/jvm/functions/Function0;)V
    .registers 9

    invoke-virtual {p2, p3}, Lu4l;->a(I)Lm4l;

    move-result-object p3

    invoke-virtual {p3}, Lm4l;->c()Lpxh;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget v1, p3, Lm4l;->c:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Ldw7;->a:Landroid/content/Context;

    iput-object v0, p0, Ldw7;->b:Ljava/lang/String;

    iput v1, p0, Ldw7;->c:I

    iput-object p2, p0, Ldw7;->d:Lu4l;

    iput-object p3, p0, Ldw7;->e:Lm4l;

    iput-object p4, p0, Ldw7;->f:Lkotlin/jvm/functions/Function0;

    iput-object v0, p0, Ldw7;->g:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f1403bf

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140ee9

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getTheme()I
    .registers 1

    const p0, 0x7f150295

    return p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 9

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d03f4

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a0242

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroidx/gridlayout/widget/GridLayout;

    if-eqz v4, :cond_7a

    const v1, 0x7f0a0ba4

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v5, :cond_7a

    check-cast v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Ldw7;->b:Ljava/lang/String;

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Lh63;

    invoke-direct {v1, p0, v3}, Lh63;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {p1, v0}, Laz0;->setView(Landroid/view/View;)Laz0;

    new-instance p1, Lg6n;

    invoke-direct {p1, v4}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {p1}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move v0, v3

    :goto_43
    move-object v1, p1

    check-cast v1, Lh6n;

    invoke-virtual {v1}, Lh6n;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_79

    invoke-virtual {v1}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v4, v0, 0x1

    if-ltz v0, :cond_75

    check-cast v1, Landroid/view/View;

    new-instance v5, Lf63;

    invoke-direct {v5, v1, v0}, Lf63;-><init>(Landroid/view/View;I)V

    invoke-static {v1, v5}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    move-object v5, v1

    check-cast v5, Landroid/widget/Checkable;

    iget v6, p0, Ldw7;->c:I

    if-ne v0, v6, :cond_67

    const/4 v6, 0x1

    goto :goto_68

    :cond_67
    move v6, v3

    :goto_68
    invoke-interface {v5, v6}, Landroid/widget/Checkable;->setChecked(Z)V

    new-instance v5, Lg63;

    invoke-direct {v5, p0, v0, v3}, Lg63;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move v0, v4

    goto :goto_43

    :cond_75
    invoke-static {}, Lj95;->n()V

    throw v2

    :cond_79
    return-void

    :cond_7a
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 5

    iget-object p1, p0, Ldw7;->b:Ljava/lang/String;

    iget v0, p0, Ldw7;->c:I

    iget-object v1, p0, Ldw7;->g:Ljava/lang/String;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    iget-object v2, p0, Ldw7;->e:Lm4l;

    if-eqz v1, :cond_10

    iget-object p1, v2, Lm4l;->b:Ljava/lang/String;

    :cond_10
    const/4 v1, 0x1

    invoke-static {v2, p1, v0, v1}, Lm4l;->a(Lm4l;Ljava/lang/String;II)Lm4l;

    move-result-object p1

    iget-object v0, p0, Ldw7;->d:Lu4l;

    invoke-virtual {v0, p1}, Lu4l;->b(Lm4l;)V

    iget-object p0, p0, Ldw7;->f:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final wrapContext(Landroid/content/Context;)Landroid/content/Context;
    .registers 2

    iget-object p0, p0, Ldw7;->a:Landroid/content/Context;

    return-object p0
.end method
