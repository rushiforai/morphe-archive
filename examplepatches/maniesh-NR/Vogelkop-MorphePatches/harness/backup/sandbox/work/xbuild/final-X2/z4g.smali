.class public final Lz4g;
.super Lca3;
.source "SourceFile"


# instance fields
.field public final b:Lcom/google/android/material/textfield/TextInputLayout;

.field public final c:Ljava/lang/String;

.field public final d:Lq2;


# direct methods
.method public constructor <init>(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/String;Lq2;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lca3;-><init>(B)V

    iput-object p1, p0, Lz4g;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p2, p0, Lz4g;->c:Ljava/lang/String;

    iput-object p3, p0, Lz4g;->d:Lq2;

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 7

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_c

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-eqz p1, :cond_c

    move p1, v0

    goto :goto_d

    :cond_c
    move p1, v1

    :goto_d
    xor-int/lit8 v2, p1, 0x1

    iget-object v3, p0, Lz4g;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v4, v3, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    iget-boolean v4, v4, Ll6b;->q:Z

    xor-int/2addr v4, v1

    if-ne v4, v2, :cond_19

    return-void

    :cond_19
    if-nez p1, :cond_1f

    invoke-virtual {v3, v0}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    goto :goto_3b

    :cond_1f
    iget-object p1, p0, Lz4g;->c:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_37

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f140638

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_38

    :cond_37
    const/4 p1, 0x0

    :goto_38
    invoke-virtual {v3, p1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :goto_3b
    iget-object p0, p0, Lz4g;->d:Lq2;

    invoke-virtual {p0}, Lq2;->invoke()Ljava/lang/Object;

    return-void
.end method
