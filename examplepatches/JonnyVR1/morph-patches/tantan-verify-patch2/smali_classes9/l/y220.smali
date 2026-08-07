.class public Ll/y220;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/q220;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Ll/l220;

.field public g:Ll/q220;

.field public h:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/y220;->h:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/y220;->e:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/y220;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y220;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/y220;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y220;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/y220;Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y220;->n(Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;)V

    return-void
.end method

.method public static synthetic d(Ll/y220;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y220;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/y220;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y220;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/y220;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y220;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/y220;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y220;->w()V

    return-void
.end method

.method private l()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/y220;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/y220;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/l220;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/l220;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/y220;->f:Ll/l220;

    .line 25
    .line 26
    iget-object v1, p0, Ll/y220;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/y220;->f:Ll/l220;

    .line 32
    .line 33
    new-instance v1, Ll/v220;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/v220;-><init>(Ll/y220;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/l220;->I(Ll/l220$a;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y220;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/q220;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y220;->k(Ll/q220;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y220;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/z220;->b(Ll/y220;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Ll/q220;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y220;->g:Ll/q220;

    .line 2
    .line 3
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y220;->c:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/s220;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/s220;-><init>(Ll/y220;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/y220;->d:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/t220;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/t220;-><init>(Ll/y220;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/y220;->a:Lv/navigationbar/VNavigationBar;

    .line 22
    .line 23
    new-instance v1, Ll/u220;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/u220;-><init>(Ll/y220;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUESTION_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 4
    .line 5
    const/16 v2, 0x1f4

    .line 6
    .line 7
    const-string v3, ""

    .line 8
    .line 9
    invoke-static {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->getCreateTagInfo(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/lang/String;ILjava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v1, p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setSubTitle(Ljava/lang/String;Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v3, p2, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setEditObjKey(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setDefaultContent(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setEmptyInput(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/y220;->e:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    invoke-static {v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->c2(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;Landroid/content/Context;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p0, p0, Ll/y220;->e:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    iget p2, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->requestCode:I

    .line 44
    .line 45
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/y220;->g:Ll/q220;

    .line 2
    .line 3
    iget-object p1, p1, Ll/q220;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Ll/y220;->e:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUESTION_CHOICE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 8
    .line 9
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->I(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/y220;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "e_edit_answer_done"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/y220;->g:Ll/q220;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/q220;->n0()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/y220;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/y220;->c:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/y220;->d:Lv/VText;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/y220;->e:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v3, Ll/dbc0;->im:I

    .line 26
    .line 27
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v3, Ll/qa00;->j:I

    .line 32
    .line 33
    invoke-virtual {v0, v2, v2, v3, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Ll/y220;->c:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {v2, v0, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/y220;->c:Lv/VText;

    .line 42
    .line 43
    const/4 v1, 0x4

    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0}, Ll/y220;->l()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/y220;->m()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y220;->g:Ll/q220;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/q220;->n0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y220;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/y220;->h:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ll/th0$a;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "\u4fee\u6539\u672a\u4fdd\u5b58"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "\u662f\u5426\u4fdd\u5b58\u672c\u6b21\u4fee\u6539\uff1f"

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p1, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "\u4fdd\u5b58"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/w220;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/w220;-><init>(Ll/y220;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "\u4e0d\u4fdd\u5b58"

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/x220;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/x220;-><init>(Ll/y220;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic w()V
    .locals 4

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/y220;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    iget-object v1, p0, Ll/y220;->a:Lv/navigationbar/VNavigationBar;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    sub-int/2addr v0, v1

    .line 19
    invoke-static {}, Ll/bnl0;->F0()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sub-int/2addr v0, v1

    .line 24
    const/high16 v1, 0x42c80000    # 100.0f

    .line 25
    .line 26
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget-object v2, p0, Ll/y220;->c:Lv/VText;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    add-int/2addr v1, v2

    .line 37
    iget-object v2, p0, Ll/y220;->a:Lv/navigationbar/VNavigationBar;

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    sget v3, Ll/qa00;->h:I

    .line 44
    .line 45
    add-int/2addr v2, v3

    .line 46
    iget-object v3, p0, Ll/y220;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .line 48
    if-ge v0, v1, :cond_0

    .line 49
    .line 50
    const/4 v0, -0x1

    .line 51
    invoke-static {v3, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/y220;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 55
    .line 56
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/y220;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 60
    .line 61
    invoke-static {p0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    const/4 v0, 0x0

    .line 66
    invoke-static {v3, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Ll/y220;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 70
    .line 71
    const/4 v2, -0x2

    .line 72
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/y220;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 76
    .line 77
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public x(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Answer;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/y220;->f:Ll/l220;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/l220;->J(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/y220;->f:Ll/l220;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 16
    .line 17
    .line 18
    iput-boolean p2, p0, Ll/y220;->h:Z

    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Ll/y220;->d:Lv/VText;

    .line 23
    .line 24
    sget p2, Ll/dbc0;->u:I

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/y220;->d:Lv/VText;

    .line 30
    .line 31
    iget-object p2, p0, Ll/y220;->e:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    sget v0, Ll/c9c0;->c2:I

    .line 38
    .line 39
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/y220;->d:Lv/VText;

    .line 47
    .line 48
    const/4 p2, 0x1

    .line 49
    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0}, Ll/y220;->y()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y220;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    new-instance v1, Ll/r220;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/r220;-><init>(Ll/y220;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
