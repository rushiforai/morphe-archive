.class public Lcom/p1/mobile/putong/core/util/DebugUtil$u0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil$u0;->call()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/util/DebugUtil$u0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/util/DebugUtil$u0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$u0$b;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$u0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/PopGuide;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/PopGuide;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "50141"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PopGuide;->userId:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "\u6211\u53d1\u5e03\u4e86\u65b0\u7684\u52a8\u6001"

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PopGuide;->guide:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "https://imgoldjii.oss-cn-beijing.aliyuncs.com/7821672838116_.pic.jpg"

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PopGuide;->icon:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$u0$b;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$u0;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$u0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d6()Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->z0(Lcom/p1/mobile/putong/core/data/PopGuide;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
