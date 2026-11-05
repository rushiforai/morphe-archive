.class public final synthetic Le/e/a/SearchRange$$ExternalSyntheticLambda26;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:[I

.field public final synthetic f$3:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(ILandroid/content/Context;[ILandroid/widget/Button;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda26;->f$0:I

    iput-object p2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda26;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda26;->f$2:[I

    iput-object p4, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda26;->f$3:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget v0, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda26;->f$0:I

    iget-object v1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda26;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda26;->f$2:[I

    iget-object v3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda26;->f$3:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/SearchRange;->lambda$1(ILandroid/content/Context;[ILandroid/widget/Button;Landroid/view/View;)V

    return-void
.end method
