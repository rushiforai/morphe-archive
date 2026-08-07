.class public final synthetic Ll/gm2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gm2;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;

    iput-object p2, p0, Ll/gm2;->b:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gm2;->a:Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;

    iget-object p0, p0, Ll/gm2;->b:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;->N4(Lcom/p1/mobile/putong/core/newui/home/frag/base/BaseHomeLayoutFrag;Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    return-void
.end method
