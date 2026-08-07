.class public final synthetic Ll/lk1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lk1;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    iput-object p2, p0, Ll/lk1;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/lk1;->c:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lk1;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    iget-object v1, p0, Ll/lk1;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/lk1;->c:Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->U(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
