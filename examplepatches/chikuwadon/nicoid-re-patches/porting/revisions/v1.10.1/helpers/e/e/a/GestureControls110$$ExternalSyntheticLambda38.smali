.class public final synthetic Le/e/a/GestureControls110$$ExternalSyntheticLambda38;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Landroid/app/AlertDialog;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda38;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda38;->f$1:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda38;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/GestureControls110$$ExternalSyntheticLambda38;->f$1:Landroid/app/AlertDialog;

    invoke-static {v0, v1, p1}, Le/e/a/GestureControls110;->lambda$14(Landroid/app/Activity;Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V

    return-void
.end method
