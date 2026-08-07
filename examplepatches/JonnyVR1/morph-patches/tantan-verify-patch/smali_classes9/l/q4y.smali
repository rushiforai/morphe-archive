.class public final synthetic Ll/q4y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Video;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Video;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q4y;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    iput-object p2, p0, Ll/q4y;->b:Lcom/p1/mobile/putong/data/Video;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q4y;->a:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    iget-object p0, p0, Ll/q4y;->b:Lcom/p1/mobile/putong/data/Video;

    check-cast p1, [I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;Lcom/p1/mobile/putong/data/Video;[I)V

    return-void
.end method
