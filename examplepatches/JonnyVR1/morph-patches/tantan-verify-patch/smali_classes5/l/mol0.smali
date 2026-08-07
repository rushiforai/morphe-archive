.class public final synthetic Ll/mol0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/result/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/result/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mol0;->a:Lcom/p1/mobile/putong/core/ui/result/a;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mol0;->a:Lcom/p1/mobile/putong/core/ui/result/a;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/a;->a(Lcom/p1/mobile/putong/core/ui/result/a;Landroid/content/DialogInterface;)V

    return-void
.end method
