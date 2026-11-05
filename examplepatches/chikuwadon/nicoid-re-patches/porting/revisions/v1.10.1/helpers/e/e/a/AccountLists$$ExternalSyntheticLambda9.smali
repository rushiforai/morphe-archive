.class public final synthetic Le/e/a/AccountLists$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/Spinner;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:Landroid/app/AlertDialog;

.field public final synthetic f$4:Ljava/lang/String;

.field public final synthetic f$5:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Spinner;Ljava/util/ArrayList;Landroid/widget/EditText;Landroid/app/AlertDialog;Ljava/lang/String;Landroid/app/Activity;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$0:Landroid/widget/Spinner;

    iput-object p2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$2:Landroid/widget/EditText;

    iput-object p4, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$3:Landroid/app/AlertDialog;

    iput-object p5, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$4:Ljava/lang/String;

    iput-object p6, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$5:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$0:Landroid/widget/Spinner;

    iget-object v1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$2:Landroid/widget/EditText;

    iget-object v3, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$3:Landroid/app/AlertDialog;

    iget-object v4, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$4:Ljava/lang/String;

    iget-object v5, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda9;->f$5:Landroid/app/Activity;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Le/e/a/AccountLists;->lambda$4(Landroid/widget/Spinner;Ljava/util/ArrayList;Landroid/widget/EditText;Landroid/app/AlertDialog;Ljava/lang/String;Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method
