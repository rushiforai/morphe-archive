.class public final synthetic Le/e/a/SearchRange$$ExternalSyntheticLambda30;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:[Z

.field public final synthetic f$1:Le/e/a/DurationRangeModel;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:Landroid/widget/EditText;

.field public final synthetic f$4:Le/e/a/DurationRangeBar;

.field public final synthetic f$5:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>([ZLe/e/a/DurationRangeModel;Landroid/widget/EditText;Landroid/widget/EditText;Le/e/a/DurationRangeBar;Ljava/lang/Runnable;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$0:[Z

    iput-object p2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$1:Le/e/a/DurationRangeModel;

    iput-object p3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$2:Landroid/widget/EditText;

    iput-object p4, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$3:Landroid/widget/EditText;

    iput-object p5, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$4:Le/e/a/DurationRangeBar;

    iput-object p6, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$5:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 11

    .line 0
    iget-object v0, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$0:[Z

    iget-object v1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$1:Le/e/a/DurationRangeModel;

    iget-object v2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$2:Landroid/widget/EditText;

    iget-object v3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$3:Landroid/widget/EditText;

    iget-object v4, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$4:Le/e/a/DurationRangeBar;

    iget-object v5, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda30;->f$5:Ljava/lang/Runnable;

    move-object v6, p1

    move v7, p2

    invoke-static/range {v0 .. v7}, Le/e/a/SearchRange;->lambda$14([ZLe/e/a/DurationRangeModel;Landroid/widget/EditText;Landroid/widget/EditText;Le/e/a/DurationRangeBar;Ljava/lang/Runnable;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
