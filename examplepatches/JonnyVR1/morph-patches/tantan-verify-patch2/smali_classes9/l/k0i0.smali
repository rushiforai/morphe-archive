.class public final synthetic Ll/k0i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/f;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k0i0;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k0i0;->a:Lcom/p1/mobile/putong/core/ui/purchase/f;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/f;->b(Lcom/p1/mobile/putong/core/ui/purchase/f;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method
