.class public final synthetic Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Landroid/widget/Button;

.field public final synthetic f$3:Landroid/widget/TextView;

.field public final synthetic f$4:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Landroid/app/AlertDialog;Landroid/widget/Button;Landroid/widget/TextView;Landroid/app/Activity;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;->f$1:Landroid/app/AlertDialog;

    iput-object p3, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;->f$2:Landroid/widget/Button;

    iput-object p4, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;->f$3:Landroid/widget/TextView;

    iput-object p5, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;->f$4:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;->f$1:Landroid/app/AlertDialog;

    iget-object v2, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;->f$2:Landroid/widget/Button;

    iget-object v3, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;->f$3:Landroid/widget/TextView;

    iget-object v4, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;->f$4:Landroid/app/Activity;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/MylistFollow190;->lambda$8(Le/e/a/NetworkTask;Landroid/app/AlertDialog;Landroid/widget/Button;Landroid/widget/TextView;Landroid/app/Activity;)V

    return-void
.end method
