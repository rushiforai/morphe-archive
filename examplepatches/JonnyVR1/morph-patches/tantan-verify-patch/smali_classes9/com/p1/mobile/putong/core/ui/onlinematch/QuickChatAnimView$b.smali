.class public Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;Ll/xyb0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/Random;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a(Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a(Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    add-int/2addr v0, v1

    .line 28
    int-to-long v0, v0

    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;

    .line 30
    .line 31
    invoke-virtual {v2, p0, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method
