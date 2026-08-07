.class public final synthetic Ll/z0k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/UpdateApiResult;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/UpdateApiResult;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z0k0;->a:Lcom/p1/mobile/putong/data/UpdateApiResult;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z0k0;->a:Lcom/p1/mobile/putong/data/UpdateApiResult;

    invoke-static {p0, p1}, Ll/d1k0;->g(Lcom/p1/mobile/putong/data/UpdateApiResult;Landroid/content/DialogInterface;)V

    return-void
.end method
