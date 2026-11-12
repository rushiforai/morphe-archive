.class public final synthetic Ljpg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Lbz0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lbz0;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljpg;->a:Lbz0;

    iput-boolean p2, p0, Ljpg;->b:Z

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .registers 3

    iget-object v0, p0, Ljpg;->a:Lbz0;

    iget-boolean p0, p0, Ljpg;->b:Z

    invoke-static {v0, p0, p1}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->a(Lbz0;ZLandroid/content/DialogInterface;)V

    return-void
.end method
