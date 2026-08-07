.class public final synthetic Ll/dqa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gqa0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;


# direct methods
.method public synthetic constructor <init>(Ll/gqa0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dqa0;->a:Ll/gqa0;

    iput-object p2, p0, Ll/dqa0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dqa0;->a:Ll/gqa0;

    iget-object p0, p0, Ll/dqa0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {v0, p0, p1}, Ll/gqa0;->f0(Ll/gqa0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Landroid/os/Bundle;)V

    return-void
.end method
