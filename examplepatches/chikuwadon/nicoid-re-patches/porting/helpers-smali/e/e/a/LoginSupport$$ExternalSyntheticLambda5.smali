.class public final synthetic Le/e/a/LoginSupport$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LoginSupport$$ExternalSyntheticLambda5;->f$0:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/LoginSupport$$ExternalSyntheticLambda5;->f$0:Landroid/widget/EditText;

    invoke-static {v0, p1}, Le/e/a/LoginSupport;->lambda$input$5(Landroid/widget/EditText;Landroid/content/DialogInterface;)V

    return-void
.end method
