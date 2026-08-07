.class public final synthetic Ll/il70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

.field public final synthetic b:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/il70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    iput-object p2, p0, Ll/il70;->b:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/il70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    iget-object p0, p0, Ll/il70;->b:Ljava/util/HashMap;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->f0(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;Ljava/util/HashMap;)V

    return-void
.end method
