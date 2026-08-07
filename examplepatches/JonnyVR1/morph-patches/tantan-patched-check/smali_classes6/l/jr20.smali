.class public Ll/jr20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y0m;
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y0m;",
        "Ll/iam<",
        "Ll/uq20;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lcom/p1/mobile/putong/feed/newui/mediapicker/EditTextInScrollView;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroidx/recyclerview/widget/RecyclerView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lv/VText;

.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/xl80;

.field public k:Lcom/p1/mobile/putong/data/MessageLocation;

.field public l:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public m:Ll/l90;

.field public n:Lcom/p1/mobile/putong/app/PutongAct;

.field public o:Ll/uq20;

.field public p:Landroid/view/View$OnClickListener;

.field public q:Ll/f90;

.field public r:Lcom/p1/mobile/android/app/Dialog;

.field public s:Ll/qol$a;

.field public t:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
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
    iput-object v0, p0, Ll/jr20;->i:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ll/jr20$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/jr20$a;-><init>(Ll/jr20;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/jr20;->p:Landroid/view/View$OnClickListener;

    .line 17
    .line 18
    new-instance v0, Ll/jr20$b;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/jr20$b;-><init>(Ll/jr20;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/jr20;->s:Ll/qol$a;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Ll/jr20;->t:Z

    .line 27
    .line 28
    iput-object p1, p0, Ll/jr20;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic b(Ll/jr20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jr20;->w()V

    return-void
.end method

.method public static synthetic c(Ll/jr20;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jr20;->v(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/jr20;)Ll/xl80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jr20;->j:Ll/xl80;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/jr20;)Lcom/p1/mobile/putong/data/MessageLocation;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jr20;->k:Lcom/p1/mobile/putong/data/MessageLocation;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/jr20;)Ll/l90;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jr20;->m:Ll/l90;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/jr20;Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jr20;->k:Lcom/p1/mobile/putong/data/MessageLocation;

    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jr20;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/EditTextInScrollView;

    .line 2
    .line 3
    const/16 v1, 0xc8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/VEditText;->setMaxLength(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/zt40;->b()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/jr20;->e:Lv/VText;

    .line 15
    .line 16
    const/16 v0, 0x8

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v0, p0, Ll/jr20;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v1, Ll/lbc0;->g6:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/high16 v1, 0x41800000    # 16.0f

    .line 35
    .line 36
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/4 v3, 0x0

    .line 45
    invoke-virtual {v0, v3, v3, v2, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/jr20;->e:Lv/VText;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {p0, v0, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jr20;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jr20;->o:Ll/uq20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uq20;->o0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jr20;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jr20;->m:Ll/l90;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jr20;->m:Ll/l90;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e3;->destroy()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uq20;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jr20;->l(Ll/uq20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jr20;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/jr20;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kr20;->b(Ll/jr20;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final k()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/k;

    .line 2
    .line 3
    new-instance v1, Ll/jr20$d;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/jr20$d;-><init>(Ll/jr20;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/k;-><init>(Landroidx/recyclerview/widget/k$e;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/jr20;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/k;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public l(Ll/uq20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jr20;->o:Ll/uq20;

    .line 2
    .line 3
    return-void
.end method

.method public m()Lcom/p1/mobile/putong/data/MessageLocation;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jr20;->k:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jr20;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/EditTextInScrollView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jr20;->h:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jr20;->n()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    return p0
.end method

.method public s(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jr20;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/EditTextInScrollView;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jr20;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/EditTextInScrollView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/VEditText;->h()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/dr20;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/dr20;-><init>(Ll/jr20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/xl80;

    .line 20
    .line 21
    iget-object v1, p0, Ll/jr20;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-direct {v0, v1, p0, v3, v2}, Ll/xl80;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ll/y0m;ZLcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/jr20;->j:Ll/xl80;

    .line 29
    .line 30
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 31
    .line 32
    iget-object v1, p0, Ll/jr20;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 33
    .line 34
    const/4 v2, 0x3

    .line 35
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/jr20;->l:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 39
    .line 40
    iget-object v1, p0, Ll/jr20;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/jr20;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 46
    .line 47
    iget-object v1, p0, Ll/jr20;->j:Ll/xl80;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/jr20;->l:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 53
    .line 54
    iget-object v1, p0, Ll/jr20;->j:Ll/xl80;

    .line 55
    .line 56
    invoke-virtual {v1}, Ll/jic0;->getItemCount()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    sub-int/2addr v1, v3

    .line 61
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/jr20;->j:Ll/xl80;

    .line 65
    .line 66
    iget-object v1, p0, Ll/jr20;->o:Ll/uq20;

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/uq20;->f0()Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ll/xl80;->H(Ljava/util/ArrayList;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ll/l90;

    .line 76
    .line 77
    iget-object v1, p0, Ll/jr20;->s:Ll/qol$a;

    .line 78
    .line 79
    invoke-direct {v0, v1}, Ll/l90;-><init>(Ll/qol$a;)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Ll/jr20;->m:Ll/l90;

    .line 83
    .line 84
    iget-object v0, p0, Ll/jr20;->f:Lv/VText;

    .line 85
    .line 86
    iget-object v1, p0, Ll/jr20;->p:Landroid/view/View$OnClickListener;

    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/jr20;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/EditTextInScrollView;

    .line 92
    .line 93
    new-instance v1, Ll/jr20$c;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/jr20$c;-><init>(Ll/jr20;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Ll/jr20;->k()V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/jr20;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/EditTextInScrollView;

    .line 105
    .line 106
    new-instance v1, Ll/er20;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ll/er20;-><init>(Ll/jr20;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final synthetic v(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jr20;->o:Ll/uq20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uq20;->o0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic w()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jr20;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/EditTextInScrollView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jr20;->j:Ll/xl80;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Ll/xl80;->H(Ljava/util/ArrayList;)V

    .line 9
    .line 10
    .line 11
    :cond_1
    :goto_0
    return-void
.end method

.method public y(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jr20;->j:Ll/xl80;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0, p1}, Ll/xl80;->H(Ljava/util/ArrayList;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/jr20;->l:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 12
    .line 13
    iget-object p0, p0, Ll/jr20;->j:Ll/xl80;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    add-int/lit8 p0, p0, -0x1

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public z(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/jr20;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/EditTextInScrollView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/jr20;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/EditTextInScrollView;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
