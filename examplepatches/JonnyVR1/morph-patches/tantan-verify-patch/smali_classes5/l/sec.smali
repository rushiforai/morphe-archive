.class public final synthetic Ll/sec;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic c:Ll/b240;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;Ll/b240;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sec;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ll/sec;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    iput-object p3, p0, Ll/sec;->c:Ll/b240;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sec;->a:Ljava/util/ArrayList;

    iget-object v1, p0, Ll/sec;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object p0, p0, Ll/sec;->c:Ll/b240;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->t8(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;Ll/b240;)V

    return-void
.end method
