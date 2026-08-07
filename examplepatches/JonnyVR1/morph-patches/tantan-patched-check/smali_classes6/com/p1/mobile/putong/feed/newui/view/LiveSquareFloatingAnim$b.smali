.class public Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim$b;->a:Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim;Ll/g2u;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim$b;-><init>(Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim$b;->a:Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim;->a(Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim$b;->a:Lcom/p1/mobile/putong/feed/newui/view/LiveSquareFloatingAnim;

    .line 7
    .line 8
    const-wide/16 v1, 0x7d0

    .line 9
    .line 10
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method
