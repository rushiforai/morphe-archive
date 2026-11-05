.class public final synthetic Le/e/a/SearchRange$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:[I

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>([ILandroid/content/Context;Landroid/widget/Button;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda6;->f$0:[I

    iput-object p2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda6;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda6;->f$2:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda6;->f$0:[I

    iget-object v1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda6;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda6;->f$2:Landroid/widget/Button;

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/SearchRange;->lambda$11([ILandroid/content/Context;Landroid/widget/Button;Landroid/content/DialogInterface;I)V

    return-void
.end method
