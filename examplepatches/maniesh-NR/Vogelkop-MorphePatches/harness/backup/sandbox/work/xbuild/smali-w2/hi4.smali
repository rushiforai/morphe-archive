.class public final Lhi4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/google/android/material/textfield/TextInputLayout;

.field public final c:Lcom/google/android/material/textfield/TextInputLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;B)V
    .registers 4

    iput-byte p3, p0, Lhi4;->a:B

    iput-object p1, p0, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p2, p0, Lhi4;->c:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/view/View;)Lhi4;
    .registers 4

    move-object v0, p0

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    const v1, 0x7f0a0ab1

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/AutoCompleteTextView;

    if-eqz v2, :cond_15

    new-instance p0, Lhi4;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v0, v1}, Lhi4;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;B)V

    return-object p0

    :cond_15
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static b(Landroid/view/View;)Lhi4;
    .registers 4

    move-object v0, p0

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    const v1, 0x7f0a0ab1

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/AutoCompleteTextView;

    if-eqz v2, :cond_15

    new-instance p0, Lhi4;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v0, v1}, Lhi4;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/textfield/TextInputLayout;B)V

    return-object p0

    :cond_15
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lhi4;->a:B

    iget-object p0, p0, Lhi4;->b:Lcom/google/android/material/textfield/TextInputLayout;

    return-object p0
.end method
