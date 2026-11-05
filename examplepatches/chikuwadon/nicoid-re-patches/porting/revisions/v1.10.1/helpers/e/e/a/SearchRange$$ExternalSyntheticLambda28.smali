.class public final synthetic Le/e/a/SearchRange$$ExternalSyntheticLambda28;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/DurationRangeBar;

.field public final synthetic f$1:Le/e/a/DurationRangeModel;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Le/e/a/DurationRangeBar;Le/e/a/DurationRangeModel;Landroid/widget/EditText;Landroid/widget/TextView;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda28;->f$0:Le/e/a/DurationRangeBar;

    iput-object p2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda28;->f$1:Le/e/a/DurationRangeModel;

    iput-object p3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda28;->f$2:Landroid/widget/EditText;

    iput-object p4, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda28;->f$3:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda28;->f$0:Le/e/a/DurationRangeBar;

    iget-object v1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda28;->f$1:Le/e/a/DurationRangeModel;

    iget-object v2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda28;->f$2:Landroid/widget/EditText;

    iget-object v3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda28;->f$3:Landroid/widget/TextView;

    invoke-static {v0, v1, v2, v3}, Le/e/a/SearchRange;->lambda$12(Le/e/a/DurationRangeBar;Le/e/a/DurationRangeModel;Landroid/widget/EditText;Landroid/widget/TextView;)V

    return-void
.end method
