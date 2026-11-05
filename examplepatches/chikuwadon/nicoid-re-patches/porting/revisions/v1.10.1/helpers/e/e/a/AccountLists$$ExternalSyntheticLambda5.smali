.class public final synthetic Le/e/a/AccountLists$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:Landroid/app/AlertDialog;

.field public final synthetic f$4:Le/e/a/AccountLists$Created;

.field public final synthetic f$5:Landroid/widget/EditText;

.field public final synthetic f$6:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZLandroid/app/Activity;Landroid/app/AlertDialog;Le/e/a/AccountLists$Created;Landroid/widget/EditText;Landroid/content/Context;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$0:Ljava/lang/String;

    iput-boolean p2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$1:Z

    iput-object p3, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$2:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$3:Landroid/app/AlertDialog;

    iput-object p5, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$4:Le/e/a/AccountLists$Created;

    iput-object p6, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$5:Landroid/widget/EditText;

    iput-object p7, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$6:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$0:Ljava/lang/String;

    iget-boolean v1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$1:Z

    iget-object v2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$2:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$3:Landroid/app/AlertDialog;

    iget-object v4, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$4:Le/e/a/AccountLists$Created;

    iget-object v5, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$5:Landroid/widget/EditText;

    iget-object v6, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda5;->f$6:Landroid/content/Context;

    invoke-static/range {v0 .. v6}, Le/e/a/AccountLists;->lambda$8(Ljava/lang/String;ZLandroid/app/Activity;Landroid/app/AlertDialog;Le/e/a/AccountLists$Created;Landroid/widget/EditText;Landroid/content/Context;)V

    return-void
.end method
