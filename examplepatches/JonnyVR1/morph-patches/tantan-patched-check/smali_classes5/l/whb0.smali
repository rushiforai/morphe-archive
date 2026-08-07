.class public final synthetic Ll/whb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/whb0;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/whb0;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;Landroid/content/DialogInterface;)V

    return-void
.end method
