.class public final synthetic Ll/lh20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lh20;->a:Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lh20;->a:Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;->y0(Lcom/p1/mobile/putong/core/newui/nearby/NearbyPresenter;Landroid/net/NetworkInfo;)V

    return-void
.end method
