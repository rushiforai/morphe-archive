.class public final Ltn9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final b:Lcom/opera/android/custom_views/StylingImageView;

.field public final c:Lcom/opera/android/custom_views/StylingTextView;

.field public final d:Lcom/opera/android/custom_views/StylingImageButton;

.field public final e:Lcom/opera/android/custom_views/StylingImageButton;

.field public final f:Lor2;

.field public final g:Lcom/opera/android/custom_views/StylingTextView;

.field public final h:Lor2;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lor2;Lcom/opera/android/custom_views/StylingTextView;Lor2;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltn9;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p2, p0, Ltn9;->b:Lcom/opera/android/custom_views/StylingImageView;

    iput-object p3, p0, Ltn9;->c:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p4, p0, Ltn9;->d:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p5, p0, Ltn9;->e:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p6, p0, Ltn9;->f:Lor2;

    iput-object p7, p0, Ltn9;->g:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p8, p0, Ltn9;->h:Lor2;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Ltn9;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method
