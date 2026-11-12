.class public final Lhjn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final b:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhjn;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p2, p0, Lhjn;->b:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lhjn;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method
