.class public Ll/th0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/th0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/CharSequence;

.field public b:Ljava/lang/CharSequence;

.field public c:I

.field public d:Ljava/lang/CharSequence;

.field public e:Ljava/lang/CharSequence;

.field public f:Z

.field public g:Z

.field public h:Landroid/view/View$OnClickListener;

.field public i:Landroid/view/View$OnClickListener;

.field public j:Landroid/content/DialogInterface$OnCancelListener;

.field public k:Landroid/content/DialogInterface$OnShowListener;

.field public l:Landroid/content/DialogInterface$OnDismissListener;

.field public m:I

.field public n:I

.field public o:I

.field public p:Z

.field public q:Z

.field public r:Landroid/content/Context;

.field public s:Landroid/text/method/MovementMethod;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/th0$a;->f:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/th0$a;->g:Z

    .line 8
    .line 9
    sget v1, Ll/tgc0;->a:I

    .line 10
    .line 11
    iput v1, p0, Ll/th0$a;->o:I

    .line 12
    .line 13
    iput-boolean v0, p0, Ll/th0$a;->p:Z

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/th0$a;->q:Z

    .line 17
    .line 18
    iput-object p1, p0, Ll/th0$a;->r:Landroid/content/Context;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a()Ll/th0;
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/th0;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/th0$a;->a:Ljava/lang/CharSequence;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/th0$a;->b:Ljava/lang/CharSequence;

    .line 10
    .line 11
    move-object v4, v3

    .line 12
    iget v3, v0, Ll/th0$a;->c:I

    .line 13
    .line 14
    move-object v5, v4

    .line 15
    iget-object v4, v0, Ll/th0$a;->d:Ljava/lang/CharSequence;

    .line 16
    .line 17
    move-object v6, v5

    .line 18
    iget-object v5, v0, Ll/th0$a;->e:Ljava/lang/CharSequence;

    .line 19
    .line 20
    move-object v7, v6

    .line 21
    iget-boolean v6, v0, Ll/th0$a;->f:Z

    .line 22
    .line 23
    move-object v8, v7

    .line 24
    iget-boolean v7, v0, Ll/th0$a;->g:Z

    .line 25
    .line 26
    move-object v9, v8

    .line 27
    iget-object v8, v0, Ll/th0$a;->h:Landroid/view/View$OnClickListener;

    .line 28
    .line 29
    move-object v10, v9

    .line 30
    iget-object v9, v0, Ll/th0$a;->i:Landroid/view/View$OnClickListener;

    .line 31
    .line 32
    move-object v11, v10

    .line 33
    iget-object v10, v0, Ll/th0$a;->j:Landroid/content/DialogInterface$OnCancelListener;

    .line 34
    .line 35
    move-object v12, v11

    .line 36
    iget-object v11, v0, Ll/th0$a;->k:Landroid/content/DialogInterface$OnShowListener;

    .line 37
    .line 38
    move-object v13, v12

    .line 39
    iget-object v12, v0, Ll/th0$a;->l:Landroid/content/DialogInterface$OnDismissListener;

    .line 40
    .line 41
    move-object v14, v13

    .line 42
    iget v13, v0, Ll/th0$a;->m:I

    .line 43
    .line 44
    move-object v15, v14

    .line 45
    iget v14, v0, Ll/th0$a;->n:I

    .line 46
    .line 47
    move-object/from16 v16, v15

    .line 48
    .line 49
    iget v15, v0, Ll/th0$a;->o:I

    .line 50
    .line 51
    move-object/from16 v17, v1

    .line 52
    .line 53
    iget-boolean v1, v0, Ll/th0$a;->p:Z

    .line 54
    .line 55
    move/from16 v18, v1

    .line 56
    .line 57
    iget-boolean v1, v0, Ll/th0$a;->q:Z

    .line 58
    .line 59
    move/from16 v19, v1

    .line 60
    .line 61
    iget-object v1, v0, Ll/th0$a;->s:Landroid/text/method/MovementMethod;

    .line 62
    .line 63
    iget-object v0, v0, Ll/th0$a;->r:Landroid/content/Context;

    .line 64
    .line 65
    const/16 v20, 0x0

    .line 66
    .line 67
    move/from16 v21, v19

    .line 68
    .line 69
    move-object/from16 v19, v0

    .line 70
    .line 71
    move-object/from16 v0, v16

    .line 72
    .line 73
    move/from16 v16, v18

    .line 74
    .line 75
    move-object/from16 v18, v1

    .line 76
    .line 77
    move-object/from16 v1, v17

    .line 78
    .line 79
    move/from16 v17, v21

    .line 80
    .line 81
    invoke-direct/range {v0 .. v20}, Ll/th0;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;Landroid/content/DialogInterface$OnCancelListener;Landroid/content/DialogInterface$OnShowListener;Landroid/content/DialogInterface$OnDismissListener;IIIZZLandroid/text/method/MovementMethod;Landroid/content/Context;Ll/uh0;)V

    .line 82
    .line 83
    .line 84
    return-object v0
.end method

.method public b(Z)Ll/th0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/th0$a;->p:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/View$OnClickListener;)Ll/th0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th0$a;->i:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)Ll/th0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/th0$a;->n:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(I)Ll/th0$a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/th0$a;->r:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/th0$a;->e:Ljava/lang/CharSequence;

    .line 12
    .line 13
    return-object p0
.end method

.method public f(Ljava/lang/CharSequence;)Ll/th0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th0$a;->e:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Z)Ll/th0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/th0$a;->f:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Z)Ll/th0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/th0$a;->g:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public i(I)Ll/th0$a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/th0$a;->r:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/th0$a;->b:Ljava/lang/CharSequence;

    .line 12
    .line 13
    return-object p0
.end method

.method public j(Ljava/lang/CharSequence;)Ll/th0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th0$a;->b:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(I)Ll/th0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/th0$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Landroid/content/DialogInterface$OnCancelListener;)Ll/th0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th0$a;->j:Landroid/content/DialogInterface$OnCancelListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th0$a;->l:Landroid/content/DialogInterface$OnDismissListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Landroid/content/DialogInterface$OnShowListener;)Ll/th0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th0$a;->k:Landroid/content/DialogInterface$OnShowListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Landroid/view/View$OnClickListener;)Ll/th0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th0$a;->h:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(I)Ll/th0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/th0$a;->m:I

    .line 2
    .line 3
    return-object p0
.end method

.method public q(I)Ll/th0$a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/th0$a;->r:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/th0$a;->d:Ljava/lang/CharSequence;

    .line 12
    .line 13
    return-object p0
.end method

.method public r(Ljava/lang/CharSequence;)Ll/th0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th0$a;->d:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Ljava/lang/String;)Ll/th0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/th0$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Z)Ll/th0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/th0$a;->q:Z

    .line 2
    .line 3
    return-object p0
.end method
