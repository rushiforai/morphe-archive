.class public final synthetic Ll/kw50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kw50;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/kw50;->b:Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kw50;->a:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/kw50;->b:Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter;->p0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/onlinezone/OnlineZonePresenter;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
