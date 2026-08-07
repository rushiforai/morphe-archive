.class public final synthetic Ll/eza0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Literatures;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/LiteraturesComments;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eza0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;

    iput-object p2, p0, Ll/eza0;->b:Lcom/p1/mobile/putong/core/data/Literatures;

    iput-object p3, p0, Ll/eza0;->c:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eza0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;

    iget-object v1, p0, Ll/eza0;->b:Lcom/p1/mobile/putong/core/data/Literatures;

    iget-object p0, p0, Ll/eza0;->c:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;->b(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileRecentlyNewItem;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;Ljava/util/List;)V

    return-void
.end method
