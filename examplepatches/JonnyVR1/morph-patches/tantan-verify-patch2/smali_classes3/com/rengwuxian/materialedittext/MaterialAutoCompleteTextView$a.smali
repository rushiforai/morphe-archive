.class Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->w()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;


# direct methods
.method public constructor <init>(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$a;->a:Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$a;->a:Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->a(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$a;->a:Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->b(Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object v0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$a;->a:Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->F()Z

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    invoke-virtual {v0, p1}, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;->setError(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object p0, p0, Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView$a;->a:Lcom/rengwuxian/materialedittext/MaterialAutoCompleteTextView;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
