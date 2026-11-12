.class public final Lb5g;
.super Lca3;
.source "SourceFile"


# instance fields
.field public final b:Lcom/google/android/material/textfield/TextInputLayout;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Lq2;

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/String;Ljava/lang/String;Lq2;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lca3;-><init>(B)V

    iput-object p1, p0, Lb5g;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p2, p0, Lb5g;->c:Ljava/lang/String;

    iput-object p3, p0, Lb5g;->d:Ljava/lang/String;

    iput-object p4, p0, Lb5g;->e:Lq2;

    const-string p1, ""

    iput-object p1, p0, Lb5g;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 4

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_8

    :cond_7
    const/4 p1, 0x0

    :goto_8
    if-nez p1, :cond_c

    const-string p1, ""

    :cond_c
    iget-object v0, p0, Lb5g;->f:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    return-void

    :cond_15
    iput-object p1, p0, Lb5g;->f:Ljava/lang/String;

    iget-object v0, p0, Lb5g;->d:Ljava/lang/String;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lb5g;->l(Z)V

    return-void

    :cond_24
    new-instance v0, Lo8f;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lo8f;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lb5g;->c:Ljava/lang/String;

    invoke-static {p1, p0, v0}, LJ/N;->MoLZR6Z2(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final l(Z)V
    .registers 4

    iget-object v0, p0, Lb5g;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    iget-boolean v1, v1, Ll6b;->q:Z

    if-ne v1, p1, :cond_9

    return-void

    :cond_9
    if-eqz p1, :cond_1a

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f14063a

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    goto :goto_1e

    :cond_1a
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    :goto_1e
    iget-object p0, p0, Lb5g;->e:Lq2;

    invoke-virtual {p0}, Lq2;->invoke()Ljava/lang/Object;

    return-void
.end method
