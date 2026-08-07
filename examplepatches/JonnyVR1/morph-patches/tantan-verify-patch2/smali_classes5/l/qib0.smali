.class public final synthetic Ll/qib0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qib0;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qib0;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->H(Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;Landroid/content/DialogInterface;)V

    return-void
.end method
