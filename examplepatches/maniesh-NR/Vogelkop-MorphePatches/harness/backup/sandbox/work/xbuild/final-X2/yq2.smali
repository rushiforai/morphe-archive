.class public final Lyq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final b:Lor2;

.field public final c:Lor2;

.field public final d:Lor2;

.field public final e:Lcom/opera/android/custom_views/StylingImageView;

.field public final f:Lor2;

.field public final g:Lor2;

.field public final h:Lcom/opera/android/custom_views/StylingTextView;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lor2;Lor2;Lor2;Lcom/opera/android/custom_views/StylingImageView;Lor2;Lor2;Lcom/opera/android/custom_views/StylingTextView;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyq2;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p2, p0, Lyq2;->b:Lor2;

    iput-object p3, p0, Lyq2;->c:Lor2;

    iput-object p4, p0, Lyq2;->d:Lor2;

    iput-object p5, p0, Lyq2;->e:Lcom/opera/android/custom_views/StylingImageView;

    iput-object p6, p0, Lyq2;->f:Lor2;

    iput-object p7, p0, Lyq2;->g:Lor2;

    iput-object p8, p0, Lyq2;->h:Lcom/opera/android/custom_views/StylingTextView;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lyq2;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method
