.class public final synthetic Le/e/a/SelectionUi191$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# instance fields
.field public final synthetic f$0:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SelectionUi191$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/SelectionUi191$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Runnable;

    invoke-static {v0, p1, p2}, Le/e/a/SelectionUi191;->lambda$4(Ljava/lang/Runnable;Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p1

    return-object p1
.end method
