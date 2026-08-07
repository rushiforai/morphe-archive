.class public final synthetic Ll/mv50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mv50;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mv50;->a:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/data/Tag;

    check-cast p2, Lcom/p1/mobile/putong/data/Tag;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->r(Ljava/util/List;Lcom/p1/mobile/putong/data/Tag;Lcom/p1/mobile/putong/data/Tag;)I

    move-result p0

    return p0
.end method
