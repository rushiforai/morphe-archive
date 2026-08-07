.class public Ll/nnk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nnk$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/jnk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VFrame;

.field public c:Lv/VFrame;

.field public d:Lv/VText;

.field public e:Lv/VFrame;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Ll/jnk;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nnk;->f:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/nnk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nnk;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/nnk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nnk;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/nnk;Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nnk;->p(Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/nnk;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nnk;->e:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic e(Ll/nnk;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nnk;->c:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic f(Ll/nnk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nnk;->d:Lv/VText;

    return-void
.end method

.method public static bridge synthetic i(Ll/nnk;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nnk;->b:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic j(Ll/nnk;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nnk;->a:Lv/VLinear;

    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnk;->g:Ll/jnk;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jnk;->r0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnk;->g:Ll/jnk;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jnk;->l0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nnk;->f:Lcom/p1/mobile/android/app/Act;

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
    check-cast p1, Ll/jnk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nnk;->l(Ll/jnk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nnk;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/nnk$a;->a(Ll/nnk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ll/jnk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nnk;->g:Ll/jnk;

    .line 2
    .line 3
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nnk;->b:Lv/VFrame;

    .line 2
    .line 3
    new-instance v1, Ll/knk;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/knk;-><init>(Ll/nnk;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/nnk;->c:Lv/VFrame;

    .line 12
    .line 13
    new-instance v1, Ll/lnk;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/lnk;-><init>(Ll/nnk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/nnk;->e:Lv/VFrame;

    .line 22
    .line 23
    new-instance v1, Ll/mnk;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/mnk;-><init>(Ll/nnk;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/nnk;->e:Lv/VFrame;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 38
    .line 39
    const-string v1, "noApplyRequired"

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Ll/nnk;->d:Lv/VText;

    .line 48
    .line 49
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->y0:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 56
    .line 57
    const-string v1, "applyRequired"

    .line 58
    .line 59
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    iget-object v0, p0, Ll/nnk;->d:Lv/VText;

    .line 66
    .line 67
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->z0:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 70
    .line 71
    .line 72
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/nnk;->c:Lv/VFrame;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 75
    .line 76
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Permissions;->canChangeJoinCondition:Z

    .line 77
    .line 78
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnk;->g:Ll/jnk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jnk;->m0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
