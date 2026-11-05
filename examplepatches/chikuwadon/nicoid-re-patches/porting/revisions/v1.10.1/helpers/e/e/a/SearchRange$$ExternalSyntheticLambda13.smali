.class public final synthetic Le/e/a/SearchRange$$ExternalSyntheticLambda13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/DurationRangeModel;

.field public final synthetic f$1:[[I

.field public final synthetic f$2:I

.field public final synthetic f$3:Le/e/a/DurationRangeBar;

.field public final synthetic f$4:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Le/e/a/DurationRangeModel;[[IILe/e/a/DurationRangeBar;Ljava/lang/Runnable;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda13;->f$0:Le/e/a/DurationRangeModel;

    iput-object p2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda13;->f$1:[[I

    iput p3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda13;->f$2:I

    iput-object p4, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda13;->f$3:Le/e/a/DurationRangeBar;

    iput-object p5, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda13;->f$4:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda13;->f$0:Le/e/a/DurationRangeModel;

    iget-object v1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda13;->f$1:[[I

    iget v2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda13;->f$2:I

    iget-object v3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda13;->f$3:Le/e/a/DurationRangeBar;

    iget-object v4, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda13;->f$4:Ljava/lang/Runnable;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Le/e/a/SearchRange;->lambda$16(Le/e/a/DurationRangeModel;[[IILe/e/a/DurationRangeBar;Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
