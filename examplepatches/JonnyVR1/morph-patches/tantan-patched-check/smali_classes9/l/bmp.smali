.class public Ll/bmp;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bmp$e;,
        Ll/bmp$f;
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/AutoVDraweeView;

.field public c:Lv/AutoVDraweeView;

.field public d:Landroid/widget/FrameLayout;

.field public e:Landroid/widget/LinearLayout;

.field public f:Ll/pej0;

.field public final g:Lcom/p1/mobile/android/app/Act;

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/l4g0;

.field public m:Ll/x20;

.field public n:Ll/x20;

.field public o:Z

.field public p:Ll/ylp;

.field public q:Ll/fmp;

.field public r:Z

.field public s:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final t:Landroid/content/DialogInterface$OnDismissListener;

.field public final u:Landroid/content/DialogInterface$OnCancelListener;

.field public final v:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/bmp;->o:Z

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    iput-object v0, p0, Ll/bmp;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    new-instance v0, Ll/bmp$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/bmp$a;-><init>(Ll/bmp;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/bmp;->t:Landroid/content/DialogInterface$OnDismissListener;

    .line 17
    .line 18
    new-instance v0, Ll/bmp$b;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/bmp$b;-><init>(Ll/bmp;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/bmp;->u:Landroid/content/DialogInterface$OnCancelListener;

    .line 24
    .line 25
    new-instance v0, Ll/amp;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/amp;-><init>(Ll/bmp;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/bmp;->v:Ll/y20;

    .line 31
    .line 32
    iput-object p1, p0, Ll/bmp;->g:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    return-void
.end method

.method public static synthetic a(Ll/bmp;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bmp;->n(Ljava/lang/Integer;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/bmp;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmp;->m:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/bmp;)Landroid/content/DialogInterface$OnCancelListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmp;->u:Landroid/content/DialogInterface$OnCancelListener;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/bmp;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmp;->n:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/bmp;)Landroid/content/DialogInterface$OnDismissListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmp;->t:Landroid/content/DialogInterface$OnDismissListener;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/bmp;)Ll/l4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmp;->l:Ll/l4g0;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/bmp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bmp;->t(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic h(Ll/bmp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bmp;->A()V

    return-void
.end method


# virtual methods
.method public final A()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bmp;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Ll/pej0;

    .line 11
    .line 12
    iget-object v1, p0, Ll/bmp;->g:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    sget v2, Ll/dgc0;->g:I

    .line 15
    .line 16
    invoke-direct {v0, v1, v2}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/bmp;->f:Ll/pej0;

    .line 20
    .line 21
    sget v0, Ll/rec0;->d3:I

    .line 22
    .line 23
    iget-object v1, p0, Ll/bmp;->g:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-virtual {v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/bmp;->i(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/bmp;->f:Ll/pej0;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/bmp$e;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/bmp$e;-><init>(Ll/bmp;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/bmp;->f:Ll/pej0;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Ll/bmp;->f:Ll/pej0;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/bmp;->m()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput-boolean v0, p0, Ll/bmp;->r:Z

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string v1, "p_select_upgrade_duration_pop"

    .line 72
    .line 73
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Ll/bmp;->l:Ll/l4g0;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/bmp;->o()V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/bmp;->f:Ll/pej0;

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/bmp;->q()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final B(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bmp;->l:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bmp;->q:Ll/fmp;

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
    iget-object p0, p0, Ll/bmp;->q:Ll/fmp;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/fmp;->c()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cmp;->a(Ll/bmp;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bmp;->f:Ll/pej0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/bmp;->f:Ll/pej0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final k()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bmp;->f:Ll/pej0;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const v1, 0x1020002

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/fdc0;->y:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/widget/FrameLayout;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setHideable(Z)V

    .line 34
    .line 35
    .line 36
    const/4 v1, 0x3

    .line 37
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/bmp;->a:Lv/VFrame;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/bmp$c;

    .line 47
    .line 48
    invoke-direct {v2, p0, v0}, Ll/bmp$c;-><init>(Ll/bmp;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public l()Ll/pej0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmp;->f:Ll/pej0;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x500

    .line 6
    .line 7
    if-gt p0, v0, :cond_0

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

.method public final synthetic n(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bmp;->f:Ll/pej0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, -0x1

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/bmp;->f:Ll/pej0;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Dialog;->hide()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x2

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-ne v0, v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v0, 0x1

    .line 41
    if-ne p1, v0, :cond_4

    .line 42
    .line 43
    iget-object p0, p0, Ll/bmp;->f:Ll/pej0;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-ne p1, v1, :cond_3

    .line 54
    .line 55
    const/4 p1, 0x0

    .line 56
    invoke-virtual {p0, p1}, Ll/bmp;->y(Z)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object p0, p0, Ll/bmp;->f:Ll/pej0;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 62
    .line 63
    .line 64
    :cond_4
    return-void
.end method

.method public final o()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bmp;->b:Lv/AutoVDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/bmp;->c:Lv/AutoVDraweeView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Ll/bmp$d;->a:[I

    .line 13
    .line 14
    iget-object v2, p0, Ll/bmp;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    aget v0, v0, v2

    .line 21
    .line 22
    const-string v2, ""

    .line 23
    .line 24
    if-eq v0, v1, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    if-eq v0, v1, :cond_0

    .line 28
    .line 29
    move-object v0, v2

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    iget-boolean v0, p0, Ll/bmp;->i:Z

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjM1NkU0NUNEMDU2MzRGODdBQzgxQUNFMDQ5MjRFNjM5IiwidyI6NzUwLCJoIjoxMjY0LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MCwicHQiOjIwMjUwODE4MTd9.png"

    .line 36
    .line 37
    :goto_0
    move-object v3, v2

    .line 38
    move-object v2, v0

    .line 39
    move-object v0, v3

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iget-object v0, p0, Ll/bmp;->b:Lv/AutoVDraweeView;

    .line 42
    .line 43
    sget v1, Ll/jbc0;->C2:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 46
    .line 47
    .line 48
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkI5RTc1OUUwMDhDNTQ1QTE5RjM5MDJDQjQyODc4NDI5IiwidyI6NzUwLCJoIjo4MDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMjM3MDE3NzkwLCJwdCI6MjAyNTA4MTgxN30.png"

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    iget-boolean v0, p0, Ll/bmp;->i:Z

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjNCQTY4MzM3OUY3QzQxNTA5ODg2MTIwNzQ2MDhEMkUwIiwidyI6NzUwLCJoIjoxMjY0LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NDI5NDk2NzM2MCwicHQiOjIwMjUwODE4MTd9.png"

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    iget-object v0, p0, Ll/bmp;->b:Lv/AutoVDraweeView;

    .line 59
    .line 60
    sget v1, Ll/jbc0;->C2:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 63
    .line 64
    .line 65
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkQ2MUE2MTkzNzIwRDQ5RERBMEM3MEMwQ0FEMDRCMTIyIiwidyI6NzUwLCJoIjo4MDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3ODMsInB0IjoyMDI1MDgxODE3fQ.png"

    .line 66
    .line 67
    :goto_1
    iget-object v1, p0, Ll/bmp;->b:Lv/AutoVDraweeView;

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Ll/bmp;->c:Lv/AutoVDraweeView;

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/bmp;->p()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/bmp;->r()V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final p()V
    .locals 5

    .line 1
    new-instance v0, Ll/ylp;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bmp;->g:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/ylp;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/bmp;->p:Ll/ylp;

    .line 9
    .line 10
    iget-object v1, p0, Ll/bmp;->g:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iget-object v2, p0, Ll/bmp;->d:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Ll/ylp;->c(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Ll/bmp;->p:Ll/ylp;

    .line 25
    .line 26
    iget-object v2, p0, Ll/bmp;->v:Ll/y20;

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ll/ylp;->f(Ll/y20;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/bmp;->p:Ll/ylp;

    .line 32
    .line 33
    iget-object v2, p0, Ll/bmp;->g:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    iget-object v3, p0, Ll/bmp;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    iget-boolean v4, p0, Ll/bmp;->i:Z

    .line 38
    .line 39
    invoke-virtual {v1, v2, v3, v4}, Ll/ylp;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 43
    .line 44
    const/4 v2, -0x1

    .line 45
    const/4 v3, -0x2

    .line 46
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/bmp;->d:Landroid/widget/FrameLayout;

    .line 50
    .line 51
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public final q()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bmp;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/bmp;->j:Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/bmp;->B(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/bmp;->j:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/bmp;->q:Ll/fmp;

    .line 24
    .line 25
    iget-object v1, p0, Ll/bmp;->j:Ljava/util/List;

    .line 26
    .line 27
    iget-object v2, p0, Ll/bmp;->k:Ll/z20;

    .line 28
    .line 29
    iget-object v3, p0, Ll/bmp;->v:Ll/y20;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, v3}, Ll/fmp;->d(Ljava/util/List;Ll/z20;Ll/y20;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/bmp;->k()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final r()V
    .locals 4

    .line 1
    new-instance v0, Ll/fmp;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bmp;->g:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/bmp;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    iget-boolean v3, p0, Ll/bmp;->i:Z

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3}, Ll/fmp;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/bmp;->q:Ll/fmp;

    .line 13
    .line 14
    iget-object v1, p0, Ll/bmp;->e:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    iget-boolean v2, p0, Ll/bmp;->r:Z

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Ll/fmp;->b(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 29
    .line 30
    const/4 v2, -0x1

    .line 31
    const/4 v3, -0x2

    .line 32
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/bmp;->e:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public s(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bmp;->k:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public final t(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bmp;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bmp;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public v(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bmp;->m:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public w(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bmp;->n:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public x(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bmp;->j:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public y(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bmp;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bmp;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-void
.end method
