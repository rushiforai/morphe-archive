.class public final synthetic Ll/ag3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ag3;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    iput-object p2, p0, Ll/ag3;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ag3;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    iget-object p0, p0, Ll/ag3;->b:Ll/y20;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->e(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;Ll/y20;)V

    return-void
.end method
