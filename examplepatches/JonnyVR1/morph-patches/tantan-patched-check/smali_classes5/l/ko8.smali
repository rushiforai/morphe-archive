.class public final synthetic Ll/ko8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ko8;->a:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ko8;->a:Ljava/lang/Runnable;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->W0(Ljava/lang/Runnable;Landroid/content/DialogInterface;)V

    return-void
.end method
