.class public final synthetic Ll/u9b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u9b0;->a:Lcom/p1/mobile/putong/core/ui/purchase/b;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u9b0;->a:Lcom/p1/mobile/putong/core/ui/purchase/b;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->d(Lcom/p1/mobile/putong/core/ui/purchase/b;Landroid/content/DialogInterface;)V

    return-void
.end method
