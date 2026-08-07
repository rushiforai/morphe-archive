.class public final synthetic Ll/kg3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kg3;->a:Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;

    iput-object p2, p0, Ll/kg3;->b:Ljava/util/List;

    iput-object p3, p0, Ll/kg3;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kg3;->a:Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;

    iget-object v1, p0, Ll/kg3;->b:Ljava/util/List;

    iget-object p0, p0, Ll/kg3;->c:Ljava/util/List;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->I(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method
