.class public Ll/gsa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/gsa0$b;,
        Ll/gsa0$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/fsa0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Lv/VList;

.field public c:Landroid/widget/TextView;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopQuestionAct;

.field public e:Ll/fsa0;

.field public f:Ll/gsa0$b;

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopQuestionAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopQuestionAct;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Ll/gsa0;)Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopQuestionAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopQuestionAct;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/gsa0;)Ll/fsa0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gsa0;->e:Ll/fsa0;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopQuestionAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hsa0;->b(Ll/gsa0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/fsa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gsa0;->e:Ll/fsa0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gsa0;->f:Ll/gsa0$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gsa0$b;->b(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gsa0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gsa0;->b:Lv/VList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/gsa0;->c:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fsa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gsa0;->d(Ll/fsa0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gsa0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gsa0;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/gsa0;->a:Landroid/widget/TextView;

    .line 10
    .line 11
    iget-object v1, p0, Ll/gsa0;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/gsa0;->a:Landroid/widget/TextView;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    new-instance v0, Ll/gsa0$b;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/gsa0$b;-><init>(Ll/gsa0;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/gsa0;->f:Ll/gsa0$b;

    .line 28
    .line 29
    iget-object v1, p0, Ll/gsa0;->b:Lv/VList;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/gsa0;->b:Lv/VList;

    .line 35
    .line 36
    new-instance v1, Ll/gsa0$a;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/gsa0$a;-><init>(Ll/gsa0;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/gsa0;->b:Lv/VList;

    .line 45
    .line 46
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/xra;->w()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v1, p0, Ll/gsa0;->b:Lv/VList;

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    sget v0, Ll/qa00;->y:I

    .line 64
    .line 65
    invoke-static {v1, v0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/gsa0;->b:Lv/VList;

    .line 69
    .line 70
    sget v0, Ll/qa00;->j:I

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    sget v0, Ll/qa00;->m:I

    .line 77
    .line 78
    invoke-static {v1, v0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/gsa0;->b:Lv/VList;

    .line 82
    .line 83
    invoke-virtual {p0, v2}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
