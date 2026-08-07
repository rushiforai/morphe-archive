.class public final synthetic Ll/nhr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ohr;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;


# direct methods
.method public synthetic constructor <init>(Ll/ohr;Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nhr;->a:Ll/ohr;

    iput-object p2, p0, Ll/nhr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nhr;->a:Ll/ohr;

    iget-object p0, p0, Ll/nhr;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, p0, p1}, Ll/ohr;->I(Ll/ohr;Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;Z)V

    return-void
.end method
