.class public final synthetic Le/e/a/ExistingMenu114$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Landroid/view/Menu;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda2;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda2;->f$1:Landroid/view/Menu;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda2;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda2;->f$1:Landroid/view/Menu;

    invoke-static {v0, v1, p1}, Le/e/a/ExistingMenu114;->lambda$1(Landroid/app/Activity;Landroid/view/Menu;Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method
