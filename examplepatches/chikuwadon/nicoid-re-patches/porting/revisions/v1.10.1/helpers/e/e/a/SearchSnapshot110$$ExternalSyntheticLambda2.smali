.class public final synthetic Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;

.field public final synthetic f$1:Landroid/widget/EditText;

.field public final synthetic f$2:[I

.field public final synthetic f$3:Landroid/content/Context;

.field public final synthetic f$4:Landroid/content/SharedPreferences;

.field public final synthetic f$5:Ljava/lang/Runnable;

.field public final synthetic f$6:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Landroid/widget/EditText;[ILandroid/content/Context;Landroid/content/SharedPreferences;Ljava/lang/Runnable;Landroid/app/AlertDialog;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$0:Landroid/widget/EditText;

    iput-object p2, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$1:Landroid/widget/EditText;

    iput-object p3, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$2:[I

    iput-object p4, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$3:Landroid/content/Context;

    iput-object p5, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$4:Landroid/content/SharedPreferences;

    iput-object p6, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$5:Ljava/lang/Runnable;

    iput-object p7, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$6:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$0:Landroid/widget/EditText;

    iget-object v1, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$1:Landroid/widget/EditText;

    iget-object v2, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$2:[I

    iget-object v3, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$3:Landroid/content/Context;

    iget-object v4, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$4:Landroid/content/SharedPreferences;

    iget-object v5, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$5:Ljava/lang/Runnable;

    iget-object v6, p0, Le/e/a/SearchSnapshot110$$ExternalSyntheticLambda2;->f$6:Landroid/app/AlertDialog;

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Le/e/a/SearchSnapshot110;->lambda$6(Landroid/widget/EditText;Landroid/widget/EditText;[ILandroid/content/Context;Landroid/content/SharedPreferences;Ljava/lang/Runnable;Landroid/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
