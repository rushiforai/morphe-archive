.class public final synthetic Ll/col0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/active/VipActiveCard;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Active;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/active/VipActiveCard;Lcom/p1/mobile/putong/core/data/Active;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/col0;->a:Lcom/p1/mobile/putong/core/ui/active/VipActiveCard;

    iput-object p2, p0, Ll/col0;->b:Lcom/p1/mobile/putong/core/data/Active;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/col0;->a:Lcom/p1/mobile/putong/core/ui/active/VipActiveCard;

    iget-object p0, p0, Ll/col0;->b:Lcom/p1/mobile/putong/core/data/Active;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/active/VipActiveCard;->a(Lcom/p1/mobile/putong/core/ui/active/VipActiveCard;Lcom/p1/mobile/putong/core/data/Active;)V

    return-void
.end method
