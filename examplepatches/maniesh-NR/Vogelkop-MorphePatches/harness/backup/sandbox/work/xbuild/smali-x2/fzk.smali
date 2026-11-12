.class public final Lfzk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic e:[Lxtb;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Lqwe;

.field public final c:Lfz2;

.field public final d:Lmcj;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpee;

    const-class v1, Lfzk;

    const-string v2, "bgColor"

    const-string v3, "getBgColor()Lcom/opera/android/ResColor;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lfzk;->e:[Lxtb;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Landroid/view/Window;Lqwe;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfzk;->a:Landroid/view/View;

    iput-object p3, p0, Lfzk;->b:Lqwe;

    new-instance v0, Ldxh;

    const v1, 0x7f0402ed

    invoke-direct {v0, v1}, Ldxh;-><init>(I)V

    new-instance v1, Lfz2;

    const/4 v2, 0x7

    invoke-direct {v1, v0, p0, v2}, Lfz2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lfzk;->c:Lfz2;

    new-instance v0, Lmcj;

    invoke-direct {v0, p2}, Lmcj;-><init>(Landroid/view/Window;)V

    iput-object v0, p0, Lfzk;->d:Lmcj;

    invoke-static {p1}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object p2

    new-instance v0, Laq8;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Laq8;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Ldnj;

    const/16 v2, 0x17

    invoke-direct {v1, p0, v2}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p2, v0, v1}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance p2, Lsvk;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p3}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p2, p1}, Lsvk;->a(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    sget-object v0, Lfzk;->e:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object v0, p0, Lfzk;->c:Lfz2;

    iget-object v0, v0, La7f;->b:Ljava/lang/Object;

    check-cast v0, Lcxh;

    iget-object v2, p0, Lfzk;->a:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v0

    iget-object v3, p0, Lfzk;->b:Lqwe;

    iget-object v3, v3, Lqwe;->a:Lbp;

    iget v3, v3, Lbp;->a:I

    invoke-static {v0, v3}, Lp37;->X(II)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-static {v0}, Lp37;->u0(I)Z

    move-result v2

    iget-object p0, p0, Lfzk;->d:Lmcj;

    invoke-virtual {p0, v2}, Lmcj;->t(Z)V

    invoke-static {v0}, Lp37;->u0(I)Z

    move-result v0

    invoke-virtual {p0, v0}, Lmcj;->r(Z)V

    iget-object v0, p0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getStatusBarColor()I

    move-result v2

    if-eqz v2, :cond_42

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lmcj;->j()V

    :cond_42
    invoke-virtual {v0}, Landroid/view/Window;->getNavigationBarColor()I

    move-result v2

    if-nez v2, :cond_49

    return-void

    :cond_49
    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    invoke-virtual {p0}, Lmcj;->j()V

    return-void
.end method
