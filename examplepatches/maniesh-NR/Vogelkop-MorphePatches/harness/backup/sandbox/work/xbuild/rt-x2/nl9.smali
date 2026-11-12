.class public final Lnl9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final b:Lcom/opera/android/custom_views/StylingImageView;

.field public final c:Lcom/opera/android/custom_views/OperaTextInputEditText;

.field public final d:Lcom/google/android/material/textfield/TextInputLayout;

.field public final e:Lor2;

.field public final f:Lcom/opera/android/custom_views/StylingTextView;

.field public final g:Lcom/opera/android/custom_views/OperaTextInputEditText;

.field public final h:Lcom/google/android/material/textfield/TextInputLayout;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lor2;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnl9;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p2, p0, Lnl9;->b:Lcom/opera/android/custom_views/StylingImageView;

    iput-object p3, p0, Lnl9;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    iput-object p4, p0, Lnl9;->d:Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p5, p0, Lnl9;->e:Lor2;

    iput-object p6, p0, Lnl9;->f:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p7, p0, Lnl9;->g:Lcom/opera/android/custom_views/OperaTextInputEditText;

    iput-object p8, p0, Lnl9;->h:Lcom/google/android/material/textfield/TextInputLayout;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lnl9;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method
