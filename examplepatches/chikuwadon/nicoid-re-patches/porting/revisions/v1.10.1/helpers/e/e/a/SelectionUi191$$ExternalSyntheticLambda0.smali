.class public final synthetic Le/e/a/SelectionUi191$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic f$0:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SelectionUi191$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/SelectionUi191$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Runnable;

    invoke-static {v0, p1}, Le/e/a/SelectionUi191;->lambda$6(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method
