.class public Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->Y1(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/x20;


# direct methods
.method public constructor <init>(ILcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$a;->a:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$a;->c:Ll/x20;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$a;->a:I

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->unregisterOnActivityResultListener(Lcom/p1/mobile/android/app/a$a;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$a;->c:Ll/x20;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$a;->c:Ll/x20;

    .line 19
    .line 20
    invoke-interface {p0}, Ll/x20;->call()V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method
