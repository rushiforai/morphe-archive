.class public final synthetic Le/e/a/Nicoad190$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# instance fields
.field public final synthetic f$0:Landroid/webkit/WebView;

.field public final synthetic f$1:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Landroid/webkit/WebView;Landroid/app/Dialog;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Nicoad190$$ExternalSyntheticLambda4;->f$0:Landroid/webkit/WebView;

    iput-object p2, p0, Le/e/a/Nicoad190$$ExternalSyntheticLambda4;->f$1:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/Nicoad190$$ExternalSyntheticLambda4;->f$0:Landroid/webkit/WebView;

    iget-object v1, p0, Le/e/a/Nicoad190$$ExternalSyntheticLambda4;->f$1:Landroid/app/Dialog;

    invoke-static {v0, v1, p1, p2, p3}, Le/e/a/Nicoad190;->lambda$4(Landroid/webkit/WebView;Landroid/app/Dialog;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
