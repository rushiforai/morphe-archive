.class public Lcom/tencent/could/huiyansdk/fragments/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/callback/b;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private a(I)V
    .locals 2

    .line 83
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 84
    iget-object v1, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    if-eqz v1, :cond_1

    .line 85
    iget-boolean v0, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->x:Z

    if-nez v0, :cond_1

    .line 86
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 87
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 88
    iget v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->g:I

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->j:Landroid/graphics/Paint;

    if-eqz v0, :cond_1

    .line 90
    iput p1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->g:I

    .line 91
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 92
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_1
    :goto_0
    return-void
.end method

.method private a(ILjava/lang/String;)V
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 69
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->c:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    sget-object p1, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 72
    iput-object p2, p1, Lcom/tencent/could/huiyansdk/common/a;->b:Ljava/lang/String;

    .line 73
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 74
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->c:Landroid/widget/TextView;

    .line 75
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method private a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;Ljava/lang/String;)V
    .locals 2

    .line 76
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 77
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->d:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    .line 78
    :cond_0
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    const/4 v1, 0x1

    .line 79
    invoke-virtual {v0, p1, v1}, Lcom/tencent/could/huiyansdk/api/j;->a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;Z)V

    .line 80
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 81
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->p:Lcom/tencent/could/huiyansdk/utils/h;

    .line 82
    invoke-virtual {p0, p2}, Lcom/tencent/could/huiyansdk/utils/h;->a(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/could/huiyansdk/fragments/f;I)V
    .locals 0

    .line 66
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/f;->a(I)V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/could/huiyansdk/fragments/f;Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;Ljava/lang/String;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/tencent/could/huiyansdk/fragments/f;->a(Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Lcom/tencent/could/huiyansdk/fragments/f;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/could/huiyansdk/fragments/f;->a(ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;ILcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 4
    .line 5
    const-string p1, "context is null!"

    .line 6
    .line 7
    const/4 p2, 0x2

    .line 8
    const-string p3, "AuthingFragment"

    .line 9
    .line 10
    invoke-virtual {p0, p2, p3, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 15
    .line 16
    iget-boolean p1, p1, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->t:Z

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    const/4 p1, -0x1

    .line 22
    if-ne p1, p2, :cond_3

    .line 23
    .line 24
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 25
    .line 26
    iget v1, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->w:I

    .line 27
    .line 28
    const/16 v2, 0x14

    .line 29
    .line 30
    if-ge v1, v2, :cond_2

    .line 31
    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    iput v1, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->w:I

    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    const/4 v1, 0x0

    .line 38
    iput v1, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->w:I

    .line 39
    .line 40
    :cond_3
    if-ne p2, p1, :cond_4

    .line 41
    .line 42
    const-string p1, ""

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_4
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getContextResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    :goto_0
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 56
    .line 57
    new-instance v0, Ll/f1r0;

    .line 58
    .line 59
    invoke-direct {v0, p0, p3, p1}, Ll/f1r0;-><init>(Lcom/tencent/could/huiyansdk/fragments/f;Lcom/tencent/could/huiyansdk/enums/HuiYanAuthTipsEvent;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, v0}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public a(Ljava/lang/String;I)V
    .locals 2

    .line 67
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    new-instance v1, Ll/l1r0;

    invoke-direct {v1, p0, p2, p1}, Ll/l1r0;-><init>(Lcom/tencent/could/huiyansdk/fragments/f;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public b(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/f;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    new-instance v1, Ll/j1r0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/j1r0;-><init>(Lcom/tencent/could/huiyansdk/fragments/f;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
