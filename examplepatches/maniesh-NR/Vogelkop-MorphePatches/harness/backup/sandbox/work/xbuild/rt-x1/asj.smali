.class public final Lasj;
.super Lna3;
.source "SourceFile"


# static fields
.field public static final E:[I


# instance fields
.field public final C:Landroid/view/accessibility/AccessibilityManager;

.field public D:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const v0, 0x7f0408a8

    const v1, 0x7f0408ab

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sput-object v0, Lasj;->E:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/google/android/material/snackbar/SnackbarContentLayout;Lcom/google/android/material/snackbar/SnackbarContentLayout;)V
    .registers 5

    invoke-direct {p0, p1, p2, p3, p4}, Lna3;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/google/android/material/snackbar/SnackbarContentLayout;Lcom/google/android/material/snackbar/SnackbarContentLayout;)V

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "accessibility"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/AccessibilityManager;

    iput-object p1, p0, Lasj;->C:Landroid/view/accessibility/AccessibilityManager;

    return-void
.end method


# virtual methods
.method public final i(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V
    .registers 6

    iget-object v0, p0, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/snackbar/SnackbarContentLayout;

    iget-object v0, v0, Lcom/google/android/material/snackbar/SnackbarContentLayout;->b:Landroid/widget/Button;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_27

    if-eqz p2, :cond_27

    const/4 v2, 0x1

    iput-boolean v2, p0, Lasj;->D:Z

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p1, Lj5g;

    const/16 v1, 0x10

    invoke-direct {p1, p0, p2, v1}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_27
    const/16 p1, 0x8

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-boolean v1, p0, Lasj;->D:Z

    return-void
.end method
