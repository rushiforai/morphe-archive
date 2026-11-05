.class public final synthetic Le/e/a/Nicoad190$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic f$0:Landroid/webkit/WebView;

.field public final synthetic f$1:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Landroid/webkit/WebView;Landroid/widget/LinearLayout;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Nicoad190$$ExternalSyntheticLambda5;->f$0:Landroid/webkit/WebView;

    iput-object p2, p0, Le/e/a/Nicoad190$$ExternalSyntheticLambda5;->f$1:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/Nicoad190$$ExternalSyntheticLambda5;->f$0:Landroid/webkit/WebView;

    iget-object v1, p0, Le/e/a/Nicoad190$$ExternalSyntheticLambda5;->f$1:Landroid/widget/LinearLayout;

    invoke-static {v0, v1, p1}, Le/e/a/Nicoad190;->lambda$5(Landroid/webkit/WebView;Landroid/widget/LinearLayout;Landroid/content/DialogInterface;)V

    return-void
.end method
