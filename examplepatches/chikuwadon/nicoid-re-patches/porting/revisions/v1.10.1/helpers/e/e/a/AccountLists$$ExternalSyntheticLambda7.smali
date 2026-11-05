.class public final synthetic Le/e/a/AccountLists$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;ZLandroid/app/AlertDialog;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda7;->f$0:Landroid/app/Activity;

    iput-boolean p2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda7;->f$1:Z

    iput-object p3, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda7;->f$2:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda7;->f$0:Landroid/app/Activity;

    iget-boolean v1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda7;->f$1:Z

    iget-object v2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda7;->f$2:Landroid/app/AlertDialog;

    invoke-static {v0, v1, v2}, Le/e/a/AccountLists;->lambda$6(Landroid/app/Activity;ZLandroid/app/AlertDialog;)V

    return-void
.end method
