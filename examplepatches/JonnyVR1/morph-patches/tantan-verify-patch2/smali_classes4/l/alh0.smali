.class public final synthetic Ll/alh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/alh0;->a:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/alh0;->a:Ll/x20;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/t0;->p(Ll/x20;Landroid/content/DialogInterface;)V

    return-void
.end method
