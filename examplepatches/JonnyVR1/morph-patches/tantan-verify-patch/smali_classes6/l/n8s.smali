.class public final synthetic Ll/n8s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/LiveDialogAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/LiveDialogAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n8s;->a:Lcom/p1/mobile/putong/live/LiveDialogAct;

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n8s;->a:Lcom/p1/mobile/putong/live/LiveDialogAct;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/LiveDialogAct;->X1(Lcom/p1/mobile/putong/live/LiveDialogAct;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method
