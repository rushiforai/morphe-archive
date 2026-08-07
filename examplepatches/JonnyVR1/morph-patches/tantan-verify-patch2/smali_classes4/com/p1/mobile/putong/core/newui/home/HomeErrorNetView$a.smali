.class public Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView$a;->a:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView$a;->a:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;->i(Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView$a;->a:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;->k()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
