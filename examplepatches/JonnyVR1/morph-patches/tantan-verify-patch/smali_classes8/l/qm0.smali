.class public final synthetic Ll/qm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qm0;->a:Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qm0;->a:Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/likedusers/anchor/LiveHaloAvatar;->setAvatar(Landroid/graphics/Bitmap;)V

    return-void
.end method
