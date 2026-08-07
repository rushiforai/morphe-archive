.class public final synthetic Ll/ak80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ak80;->a:Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ak80;->a:Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;->k(Lcom/p1/mobile/putong/core/ui/debug/PopDebugLayout;)V

    return-void
.end method
