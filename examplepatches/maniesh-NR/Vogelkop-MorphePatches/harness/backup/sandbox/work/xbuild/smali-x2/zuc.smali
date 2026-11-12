.class public final Lzuc;
.super Llx8;
.source "SourceFile"

# interfaces
.implements Lxa2;


# instance fields
.field public final d:Landroid/view/View;

.field public final e:Landroid/widget/TextView;

.field public final f:Lyqa;

.field private g:Lyuc;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 5

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    new-instance v0, Lyqa;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lyqa;-><init>(B)V

    iput-object v0, p0, Lzuc;->f:Lyqa;

    iput-object p1, p0, Lzuc;->d:Landroid/view/View;

    const v1, 0x7f0a021e

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lzuc;->e:Landroid/widget/TextView;

    const v1, 0x7f0a01fd

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/CapturableButton;

    new-instance v1, Lsma;

    const/16 v2, 0x14

    invoke-direct {v1, p0, v2}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lyzb;

    const/16 v1, 0xa

    invoke-direct {p1, p0, v1}, Lyzb;-><init>(Ljava/lang/Object;B)V

    iput-object p1, v0, Lyqa;->c:Ljava/lang/Object;

    return-void
.end method

.method public static bridge synthetic e0(Lzuc;)Lyuc;
    .registers 1

    iget-object p0, p0, Lzuc;->g:Lyuc;

    return-object p0
.end method


# virtual methods
.method public final J(Lwa2;)V
    .registers 2

    return-void
.end method

.method public final U()I
    .registers 1

    const/4 p0, -0x1

    return p0
.end method

.method public final V(Lja2;Z)V
    .registers 3

    new-instance p1, Lyuc;

    invoke-direct {p1, p0}, Lyuc;-><init>(Lzuc;)V

    iput-object p1, p0, Lzuc;->g:Lyuc;

    iget-object p1, p0, Lzuc;->d:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p1

    invoke-virtual {p1}, Lfqe;->c()Luqe;

    move-result-object p1

    iget-object p0, p0, Lzuc;->g:Lyuc;

    invoke-virtual {p1, p0}, Luqe;->g(Lq8j;)V

    return-void
.end method

.method public final Y()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lzuc;->g:Lyuc;

    return-void
.end method
