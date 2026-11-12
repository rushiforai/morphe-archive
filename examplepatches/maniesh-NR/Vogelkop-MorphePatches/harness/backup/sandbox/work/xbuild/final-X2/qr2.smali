.class public final Lqr2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lcom/google/android/material/textfield/TextInputLayout;

.field public c:Ljava/lang/String;

.field public d:Z


# direct methods
.method public constructor <init>(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqr2;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p2, p0, Lqr2;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Z)V
    .registers 3

    if-nez p2, :cond_15

    iget-object p1, p0, Lqr2;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p2, p1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_15

    iget-object p0, p0, Lqr2;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :cond_15
    return-void
.end method

.method public final onFocusChange(Landroid/view/View;Z)V
    .registers 4

    iget-boolean v0, p0, Lqr2;->d:Z

    if-eqz v0, :cond_7

    invoke-virtual {p0, p1, p2}, Lqr2;->a(Landroid/view/View;Z)V

    :cond_7
    iget-object p1, p0, Lqr2;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v0, p1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-nez p2, :cond_28

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_28

    sget-object p2, Landroid/util/Patterns;->EMAIL_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {p2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/regex/Matcher;->matches()Z

    move-result p2

    if-nez p2, :cond_28

    iget-object p0, p0, Lqr2;->c:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :cond_28
    return-void
.end method
