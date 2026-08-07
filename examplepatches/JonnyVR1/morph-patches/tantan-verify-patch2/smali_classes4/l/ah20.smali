.class public final synthetic Ll/ah20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ah20;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/ah20;->b:Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ah20;->a:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/ah20;->b:Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;->h0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;)V

    return-void
.end method
