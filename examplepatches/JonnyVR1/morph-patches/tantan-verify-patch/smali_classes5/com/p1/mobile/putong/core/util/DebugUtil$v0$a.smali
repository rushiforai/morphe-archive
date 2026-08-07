.class public Lcom/p1/mobile/putong/core/util/DebugUtil$v0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil$v0;->call()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/util/DebugUtil$v0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/util/DebugUtil$v0;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$v0$a;->b:Lcom/p1/mobile/putong/core/util/DebugUtil$v0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$v0$a;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "132375"

    .line 10
    .line 11
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "\u6635\u79f0"

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "\u7231\u751f\u6d3b\uff0c\u7231\u8fd0\u52a8\uff0c\u7231\u7f8e\u98df\r\n\u7231\u65c5\u884c\u3001\u7231\u901b\u5bb6\u5177\u5e97"

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {}, Ll/wgx;->A()Ll/wgx;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$v0$a;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-virtual {v1, p0, v0, v2}, Ll/wgx;->K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
