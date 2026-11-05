.class public final synthetic Le/e/a/AccountLists$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Landroid/widget/CheckBox;

.field public final synthetic f$3:Landroid/app/AlertDialog;

.field public final synthetic f$4:Landroid/app/Activity;

.field public final synthetic f$5:Le/e/a/AccountLists$Created;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Landroid/content/Context;Landroid/widget/CheckBox;Landroid/app/AlertDialog;Landroid/app/Activity;Le/e/a/AccountLists$Created;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$0:Landroid/widget/EditText;

    iput-object p2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$1:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$2:Landroid/widget/CheckBox;

    iput-object p4, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$3:Landroid/app/AlertDialog;

    iput-object p5, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$4:Landroid/app/Activity;

    iput-object p6, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$5:Le/e/a/AccountLists$Created;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$0:Landroid/widget/EditText;

    iget-object v1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$1:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$2:Landroid/widget/CheckBox;

    iget-object v3, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$3:Landroid/app/AlertDialog;

    iget-object v4, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$4:Landroid/app/Activity;

    iget-object v5, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda0;->f$5:Le/e/a/AccountLists$Created;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Le/e/a/AccountLists;->lambda$7(Landroid/widget/EditText;Landroid/content/Context;Landroid/widget/CheckBox;Landroid/app/AlertDialog;Landroid/app/Activity;Le/e/a/AccountLists$Created;Landroid/view/View;)V

    return-void
.end method
