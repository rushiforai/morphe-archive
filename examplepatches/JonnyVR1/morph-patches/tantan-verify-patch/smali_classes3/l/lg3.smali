.class public final synthetic Ll/lg3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;

.field public final synthetic b:Ll/uf3;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;Ll/uf3;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lg3;->a:Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;

    iput-object p2, p0, Ll/lg3;->b:Ll/uf3;

    iput-object p3, p0, Ll/lg3;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lg3;->a:Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;

    iget-object v1, p0, Ll/lg3;->b:Ll/uf3;

    iget-object p0, p0, Ll/lg3;->c:Ll/x20;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;->H(Lcom/p1/mobile/putong/ui/square/BubbleRecyclerView;Ll/uf3;Ll/x20;)V

    return-void
.end method
