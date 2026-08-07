.class public final synthetic Ll/dk80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dk80;->a:Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dk80;->a:Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->j(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;Landroid/view/View;)V

    return-void
.end method
