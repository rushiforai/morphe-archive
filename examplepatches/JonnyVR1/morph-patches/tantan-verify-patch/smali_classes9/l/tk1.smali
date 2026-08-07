.class public final synthetic Ll/tk1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tk1;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    iput-object p2, p0, Ll/tk1;->b:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tk1;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    iget-object p0, p0, Ll/tk1;->b:Lcom/p1/mobile/putong/data/Media;

    check-cast p1, [I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->G(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/data/Media;[I)V

    return-void
.end method
