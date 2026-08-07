.class public Lcom/p1/mobile/putong/core/util/DebugUtil$w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->Lj(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$w0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$w0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$w0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$w0;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/putong/core/util/DebugUtil$w0$a;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$w0$a;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$w0;)V

    .line 11
    .line 12
    .line 13
    const-string v2, "\u5f39\u51fa\u6d4b\u8bd5\u5f39\u7a97\uff1adeeplink\u53d1\u6d88\u606f"

    .line 14
    .line 15
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$w0;->a:Ljava/util/ArrayList;

    .line 23
    .line 24
    new-instance v1, Lcom/p1/mobile/putong/core/util/DebugUtil$w0$b;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$w0$b;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$w0;)V

    .line 27
    .line 28
    .line 29
    const-string v2, "\u5f39\u51fa\u6d4b\u8bd5\u5f39\u7a97\uff1adeeplink\u8df3\u8f6c\u804a\u5929\u9875\uff0c\u586b\u5165\u6d88\u606f\u5e76\u5f39\u8d77\u952e\u76d8"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$w0;->a:Ljava/util/ArrayList;

    .line 39
    .line 40
    new-instance v1, Lcom/p1/mobile/putong/core/util/DebugUtil$w0$c;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$w0$c;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$w0;)V

    .line 43
    .line 44
    .line 45
    const-string v2, "\u5f39\u51fa\u6d4b\u8bd5\u5f39\u7a97\uff1adeeplink\u8df3\u8f6c\u804a\u5929\u9875\uff0c\u81ea\u52a8\u53d1\u9001\u6d88\u606f"

    .line 46
    .line 47
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$w0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$w0;->a:Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
