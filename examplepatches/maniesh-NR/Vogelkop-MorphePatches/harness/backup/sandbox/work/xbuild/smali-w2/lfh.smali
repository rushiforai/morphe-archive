.class public final Llfh;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final l:[Ljava/lang/String;

.field public static final m:J


# instance fields
.field public final a:Landroidx/camera/view/PreviewView;

.field public final b:Lkotlin/jvm/functions/Function0;

.field public final c:Lfe5;

.field public final d:Landroid/content/Context;

.field public e:Lysp;

.field public final f:Lycc;

.field public final g:Lgcl;

.field public h:Lf33;

.field public i:J

.field public final j:Lpde;

.field public final k:Lpde;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "android.permission.CAMERA"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    sput-object v0, Llfh;->l:[Ljava/lang/String;

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x12c

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Llfh;->m:J

    return-void
.end method

.method public constructor <init>(Lndc;Landroidx/camera/view/PreviewView;Lkotlin/jvm/functions/Function0;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Llfh;->a:Landroidx/camera/view/PreviewView;

    iput-object p3, p0, Llfh;->b:Lkotlin/jvm/functions/Function0;

    new-instance p3, Lfe5;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-static {p1}, Loup;->i0(Ltcc;)Lpde;

    move-result-object p1

    invoke-direct {p3, p1}, Lfe5;-><init>(Lpde;)V

    iput-object p3, p0, Llfh;->c:Lfe5;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Llfh;->d:Landroid/content/Context;

    new-instance v1, Lycc;

    invoke-direct {v1, v0}, Lycc;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lycc;->m(I)V

    invoke-static {}, Lxug;->i()V

    iget-object v2, v1, Lycc;->d:Lewa;

    iget v2, v2, Lewa;->s:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_3a

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2, v3}, Lycc;->k(Ljava/lang/Integer;Z)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lycc;->o(Loc4;)V

    :cond_3a
    iput-object v1, p0, Llfh;->f:Lycc;

    new-instance v1, Lgcl;

    invoke-direct {v1, v0, p2}, Lgcl;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v1, p0, Llfh;->g:Lgcl;

    new-instance v0, Lpde;

    sget-object v1, Ldfh;->a:Ldfh;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Llfh;->j:Lpde;

    new-instance v1, Lpde;

    sget-object v2, Lifh;->a:Lifh;

    invoke-direct {v1, v2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Llfh;->k:Lpde;

    new-instance v1, Ls6h;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p2, v1, Ls6h;->a:Ljava/lang/Object;

    new-instance p2, Ltu7;

    const/16 v2, 0x19

    invoke-direct {p2, v1, v2}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lcl4;

    const/16 v2, 0x1b

    invoke-direct {v1, p2, v2}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p3, v1}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v5, Lveh;

    const/4 p2, 0x0

    invoke-direct {v5, p0, p2}, Lveh;-><init>(Llfh;B)V

    new-instance v6, Lveh;

    invoke-direct {v6, p0, v3}, Lveh;-><init>(Llfh;B)V

    const/4 v8, 0x0

    const/16 v9, 0xc

    iget-object v4, p3, Lfe5;->b:Lqdc;

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    iget-object p0, p3, Lfe5;->c:Lk9;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    invoke-virtual {p3}, Lfe5;->b()V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 2

    iget-object p0, p0, Llfh;->f:Lycc;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxug;->i()V

    iget-object p0, p0, Lycc;->m:Lxcc;

    if-nez p0, :cond_e

    const/4 p0, 0x0

    goto :goto_12

    :cond_e
    invoke-virtual {p0}, Lxcc;->j()Lmc4;

    move-result-object p0

    :goto_12
    if-eqz p0, :cond_19

    check-cast p0, Llr;

    invoke-virtual {p0, p1}, Llr;->j(Z)Lcom/google/common/util/concurrent/ListenableFuture;

    :cond_19
    return-void
.end method

.method public final b()V
    .registers 9

    iget-object v0, p0, Llfh;->j:Lpde;

    iget-object v1, p0, Llfh;->c:Lfe5;

    iget-object v2, p0, Llfh;->d:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lj3e;

    iget-object v4, p0, Llfh;->e:Lysp;

    const/4 v5, 0x0

    if-nez v4, :cond_12

    move-object v4, v5

    :cond_12
    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    new-instance v6, Lms7;

    invoke-direct {v6, p0}, Lms7;-><init>(Llfh;)V

    invoke-direct {v3, v4, v2, v6}, Lj3e;-><init>(Ljava/util/List;Ljava/util/concurrent/Executor;Lms7;)V

    iget-object v4, p0, Llfh;->f:Lycc;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxug;->i()V

    iget-object v6, v4, Lycc;->f:Lj3e;

    if-ne v6, v3, :cond_2e

    iget-object v7, v4, Lycc;->e:Ljava/util/concurrent/Executor;

    if-eq v7, v2, :cond_3a

    :cond_2e
    iput-object v2, v4, Lycc;->e:Ljava/util/concurrent/Executor;

    iput-object v3, v4, Lycc;->f:Lj3e;

    iget-object v7, v4, Lycc;->g:Lqva;

    invoke-virtual {v7, v2, v3}, Lqva;->M(Ljava/util/concurrent/Executor;Lj3e;)V

    invoke-virtual {v4, v6, v3}, Lycc;->l(Lj3e;Lj3e;)V

    :cond_3a
    :try_start_3a
    invoke-static {}, Lxug;->i()V

    iput-object v1, v4, Lycc;->G:Lndc;

    invoke-virtual {v4, v5}, Lycc;->o(Loc4;)V
    :try_end_42
    .catch Ljava/lang/IllegalStateException; {:try_start_3a .. :try_end_42} :catch_7f

    new-instance v2, Lffh;

    invoke-direct {v2, v5}, Lffh;-><init>(Lhmi;)V

    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    invoke-static {}, Lxug;->i()V

    iget-object v0, p0, Llfh;->a:Landroidx/camera/view/PreviewView;

    iget-object v2, v0, Landroidx/camera/view/PreviewView;->h:Lycc;

    if-eqz v2, :cond_5b

    if-eq v2, v4, :cond_5b

    invoke-virtual {v2}, Lycc;->b()V

    invoke-virtual {v0}, Landroidx/camera/view/PreviewView;->c()V

    :cond_5b
    iput-object v4, v0, Landroidx/camera/view/PreviewView;->h:Lycc;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroidx/camera/view/PreviewView;->a(Z)V

    iget-object v2, v0, Landroidx/camera/view/PreviewView;->c:Lnc;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Landroidx/camera/view/PreviewView;->c()V

    invoke-static {}, Lxug;->i()V

    iget-object v0, v4, Lycc;->x:Lhx5;

    new-instance v2, Lveh;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v3}, Lveh;-><init>(Llfh;B)V

    new-instance p0, Liwa;

    const/16 v3, 0x13

    invoke-direct {p0, v2, v3}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void

    :catch_7f
    new-instance p0, Lcfh;

    sget-object v1, Lxeh;->a:Lxeh;

    invoke-direct {p0, v1}, Lcfh;-><init>(Lbfh;)V

    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
