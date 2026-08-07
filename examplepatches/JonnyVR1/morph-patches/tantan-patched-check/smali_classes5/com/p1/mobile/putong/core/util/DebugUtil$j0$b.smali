.class public Lcom/p1/mobile/putong/core/util/DebugUtil$j0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil$j0;->call()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/util/DebugUtil$j0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/util/DebugUtil$j0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0$b;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$j0;

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
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0$b;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$j0;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$j0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ud(Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
