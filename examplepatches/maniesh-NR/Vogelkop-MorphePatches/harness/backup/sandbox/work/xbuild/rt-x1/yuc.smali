.class public final Lyuc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;


# instance fields
.field public final synthetic a:Lzuc;


# direct methods
.method public constructor <init>(Lzuc;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyuc;->a:Lzuc;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Lyuc;->a:Lzuc;

    invoke-static {v0}, Lzuc;->e0(Lzuc;)Lyuc;

    move-result-object v1

    if-eq v1, p0, :cond_9

    return-void

    :cond_9
    iget-object p0, v0, Lzuc;->d:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    invoke-virtual {p0}, Lfqe;->c()Luqe;

    move-result-object p0

    invoke-static {v0}, Lzuc;->e0(Lzuc;)Lyuc;

    move-result-object v0

    invoke-virtual {p0, v0}, Luqe;->g(Lq8j;)V

    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Lnre;

    iget-object v0, p0, Lyuc;->a:Lzuc;

    invoke-static {v0}, Lzuc;->e0(Lzuc;)Lyuc;

    move-result-object v1

    if-ne v1, p0, :cond_26

    if-eqz p1, :cond_26

    iget-object p0, p1, Lnre;->c:Ll0c;

    if-eqz p0, :cond_26

    iget-object p0, p1, Lnre;->g:Lbre;

    if-eqz p0, :cond_26

    iget-object v1, v0, Lzuc;->e:Landroid/widget/TextView;

    invoke-static {p0}, Lx77;->h(Lbre;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v0, Lzuc;->f:Lyqa;

    new-instance v0, Lx77;

    invoke-direct {v0, p1}, Lx77;-><init>(Lnre;)V

    iput-object v0, p0, Lyqa;->b:Ljava/lang/Object;

    :cond_26
    return-void
.end method
