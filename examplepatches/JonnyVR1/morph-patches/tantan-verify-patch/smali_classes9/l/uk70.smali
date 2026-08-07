.class public final synthetic Ll/uk70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uk70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    iput-object p2, p0, Ll/uk70;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uk70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    iget-object p0, p0, Ll/uk70;->b:Ljava/util/List;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ljava/util/List;)V

    return-void
.end method
