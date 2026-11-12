.class public final Lm7d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpvk;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lwt3;

.field public final c:Lwv1;

.field public d:Li7d;

.field public e:B


# direct methods
.method public constructor <init>(Landroid/content/Context;Lwt3;Lwv1;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm7d;->a:Landroid/content/Context;

    iput-object p2, p0, Lm7d;->b:Lwt3;

    iput-object p3, p0, Lm7d;->c:Lwv1;

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 2

    const/4 p0, 0x1

    if-ne p1, p0, :cond_4

    return p0

    :cond_4
    const/4 p0, 0x0

    return p0
.end method

.method public final b(IIIIII)V
    .registers 7

    iget-object p1, p0, Lm7d;->d:Li7d;

    if-eqz p1, :cond_5b

    iget-object p1, p0, Lm7d;->a:Landroid/content/Context;

    invoke-static {p1}, Lcom/opera/android/utilities/DisplayUtil;->b(Landroid/content/Context;)I

    move-result p3

    sub-int/2addr p3, p2

    int-to-float p3, p3

    invoke-static {p1}, Lcom/opera/android/utilities/DisplayUtil;->b(Landroid/content/Context;)I

    move-result p4

    int-to-float p4, p4

    const p5, 0x3f2aaaab

    mul-float/2addr p4, p5

    cmpl-float p4, p3, p4

    const/4 p5, 0x1

    if-ltz p4, :cond_1c

    const/4 p1, 0x2

    goto :goto_2c

    :cond_1c
    invoke-static {p1}, Lcom/opera/android/utilities/DisplayUtil;->b(Landroid/content/Context;)I

    move-result p1

    int-to-float p1, p1

    const p4, 0x3e4ccccd    # 0.2f

    mul-float/2addr p1, p4

    cmpl-float p1, p3, p1

    if-ltz p1, :cond_2b

    move p1, p5

    goto :goto_2c

    :cond_2b
    const/4 p1, 0x0

    :goto_2c
    iput-byte p1, p0, Lm7d;->e:B

    iget-object p0, p0, Lm7d;->d:Li7d;

    if-eqz p0, :cond_5b

    iget-object p0, p0, Li7d;->k:Lvl6;

    if-eqz p0, :cond_5b

    iget-object p0, p0, Lvl6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    iget-object p1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->y:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_5b

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    if-eqz p1, :cond_5b

    iget-object p3, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->r:Lx5n;

    if-eqz p3, :cond_5b

    invoke-virtual {p0, p5}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J(I)V

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p3

    sub-int p3, p2, p3

    sget-object p4, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p3}, Landroid/view/View;->offsetTopAndBottom(I)V

    invoke-virtual {p0, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A(I)V

    :cond_5b
    return-void
.end method

.method public final c(IIIIII)V
    .registers 7

    invoke-static {p6}, Ljava/lang/Math;->abs(I)I

    move-result p1

    const/16 p3, 0x3e8

    if-ge p1, p3, :cond_9

    return-void

    :cond_9
    if-lez p6, :cond_f

    const/4 p1, 0x0

    iput-byte p1, p0, Lm7d;->e:B

    return-void

    :cond_f
    neg-int p1, p6

    const/16 p3, 0xbb8

    const/4 p4, 0x2

    if-le p1, p3, :cond_18

    iput-byte p4, p0, Lm7d;->e:B

    return-void

    :cond_18
    iget-object p1, p0, Lm7d;->a:Landroid/content/Context;

    invoke-static {p1}, Lcom/opera/android/utilities/DisplayUtil;->b(Landroid/content/Context;)I

    move-result p3

    sub-int/2addr p3, p2

    int-to-float p2, p3

    invoke-static {p1}, Lcom/opera/android/utilities/DisplayUtil;->b(Landroid/content/Context;)I

    move-result p1

    int-to-float p1, p1

    const p3, 0x3f2aaaab

    mul-float/2addr p1, p3

    cmpl-float p1, p2, p1

    if-ltz p1, :cond_30

    iput-byte p4, p0, Lm7d;->e:B

    return-void

    :cond_30
    const/4 p1, 0x1

    iput-byte p1, p0, Lm7d;->e:B

    return-void
.end method

.method public final d()V
    .registers 4

    iget-object v0, p0, Lm7d;->d:Li7d;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v1, Ll7d;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ll7d;-><init>(Lm7d;B)V

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public final e(III)V
    .registers 4

    iget-object p1, p0, Lm7d;->d:Li7d;

    if-eqz p1, :cond_5

    return-void

    :cond_5
    iget-object p1, p0, Lm7d;->b:Lwt3;

    invoke-virtual {p1}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Li7d;

    iput-object p1, p0, Lm7d;->d:Li7d;

    const/4 p2, 0x0

    iput-byte p2, p0, Lm7d;->e:B

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p1

    new-instance p3, Ll7d;

    invoke-direct {p3, p0, p2}, Ll7d;-><init>(Lm7d;B)V

    invoke-virtual {p1, p3}, Ltcc;->a(Lmdc;)V

    iget-object p1, p0, Lm7d;->d:Li7d;

    invoke-static {p1, p2}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lm7d;->a:Landroid/content/Context;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method
