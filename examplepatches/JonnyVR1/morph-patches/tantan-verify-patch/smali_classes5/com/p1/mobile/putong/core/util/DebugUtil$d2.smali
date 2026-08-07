.class public Lcom/p1/mobile/putong/core/util/DebugUtil$d2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->xj(Lcom/p1/mobile/putong/core/newui/home/b;Ll/b240;)Ljava/util/ArrayList;
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
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 4
    .line 5
    const-string v1, "fake_conversation_local_summary_marriage_conversation"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/wzh0;->delete(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v0, Ll/nhd;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/nhd;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
