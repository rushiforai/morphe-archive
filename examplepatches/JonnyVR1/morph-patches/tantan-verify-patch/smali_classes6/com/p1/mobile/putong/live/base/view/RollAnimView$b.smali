.class public Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/view/RollAnimView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/view/RollAnimView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/view/RollAnimView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;->a:Lcom/p1/mobile/putong/live/base/view/RollAnimView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/view/RollAnimView;Ll/ldd0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;-><init>(Lcom/p1/mobile/putong/live/base/view/RollAnimView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;->a:Lcom/p1/mobile/putong/live/base/view/RollAnimView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->N()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;->a:Lcom/p1/mobile/putong/live/base/view/RollAnimView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->v(Lcom/p1/mobile/putong/live/base/view/RollAnimView;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-long v1, v1

    .line 13
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method
