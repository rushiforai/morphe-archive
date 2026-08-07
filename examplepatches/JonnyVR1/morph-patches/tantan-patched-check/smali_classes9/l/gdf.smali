.class public final synthetic Ll/gdf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gdf;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    iput-object p2, p0, Ll/gdf;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/gdf;->c:Lcom/p1/mobile/putong/data/Media;

    iput p4, p0, Ll/gdf;->d:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gdf;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    iget-object v1, p0, Ll/gdf;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/gdf;->c:Lcom/p1/mobile/putong/data/Media;

    iget p0, p0, Ll/gdf;->d:I

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->a0(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;I)V

    return-void
.end method
