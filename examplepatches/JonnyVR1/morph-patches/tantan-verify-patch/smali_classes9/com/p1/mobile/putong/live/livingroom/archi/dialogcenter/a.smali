.class public Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
.super Landroidx/appcompat/app/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;,
        Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$a;,
        Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;
    }
.end annotation


# instance fields
.field public b:I

.field public c:I

.field public d:Landroid/view/View;

.field public e:I
    .annotation build Landroidx/annotation/LayoutRes;
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

.field public g:Landroid/content/DialogInterface$OnShowListener;

.field public h:Landroid/content/DialogInterface$OnDismissListener;

.field public i:Landroid/content/DialogInterface$OnShowListener;

.field public j:Landroid/content/DialogInterface$OnDismissListener;

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/jwl;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/jwl;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

.field public o:Ll/rq2;

.field public p:Landroid/view/View;

.field public q:Z

.field public r:Landroid/animation/ValueAnimator;

.field public s:Landroid/animation/ValueAnimator;

.field public t:Z

.field public u:Ll/x20;

.field public v:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 96
    sget v0, Ll/jgc0;->k:I

    invoke-direct {p0, p1, v0}, Landroidx/appcompat/app/a;-><init>(Landroid/content/Context;I)V

    const/16 v0, 0x11

    .line 97
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->b:I

    .line 98
    sget v0, Ll/jgc0;->h:I

    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c:I

    .line 99
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->UNKNOWN:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 100
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Ll/f5t;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    const/4 v0, 0x0

    .line 101
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->q:Z

    .line 102
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->t:Z

    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->v:Ll/y20;

    .line 104
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOwnerActivity(Landroid/app/Activity;)V

    .line 105
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->S()V

    return-void
.end method

.method public constructor <init>(Ll/xzs;III)V
    .locals 1
    .param p3    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param

    .line 83
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Landroidx/appcompat/app/a;-><init>(Landroid/content/Context;I)V

    const/16 p2, 0x11

    .line 84
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->b:I

    .line 85
    sget p2, Ll/jgc0;->h:I

    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c:I

    .line 86
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->UNKNOWN:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 87
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Ll/f5t;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    const/4 p2, 0x0

    .line 88
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->q:Z

    .line 89
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->t:Z

    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->v:Ll/y20;

    .line 91
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/app/Dialog;->setOwnerActivity(Landroid/app/Activity;)V

    .line 92
    invoke-virtual {p1}, Ll/xzs;->K2()Ll/t8s;

    move-result-object p1

    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    invoke-virtual {p1, p2}, Ll/t8s;->j(Ll/jwl;)V

    .line 93
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->e:I

    .line 94
    iput p4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->b:I

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->S()V

    return-void
.end method

.method public constructor <init>(Ll/xzs;ILandroid/view/View;I)V
    .locals 1

    .line 70
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Landroidx/appcompat/app/a;-><init>(Landroid/content/Context;I)V

    const/16 p2, 0x11

    .line 71
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->b:I

    .line 72
    sget p2, Ll/jgc0;->h:I

    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c:I

    .line 73
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->UNKNOWN:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 74
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Ll/f5t;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    const/4 p2, 0x0

    .line 75
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->q:Z

    .line 76
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->t:Z

    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->v:Ll/y20;

    .line 78
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/app/Dialog;->setOwnerActivity(Landroid/app/Activity;)V

    .line 79
    invoke-virtual {p1}, Ll/xzs;->K2()Ll/t8s;

    move-result-object p1

    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    invoke-virtual {p1, p2}, Ll/t8s;->j(Ll/jwl;)V

    .line 80
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 81
    iput p4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->b:I

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->S()V

    return-void
.end method

