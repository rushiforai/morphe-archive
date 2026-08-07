.class public Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$a;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$a;->a:Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$a;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$a;->a:Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->onClick(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$a;->a:Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;

    .line 2
    .line 3
    new-instance v1, Ll/q1r;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/q1r;-><init>(Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$a;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
