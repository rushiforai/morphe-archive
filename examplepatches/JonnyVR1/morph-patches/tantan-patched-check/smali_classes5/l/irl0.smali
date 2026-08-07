.class public final synthetic Ll/irl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/krl0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/MessageLocation;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;


# direct methods
.method public synthetic constructor <init>(Ll/krl0;Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/irl0;->a:Ll/krl0;

    iput-object p2, p0, Ll/irl0;->b:Lcom/p1/mobile/putong/data/MessageLocation;

    iput-object p3, p0, Ll/irl0;->c:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/irl0;->a:Ll/krl0;

    iget-object v1, p0, Ll/irl0;->b:Lcom/p1/mobile/putong/data/MessageLocation;

    iget-object p0, p0, Ll/irl0;->c:Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;

    check-cast p1, Ll/z80;

    invoke-static {v0, v1, p0, p1}, Ll/krl0;->t(Ll/krl0;Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;Ll/z80;)V

    return-void
.end method
