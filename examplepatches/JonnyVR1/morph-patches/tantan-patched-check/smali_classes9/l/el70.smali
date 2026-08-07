.class public final synthetic Ll/el70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

.field public final synthetic b:Ll/bvx;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;Ll/bvx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/el70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    iput-object p2, p0, Ll/el70;->b:Ll/bvx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/el70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    iget-object p0, p0, Ll/el70;->b:Ll/bvx;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->e0(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;Ll/bvx;Ljava/util/List;)V

    return-void
.end method
