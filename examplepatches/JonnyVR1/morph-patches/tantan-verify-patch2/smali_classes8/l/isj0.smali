.class public final synthetic Ll/isj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/lsj0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/DislikedUsers;


# direct methods
.method public synthetic constructor <init>(Ll/lsj0;Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/isj0;->a:Ll/lsj0;

    iput-object p2, p0, Ll/isj0;->b:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;

    iput-object p3, p0, Ll/isj0;->c:Lcom/p1/mobile/putong/core/data/DislikedUsers;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/isj0;->a:Ll/lsj0;

    iget-object v1, p0, Ll/isj0;->b:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;

    iget-object p0, p0, Ll/isj0;->c:Lcom/p1/mobile/putong/core/data/DislikedUsers;

    invoke-static {v0, v1, p0}, Ll/lsj0;->G(Ll/lsj0;Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;Lcom/p1/mobile/putong/core/data/DislikedUsers;)V

    return-void
.end method
