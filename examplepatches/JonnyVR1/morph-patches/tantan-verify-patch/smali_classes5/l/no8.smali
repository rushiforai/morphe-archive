.class public final synthetic Ll/no8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/Runnable;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/no8;->a:Z

    iput-object p2, p0, Ll/no8;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/no8;->c:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/no8;->a:Z

    iget-object v1, p0, Ll/no8;->b:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/no8;->c:Lcom/p1/mobile/android/app/Dialog;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->D0(ZLjava/lang/Runnable;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V

    return-void
.end method
