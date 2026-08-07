.class public final synthetic Ll/vhz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/clz;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vhz;->a:Ll/clz;

    iput-object p2, p0, Ll/vhz;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-wide p3, p0, Ll/vhz;->c:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vhz;->a:Ll/clz;

    iget-object v1, p0, Ll/vhz;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-wide v2, p0, Ll/vhz;->c:J

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, v2, v3, p1}, Ll/clz;->k2(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;JLjava/util/List;)V

    return-void
.end method
