.class public final synthetic Le/e/a/CacheFolders$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Landroid/app/AlertDialog;Z)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CacheFolders$$ExternalSyntheticLambda6;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/CacheFolders$$ExternalSyntheticLambda6;->f$1:Landroid/app/AlertDialog;

    iput-boolean p3, p0, Le/e/a/CacheFolders$$ExternalSyntheticLambda6;->f$2:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/CacheFolders$$ExternalSyntheticLambda6;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/CacheFolders$$ExternalSyntheticLambda6;->f$1:Landroid/app/AlertDialog;

    iget-boolean v2, p0, Le/e/a/CacheFolders$$ExternalSyntheticLambda6;->f$2:Z

    invoke-static {v0, v1, v2}, Le/e/a/CacheFolders;->lambda$7(Landroid/app/Activity;Landroid/app/AlertDialog;Z)V

    return-void
.end method