.method public constructor <init>(Ll/xzs;ILl/rq2;)V
    .locals 2
    .param p2    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p3}, Ll/rq2;->d()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-direct {p0, v0, v1}, Landroidx/appcompat/app/a;-><init>(Landroid/content/Context;I)V

    .line 10
    .line 11
    .line 12
    const/16 v0, 0x11

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->b:I

    .line 15
    .line 16
    sget v0, Ll/jgc0;->h:I

    .line 17
    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c:I

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->UNKNOWN:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Ll/f5t;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->q:Z

    .line 34
    .line 35
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->t:Z

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->v:Ll/y20;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOwnerActivity(Landroid/app/Activity;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Ll/xzs;->K2()Ll/t8s;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ll/t8s;->j(Ll/jwl;)V

    .line 53
    .line 54
    .line 55
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 56
    .line 57
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->e:I

    .line 58
    .line 59
    invoke-virtual {p3}, Ll/rq2;->f()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->b:I

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->S()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public constructor <init>(Ll/xzs;Landroid/view/View;I)V
    .locals 1

    .line 69
    sget v0, Ll/jgc0;->k:I

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;-><init>(Ll/xzs;ILandroid/view/View;I)V

    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->b0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic C(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public static synthetic D(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->T()V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->W()V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    return-object p0
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->b:I

    return p0
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)Landroid/content/DialogInterface$OnDismissListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j:Landroid/content/DialogInterface$OnDismissListener;

    return-object p0
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)Landroid/content/DialogInterface$OnShowListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->i:Landroid/content/DialogInterface$OnShowListener;

    return-object p0
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)Landroid/content/DialogInterface$OnDismissListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->h:Landroid/content/DialogInterface$OnDismissListener;

    return-object p0
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)Landroid/content/DialogInterface$OnShowListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->g:Landroid/content/DialogInterface$OnShowListener;

    return-object p0
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j:Landroid/content/DialogInterface$OnDismissListener;

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/content/DialogInterface$OnShowListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->i:Landroid/content/DialogInterface$OnShowListener;

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->V()V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->U(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->Y()V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->a0()V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->X(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic z(Landroid/view/View;Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 3

    .line 1
    invoke-static {}, Ll/dgq0$l;->d()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p2, p1}, Ll/dgq0;->f(I)Ll/svm;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget p1, p1, Ll/svm;->d:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 24
    .line 25
    .line 26
    return-object p2
.end method


# virtual methods
.method public final O()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->k0(Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final P(Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->k0(Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Q(Landroid/view/View;)V
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-le v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, v2}, Landroid/view/View;->setFitsSystemWindows(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const v0, 0x10100dd

    .line 13
    .line 14
    .line 15
    filled-new-array {v0}, [I

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, v2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->setFitsSystemWindows(Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public R()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final S()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 7
    .line 8
    .line 9
    invoke-super {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic T()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic U(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x4

    .line 2
    if-ne p2, p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;->o()V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final synthetic V()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->q:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->q:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getOwnerActivity()Landroid/app/Activity;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Dialog;->getOwnerActivity()Landroid/app/Activity;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Dialog;->getOwnerActivity()Landroid/app/Activity;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->u:Ll/x20;

    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-interface {p0}, Ll/x20;->call()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public final synthetic X(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rq2;->a()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->t:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/rq2;->a()F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    const/high16 v1, 0x437f0000    # 255.0f

    .line 25
    .line 26
    mul-float/2addr p0, v1

    .line 27
    const/high16 v1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    sub-float/2addr v1, p1

    .line 34
    mul-float/2addr p0, v1

    .line 35
    float-to-int p0, p0

    .line 36
    const/4 p1, 0x0

    .line 37
    invoke-static {p0, p1, p1, p1}, Landroid/graphics/Color;->argb(IIII)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public final synthetic Y()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->q:Z

    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/rq2;->g()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->k0(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic a0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->q:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->v:Ll/y20;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->p:Landroid/view/View;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 14
    .line 15
    new-instance v1, Ll/u4t;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/u4t;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic b0(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rq2;->a()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/rq2;->a()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/high16 v1, 0x437f0000    # 255.0f

    .line 21
    .line 22
    mul-float/2addr p0, v1

    .line 23
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    mul-float/2addr p0, p1

    .line 28
    float-to-int p0, p0

    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-static {p0, p1, p1, p1}, Landroid/graphics/Color;->argb(IIII)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public c0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public d0(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p1, Ll/v4t;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/v4t;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->l:Ll/y20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->r:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->s:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 22
    .line 23
    .line 24
    :cond_2
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public e0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public f0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;

    .line 2
    .line 3
    return-void
.end method

.method public g0(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->v:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public h0(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->m:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public i0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->t:Z

    .line 2
    .line 3
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->f:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 2
    .line 3
    return-void
.end method

.method public k0(Ll/x20;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->u:Ll/x20;

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->q:Z

    .line 4
    .line 5
    if-nez p1, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->s:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->p:Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ll/rq2;->b(Landroid/view/View;)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->s:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    new-instance v0, Ll/z4t;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/z4t;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/a5t;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/a5t;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v0, v1}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->s:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    new-instance v0, Ll/b5t;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/b5t;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->s:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_0
    return-void
.end method

.method public final l0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->r:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->p:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/rq2;->c(Landroid/view/View;)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->r:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    new-instance v1, Ll/c5t;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/c5t;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/d5t;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/d5t;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1, v2}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->r:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    new-instance v1, Ll/e5t;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/e5t;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->r:Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onBackPressed()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;->o()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/t4t;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/t4t;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v2, 0x32

    .line 18
    .line 19
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ResourceAsColor"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 5
    .line 6
    const/16 v0, 0x22

    .line 7
    .line 8
    if-nez p1, :cond_3

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 19
    .line 20
    if-le v1, v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/app/Dialog;->getOwnerActivity()Landroid/app/Activity;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/app/Dialog;->getOwnerActivity()Landroid/app/Activity;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    instance-of v1, v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/app/Dialog;->getOwnerActivity()Landroid/app/Activity;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    sget v3, Ll/yec0;->t0:I

    .line 58
    .line 59
    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 64
    .line 65
    check-cast v1, Landroid/view/ViewGroup;

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Landroid/view/ViewGroup;

    .line 73
    .line 74
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 82
    .line 83
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->b:I

    .line 84
    .line 85
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 86
    .line 87
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->e:I

    .line 88
    .line 89
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 90
    .line 91
    check-cast v4, Landroid/view/ViewGroup;

    .line 92
    .line 93
    invoke-virtual {p1, v3, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->p:Landroid/view/View;

    .line 98
    .line 99
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 103
    .line 104
    invoke-virtual {p1}, Ll/rq2;->h()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_1

    .line 109
    .line 110
    new-instance p1, Ll/w4t;

    .line 111
    .line 112
    invoke-direct {p1, p0}, Ll/w4t;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 116
    .line 117
    .line 118
    :cond_1
    new-instance p1, Ll/x4t;

    .line 119
    .line 120
    invoke-direct {p1}, Ll/x4t;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->e:I

    .line 128
    .line 129
    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 134
    .line 135
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->m:Ll/y20;

    .line 136
    .line 137
    if-eqz p1, :cond_5

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 140
    .line 141
    if-eqz v1, :cond_4

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->p:Landroid/view/View;

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 147
    .line 148
    :goto_1
    invoke-interface {p1, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->Q(Landroid/view/View;)V

    .line 154
    .line 155
    .line 156
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 157
    .line 158
    if-le p1, v0, :cond_6

    .line 159
    .line 160
    const p1, 0x1020002

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 168
    .line 169
    new-instance v0, Ll/y4t;

    .line 170
    .line 171
    invoke-direct {v0, p1}, Ll/y4t;-><init>(Landroid/view/View;)V

    .line 172
    .line 173
    .line 174
    invoke-static {p0, v0}, Ll/kkl0;->y0(Landroid/view/View;Ll/il50;)V

    .line 175
    .line 176
    .line 177
    :cond_6
    return-void
.end method

.method public onStart()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, -0x1

    .line 13
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 14
    .line 15
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    const/high16 v1, 0x4000000

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 23
    .line 24
    .line 25
    const/high16 v1, 0x20000

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/16 v2, 0x400

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 37
    .line 38
    .line 39
    const/high16 v1, -0x80000000

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 42
    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 49
    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c:I

    .line 54
    .line 55
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    invoke-virtual {v1}, Ll/rq2;->e()Ll/y20;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    if-eqz v1, :cond_1

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 69
    .line 70
    invoke-virtual {v1}, Ll/rq2;->e()Ll/y20;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-interface {v1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->d:Landroid/view/View;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 0
    .param p1    # Landroid/content/DialogInterface$OnDismissListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->h:Landroid/content/DialogInterface$OnDismissListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V
    .locals 0
    .param p1    # Landroid/content/DialogInterface$OnShowListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->g:Landroid/content/DialogInterface$OnShowListener;

    .line 2
    .line 3
    return-void
.end method

.method public show()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->k:Ll/y20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->n:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$b;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->o:Ll/rq2;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->l0()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method
