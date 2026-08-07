.class public Ll/el50$a;
.super Ll/rx3;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/el50;->h(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/data/OMSDialogInfo;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/p1/mobile/putong/app/PutongAct;

.field final synthetic val$dialog:Lcom/p1/mobile/android/app/Dialog;

.field final synthetic val$dialogInfo:Lcom/p1/mobile/putong/data/OMSDialogInfo;

.field final synthetic val$needRecoding:Z

.field final synthetic val$width:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/putong/app/PutongAct;ZLcom/p1/mobile/putong/data/OMSDialogInfo;I)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/el50$a;->val$dialog:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    iput-object p3, p0, Ll/el50$a;->val$act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    iput-boolean p4, p0, Ll/el50$a;->val$needRecoding:Z

    .line 6
    .line 7
    iput-object p5, p0, Ll/el50$a;->val$dialogInfo:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 8
    .line 9
    iput p6, p0, Ll/el50$a;->val$width:I

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/rx3;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onPageFinishedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/rx3;->onPageFinishedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/el50$a;->val$dialog:Lcom/p1/mobile/android/app/Dialog;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Ll/el50$a;->val$act:Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    iget-boolean p1, p0, Ll/el50$a;->val$needRecoding:Z

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p2, p0, Ll/el50$a;->val$dialogInfo:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 33
    .line 34
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 35
    .line 36
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 37
    .line 38
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->userDimension:Z

    .line 39
    .line 40
    xor-int/lit8 p2, p2, 0x1

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {p1, v0, v1, p2}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Ll/el50$a;->val$dialog:Lcom/p1/mobile/android/app/Dialog;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/el50$a;->val$dialog:Lcom/p1/mobile/android/app/Dialog;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    const/16 v0, 0x11

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/view/Window;->setGravity(I)V

    .line 64
    .line 65
    .line 66
    iget p0, p0, Ll/el50$a;->val$width:I

    .line 67
    .line 68
    iput p0, p2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 69
    .line 70
    sget p0, Ll/cbc0;->b:I

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, p2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method
