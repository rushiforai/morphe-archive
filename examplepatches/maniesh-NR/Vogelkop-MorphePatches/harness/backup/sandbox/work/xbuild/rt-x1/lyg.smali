.class public final Llyg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq1o;


# static fields
.field public static final d:Lqmm;


# instance fields
.field public final a:Lorg/chromium/ui/base/WindowAndroid;

.field public b:Ljyg;

.field public c:Lpjg;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lqmm;

    new-instance v1, Lodf;

    const/16 v2, 0x1a

    invoke-direct {v1, v2}, Lodf;-><init>(B)V

    invoke-direct {v0, v1}, Lqmm;-><init>(Lodf;)V

    sput-object v0, Llyg;->d:Lqmm;

    return-void
.end method

.method public constructor <init>(Lorg/chromium/ui/base/WindowAndroid;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llyg;->a:Lorg/chromium/ui/base/WindowAndroid;

    iget-object p1, p1, Lorg/chromium/ui/base/WindowAndroid;->t:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public static c(Lorg/chromium/ui/base/WindowAndroid;)Llyg;
    .registers 4

    iget-object v0, p0, Lorg/chromium/ui/base/WindowAndroid;->l:Lpmm;

    sget-object v1, Llyg;->d:Lqmm;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lpmm;->a(Lqmm;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llyg;

    if-nez v2, :cond_17

    new-instance v2, Llyg;

    invoke-direct {v2, p0}, Llyg;-><init>(Lorg/chromium/ui/base/WindowAndroid;)V

    invoke-virtual {v1, v0, v2}, Lqmm;->a(Lpmm;Ljava/lang/Object;)V

    :cond_17
    return-object v2
.end method


# virtual methods
.method public final a()V
    .registers 1

    invoke-virtual {p0}, Llyg;->e()V

    return-void
.end method

.method public final d()Z
    .registers 1

    iget-object p0, p0, Llyg;->b:Ljyg;

    if-eqz p0, :cond_a

    iget-boolean p0, p0, Ljyg;->o:Z

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final e()V
    .registers 3

    iget-object v0, p0, Llyg;->b:Ljyg;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ljyg;->b()V

    :cond_7
    iget-object v0, p0, Llyg;->c:Lpjg;

    if-eqz v0, :cond_11

    const/4 v1, 0x0

    iput-object v1, p0, Llyg;->c:Lpjg;

    invoke-virtual {v0}, Lpjg;->run()V

    :cond_11
    return-void
.end method

.method public final f(Lorg/chromium/printing/Printable;Liyg;II)V
    .registers 6

    invoke-virtual {p0}, Llyg;->d()Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string p1, "Pending print can\'t be set. PrintingController is busy."

    invoke-static {p1, p0}, Lwxe;->t(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_f
    iget-object v0, p0, Llyg;->b:Ljyg;

    if-eqz v0, :cond_16

    invoke-virtual {v0}, Ljyg;->b()V

    :cond_16
    new-instance v0, Ljyg;

    invoke-direct {v0, p1, p2, p3, p4}, Ljyg;-><init>(Lorg/chromium/printing/Printable;Liyg;II)V

    iput-object v0, p0, Llyg;->b:Ljyg;

    iget-object p1, p0, Llyg;->c:Lpjg;

    if-eqz p1, :cond_26

    iput-object p1, v0, Ljyg;->l:Lpjg;

    const/4 p1, 0x0

    iput-object p1, p0, Llyg;->c:Lpjg;

    :cond_26
    return-void
.end method

.method public final g()V
    .registers 6

    invoke-virtual {p0}, Llyg;->d()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    const-string p0, "Pending print can\'t be started. PrintingController is busy."

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lwxe;->t(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_f
    iget-object v0, p0, Llyg;->b:Ljyg;

    if-nez v0, :cond_1e

    const-string v0, "Pending print can\'t be started. No pending print session."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lwxe;->t(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Llyg;->e()V

    return-void

    :cond_1e
    iget-boolean v2, v0, Ljyg;->p:Z

    if-nez v2, :cond_7e

    iget-object v2, v0, Ljyg;->q:Liyg;

    if-nez v2, :cond_2e

    const-string v0, "Pending print can\'t be started. No PrintManager provided."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lwxe;->t(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_7e

    :cond_2e
    iget-object v2, v0, Ljyg;->j:Lorg/chromium/printing/Printable;

    if-eqz v2, :cond_77

    invoke-interface {v2}, Lorg/chromium/printing/Printable;->b()Z

    move-result v2

    if-eqz v2, :cond_77

    iget-object v2, p0, Llyg;->a:Lorg/chromium/ui/base/WindowAndroid;

    invoke-virtual {v2}, Lorg/chromium/ui/base/WindowAndroid;->m()Lb2b;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    if-eqz v2, :cond_5a

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_52

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_5a

    :cond_52
    const-string v0, "Pending print can\'t be started. Activity is finishing or destroyed."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lwxe;->t(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_7e

    :cond_5a
    const/4 v2, 0x1

    iput-boolean v2, v0, Ljyg;->o:Z

    iget-object v2, v0, Ljyg;->q:Liyg;

    const/4 v3, 0x0

    iput-object v3, v0, Ljyg;->q:Liyg;

    iget-object v3, v0, Ljyg;->r:Lfyg;

    iget-object v4, v0, Ljyg;->j:Lorg/chromium/printing/Printable;

    invoke-interface {v4}, Lorg/chromium/printing/Printable;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2, v4, v3}, Liyg;->f(Ljava/lang/String;Landroid/print/PrintDocumentAdapter;)Z

    move-result v2

    if-nez v2, :cond_76

    iput-boolean v1, v0, Ljyg;->o:Z

    goto :goto_7e

    :cond_76
    return-void

    :cond_77
    const-string v0, "Pending print can\'t be started. Printable can\'t perform printing."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lwxe;->t(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_7e
    :goto_7e
    invoke-virtual {p0}, Llyg;->e()V

    return-void
.end method
