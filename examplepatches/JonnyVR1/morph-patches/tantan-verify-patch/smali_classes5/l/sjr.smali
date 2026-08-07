.class public final synthetic Ll/sjr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/likers/a;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sjr;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    iput-object p2, p0, Ll/sjr;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/sjr;->c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sjr;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    iget-object v1, p0, Ll/sjr;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/sjr;->c:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->J(Lcom/p1/mobile/putong/core/ui/vip/likers/a;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView;)V

    return-void
.end method
