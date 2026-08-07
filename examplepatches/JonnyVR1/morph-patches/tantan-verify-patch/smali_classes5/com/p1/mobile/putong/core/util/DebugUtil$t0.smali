.class public Lcom/p1/mobile/putong/core/util/DebugUtil$t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->Bj(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->k:Ll/sry;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/sry;->deleteAll()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/ded;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ded;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
