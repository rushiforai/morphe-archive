.class public Lcom/p1/mobile/putong/core/newui/home/b$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$e;->a:Lcom/p1/mobile/putong/core/newui/home/b;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$e;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/b;->I0:Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->G1(Lcom/p1/mobile/putong/core/newui/home/b;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$e;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b;->I0:Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->E()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
