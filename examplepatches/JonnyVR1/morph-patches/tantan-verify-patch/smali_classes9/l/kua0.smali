.class public Ll/kua0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kua0$c;,
        Ll/kua0$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/fua0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRelative;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Lv/VEditText;

.field public f:Lv/VImage;

.field public g:Lv/VRecyclerView;

.field public h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public final i:Landroid/content/Context;

.field public final j:Lcom/p1/mobile/putong/core/ui/profile/loop/school/ProfileLoopSelectSchoolFrag;

.field public k:Ll/fua0;

.field public l:Ll/kua0$d;

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public n:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/school/ProfileLoopSelectSchoolFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/kua0;->m:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/kua0;->n:Z

    .line 13
    .line 14
    iput-object p1, p0, Ll/kua0;->i:Landroid/content/Context;

    .line 15
    .line 16
    iput-object p2, p0, Ll/kua0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/school/ProfileLoopSelectSchoolFrag;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/kua0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kua0;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/kua0;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kua0;->I(Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c(Ll/kua0;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kua0;->F(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic d(Ll/kua0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kua0;->H()V

    return-void
.end method

.method public static bridge synthetic e(Ll/kua0;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kua0;->f:Lv/VImage;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/kua0;)Lv/VEditText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kua0;->e:Lv/VEditText;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/kua0;)Ll/kua0$d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kua0;->l:Ll/kua0$d;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/kua0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kua0;->m:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/kua0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kua0;->n:Z

    return p0
.end method

.method public static bridge synthetic l(Ll/kua0;)Ll/fua0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kua0;->k:Ll/fua0;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/kua0;Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kua0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    return-void
.end method

.method public static bridge synthetic n(Ll/kua0;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kua0;->f:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic p(Ll/kua0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kua0;->b:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic q(Ll/kua0;Landroid/widget/RelativeLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kua0;->d:Landroid/widget/RelativeLayout;

    return-void
.end method

.method public static bridge synthetic s(Ll/kua0;Lv/VEditText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kua0;->e:Lv/VEditText;

    return-void
.end method

.method public static bridge synthetic u(Ll/kua0;Lv/VRelative;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kua0;->a:Lv/VRelative;

    return-void
.end method

.method public static bridge synthetic v(Ll/kua0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kua0;->c:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic w(Ll/kua0;Lv/VRecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kua0;->g:Lv/VRecyclerView;

    return-void
.end method

.method public static bridge synthetic x(Ll/kua0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kua0;->E(I)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SCHOOL_NEW:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    iget-object p0, p0, Ll/kua0;->e:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x0

    .line 14
    const-string v2, ""

    .line 15
    .line 16
    invoke-static {p1, v0, v2, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->l(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/lang/String;Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public B()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kua0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/school/ProfileLoopSelectSchoolFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public C()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kua0;->i:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kua0;->i:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kua0;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/kua0;->e:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/kua0;->l:Ll/kua0$d;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/kua0$d;->G(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/kua0;->e:Lv/VEditText;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/kua0;->e:Lv/VEditText;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-virtual {p0, p1}, Ll/kua0;->K(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ll/kua0;->J(Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic F(Landroid/view/View;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kua0;->e:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/kua0;->n:Z

    .line 3
    .line 4
    iget-object p1, p0, Ll/kua0;->e:Lv/VEditText;

    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/kua0;->f:Lv/VImage;

    .line 12
    .line 13
    const/16 v0, 0x8

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Ll/kua0;->K(Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/kua0;->e:Lv/VEditText;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic H()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kua0;->e:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/kua0;->C()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/kua0;->e:Lv/VEditText;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic I(Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/kua0;->n:Z

    .line 6
    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v1, 0x22

    .line 10
    .line 11
    if-le v0, v1, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Ll/kua0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public final J(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kua0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/kua0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/kua0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 20
    .line 21
    sget p1, Ll/kbc0;->f:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 28
    .line 29
    sget p1, Ll/kbc0;->r1:I

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public K(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kua0;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iput-object p1, p0, Ll/kua0;->m:Ljava/util/List;

    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Ll/kua0;->J(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/kua0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object p1, p0, Ll/kua0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 32
    .line 33
    const/16 v0, 0x8

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object p0, p0, Ll/kua0;->l:Ll/kua0$d;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public L(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/kua0;->b:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->n1:I

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v0, p0, Ll/kua0;->e:Lv/VEditText;

    .line 27
    .line 28
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v2, " "

    .line 31
    .line 32
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 46
    .line 47
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const/4 v1, 0x1

    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-direct {p1, v0, v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/kua0;->g:Lv/VRecyclerView;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/kua0;->g:Lv/VRecyclerView;

    .line 62
    .line 63
    invoke-virtual {p1, v2}, Landroid/view/View;->setOverScrollMode(I)V

    .line 64
    .line 65
    .line 66
    new-instance p1, Ll/kua0$d;

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-direct {p1, p0, v0}, Ll/kua0$d;-><init>(Ll/kua0;Ll/mua0;)V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Ll/kua0;->l:Ll/kua0$d;

    .line 73
    .line 74
    iget-object v0, p0, Ll/kua0;->g:Lv/VRecyclerView;

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/kua0;->g:Lv/VRecyclerView;

    .line 80
    .line 81
    new-instance v0, Ll/kua0$a;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/kua0$a;-><init>(Ll/kua0;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ll/kua0;->C()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 102
    .line 103
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 104
    .line 105
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_1

    .line 112
    .line 113
    iget-object v0, p0, Ll/kua0;->e:Lv/VEditText;

    .line 114
    .line 115
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/kua0;->e:Lv/VEditText;

    .line 119
    .line 120
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, v1}, Ll/kua0;->J(Z)V

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_1
    invoke-virtual {p0, v2}, Ll/kua0;->J(Z)V

    .line 132
    .line 133
    .line 134
    :goto_0
    iget-object p1, p0, Ll/kua0;->e:Lv/VEditText;

    .line 135
    .line 136
    new-instance v0, Ll/gua0;

    .line 137
    .line 138
    invoke-direct {v0, p0}, Ll/gua0;-><init>(Ll/kua0;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Ll/kua0;->e:Lv/VEditText;

    .line 145
    .line 146
    new-instance v0, Ll/kua0$b;

    .line 147
    .line 148
    invoke-direct {v0, p0}, Ll/kua0$b;-><init>(Ll/kua0;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Ll/kua0;->f:Lv/VImage;

    .line 155
    .line 156
    new-instance v0, Ll/hua0;

    .line 157
    .line 158
    invoke-direct {v0, p0}, Ll/hua0;-><init>(Ll/kua0;)V

    .line 159
    .line 160
    .line 161
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/kua0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/school/ProfileLoopSelectSchoolFrag;

    .line 165
    .line 166
    new-instance v0, Ll/iua0;

    .line 167
    .line 168
    invoke-direct {v0, p0}, Ll/iua0;-><init>(Ll/kua0;)V

    .line 169
    .line 170
    .line 171
    const-wide/16 v3, 0x12c

    .line 172
    .line 173
    invoke-static {p1, v0, v3, v4}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0}, Ll/kua0;->C()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    new-instance v0, Landroid/view/View;

    .line 181
    .line 182
    invoke-virtual {p0}, Ll/kua0;->C()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 183
    .line 184
    .line 185
    move-result-object v3

    .line 186
    invoke-direct {v0, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 187
    .line 188
    .line 189
    iget-object v3, p0, Ll/kua0;->a:Lv/VRelative;

    .line 190
    .line 191
    new-instance v4, Ll/jua0;

    .line 192
    .line 193
    invoke-direct {v4, p0}, Ll/jua0;-><init>(Ll/kua0;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1, v0, v3, v4}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    iget-object p1, p0, Ll/kua0;->h:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 200
    .line 201
    iget-object v0, p0, Ll/kua0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/school/ProfileLoopSelectSchoolFrag;

    .line 202
    .line 203
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0}, Ll/kua0;->C()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    iget-object v0, p0, Ll/kua0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/school/ProfileLoopSelectSchoolFrag;

    .line 215
    .line 216
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 217
    .line 218
    .line 219
    invoke-static {}, Ll/xra;->f()Z

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    if-eqz p1, :cond_2

    .line 224
    .line 225
    iget-object p1, p0, Ll/kua0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/school/ProfileLoopSelectSchoolFrag;

    .line 226
    .line 227
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->U4()Z

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    if-eqz p1, :cond_2

    .line 232
    .line 233
    iget-object p1, p0, Ll/kua0;->j:Lcom/p1/mobile/putong/core/ui/profile/loop/school/ProfileLoopSelectSchoolFrag;

    .line 234
    .line 235
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 236
    .line 237
    invoke-static {p1}, Ll/tr90;->m(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    iget-object v0, p0, Ll/kua0;->b:Landroid/widget/TextView;

    .line 242
    .line 243
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 244
    .line 245
    .line 246
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    if-nez v0, :cond_2

    .line 251
    .line 252
    iget-object v0, p0, Ll/kua0;->c:Landroid/widget/TextView;

    .line 253
    .line 254
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 255
    .line 256
    .line 257
    iget-object v0, p0, Ll/kua0;->c:Landroid/widget/TextView;

    .line 258
    .line 259
    const/high16 v1, 0x41400000    # 12.0f

    .line 260
    .line 261
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 266
    .line 267
    .line 268
    iget-object v0, p0, Ll/kua0;->d:Landroid/widget/RelativeLayout;

    .line 269
    .line 270
    const/high16 v1, 0x41a00000    # 20.0f

    .line 271
    .line 272
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, Ll/kua0;->c:Landroid/widget/TextView;

    .line 280
    .line 281
    const/high16 v1, 0x41700000    # 15.0f

    .line 282
    .line 283
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 284
    .line 285
    .line 286
    iget-object v0, p0, Ll/kua0;->c:Landroid/widget/TextView;

    .line 287
    .line 288
    const-string v1, "#a9a9a9"

    .line 289
    .line 290
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 295
    .line 296
    .line 297
    iget-object p0, p0, Ll/kua0;->c:Landroid/widget/TextView;

    .line 298
    .line 299
    const-string v0, "\u9884\u8ba1\u7b26\u5408%s\u4eba\u7684\u7406\u60f3\u578b"

    .line 300
    .line 301
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 310
    .line 311
    .line 312
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/kua0;->C()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->clearUpKeyboardListenerAndResizeChildOfContent()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fua0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kua0;->z(Ll/fua0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kua0;->y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kua0$c;->a(Ll/kua0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public z(Ll/fua0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kua0;->k:Ll/fua0;

    .line 2
    .line 3
    return-void
.end method
