.class public final synthetic Ll/sqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vqn;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;


# direct methods
.method public synthetic constructor <init>(Ll/vqn;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sqn;->a:Ll/vqn;

    iput-object p2, p0, Ll/sqn;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/sqn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sqn;->a:Ll/vqn;

    iget-object v1, p0, Ll/sqn;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/sqn;->c:Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeUser;

    invoke-static {v0, v1, p0, p1}, Ll/vqn;->G(Ll/vqn;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Lcom/p1/mobile/putong/core/data/LikeUser;)V

    return-void
.end method
