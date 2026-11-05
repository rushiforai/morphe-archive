.class public final synthetic Le/e/a/SearchRange$$ExternalSyntheticLambda23;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:[J

.field public final synthetic f$1:[I

.field public final synthetic f$2:I

.field public final synthetic f$3:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>([J[IILjava/lang/Runnable;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda23;->f$0:[J

    iput-object p2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda23;->f$1:[I

    iput p3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda23;->f$2:I

    iput-object p4, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda23;->f$3:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda23;->f$0:[J

    iget-object v1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda23;->f$1:[I

    iget v2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda23;->f$2:I

    iget-object v3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda23;->f$3:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/SearchRange;->lambda$9([J[IILjava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
