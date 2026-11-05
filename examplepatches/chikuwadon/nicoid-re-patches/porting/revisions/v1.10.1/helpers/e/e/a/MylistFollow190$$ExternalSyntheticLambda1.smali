.class public final synthetic Le/e/a/MylistFollow190$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Landroid/app/AlertDialog;

.field public final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Z)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda1;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda1;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda1;->f$2:Landroid/app/AlertDialog;

    iput-boolean p4, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda1;->f$3:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda1;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda1;->f$1:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda1;->f$2:Landroid/app/AlertDialog;

    iget-boolean v3, p0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda1;->f$3:Z

    invoke-static {v0, v1, v2, v3}, Le/e/a/MylistFollow190;->lambda$7(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Z)V

    return-void
.end method
