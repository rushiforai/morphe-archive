.class public final synthetic Ll/lk70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

.field public final synthetic b:I

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;ILjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lk70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    iput p2, p0, Ll/lk70;->b:I

    iput-object p3, p0, Ll/lk70;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lk70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    iget v1, p0, Ll/lk70;->b:I

    iget-object p0, p0, Ll/lk70;->c:Ljava/util/List;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->g(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;ILjava/util/List;Ljava/lang/Long;)V

    return-void
.end method
