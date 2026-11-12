.class public final Lgii;
.super Lnji;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lrf7;

.field public final d:Lqji;

.field public final e:[Landroid/print/PageRange;

.field public final f:Lcom/opera/android/BrowserActivity;

.field public final g:Lr9g;

.field public final h:Landroid/net/Uri;

.field public final i:Landroid/net/Uri;

.field public final j:Ljava/lang/String;

.field public final k:Lx5f;

.field public l:Landroid/os/ParcelFileDescriptor;

.field public m:Lzzh;

.field public n:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lrf7;Lqji;[Landroid/print/PageRange;Lcom/opera/android/BrowserActivity;Lr9g;Landroid/net/Uri;Ljava/lang/String;Lzzh;Lx5f;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgii;->a:Landroid/content/Context;

    iput-object p2, p0, Lgii;->b:Lumi;

    iput-object p3, p0, Lgii;->c:Lrf7;

    iput-object p4, p0, Lgii;->d:Lqji;

    iput-object p5, p0, Lgii;->e:[Landroid/print/PageRange;

    iput-object p6, p0, Lgii;->f:Lcom/opera/android/BrowserActivity;

    iput-object p7, p0, Lgii;->g:Lr9g;

    iput-object p10, p0, Lgii;->m:Lzzh;

    iget-object p1, p4, Lqji;->a:Landroid/net/Uri;

    iput-object p1, p0, Lgii;->h:Landroid/net/Uri;

    iput-object p8, p0, Lgii;->i:Landroid/net/Uri;

    iput-object p9, p0, Lgii;->j:Ljava/lang/String;

    iput-object p11, p0, Lgii;->k:Lx5f;

    new-instance p1, Lfii;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Lfii;-><init>(Lgii;B)V

    invoke-virtual {p2, p1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p1

    new-instance p3, Lfii;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Lfii;-><init>(Lgii;B)V

    invoke-virtual {p2, p3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p1, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method


# virtual methods
.method public final c(I)V
    .registers 5

    if-eqz p1, :cond_33

    const/4 v0, 0x1

    iget-object v1, p0, Lgii;->d:Lqji;

    if-eq p1, v0, :cond_27

    const/4 v2, 0x2

    if-eq p1, v2, :cond_e

    const/4 v2, 0x3

    if-eq p1, v2, :cond_27

    goto :goto_32

    :cond_e
    iget-boolean p1, p0, Lgii;->n:Z

    if-eqz p1, :cond_18

    invoke-virtual {v1, p0}, Lqji;->e(Lnji;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lgii;->n:Z

    :cond_18
    iget-object p1, p0, Lgii;->l:Landroid/os/ParcelFileDescriptor;

    new-instance v0, Li4d;

    const/16 v2, 0x16

    invoke-direct {v0, p0, v2}, Li4d;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lgii;->e:[Landroid/print/PageRange;

    invoke-virtual {v1, p1, p0, v0}, Lqji;->h(Landroid/os/ParcelFileDescriptor;[Landroid/print/PageRange;Lpji;)V

    return-void

    :cond_27
    iget-boolean p1, p0, Lgii;->n:Z

    if-nez p1, :cond_32

    iput-boolean v0, p0, Lgii;->n:Z

    iget-object p1, v1, Lqji;->c:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_32
    :goto_32
    return-void

    :cond_33
    invoke-virtual {p0}, Lgii;->e()V

    return-void
.end method

.method public final e()V
    .registers 4

    iget-object v0, p0, Lgii;->l:Landroid/os/ParcelFileDescriptor;

    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {p0}, Lgii;->f()Ldd7;

    move-result-object v0

    invoke-virtual {v0}, Ldd7;->c()Z

    new-instance v0, Lglj;

    const v1, 0x7f1405e1

    const/16 v2, 0x9c4

    invoke-direct {v0, v1, v2}, Lglj;-><init>(II)V

    iget-object v1, p0, Lgii;->g:Lr9g;

    invoke-virtual {v1, v0}, Lr9g;->f(Lo93;)V

    iget-boolean v0, p0, Lgii;->n:Z

    iget-object v1, p0, Lgii;->d:Lqji;

    if-eqz v0, :cond_27

    invoke-virtual {v1, p0}, Lqji;->e(Lnji;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lgii;->n:Z

    :cond_27
    invoke-virtual {v1}, Lqji;->b()V

    iget-object v0, p0, Lgii;->m:Lzzh;

    if-nez v0, :cond_2f

    return-void

    :cond_2f
    const/4 v1, 0x0

    iput-object v1, p0, Lgii;->m:Lzzh;

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lzzh;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final f()Ldd7;
    .registers 4

    iget-object v0, p0, Lgii;->i:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "file"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d

    new-instance p0, Ljava/io/File;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v0, Lbkh;

    invoke-direct {v0, p0}, Lbkh;-><init>(Ljava/io/File;)V

    return-object v0

    :cond_1d
    iget-object p0, p0, Lgii;->a:Landroid/content/Context;

    invoke-static {p0, v0}, Ldd7;->e(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object p0

    return-object p0
.end method
