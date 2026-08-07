.class public final synthetic Ll/zg5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jh5;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zg5;->a:Ll/jh5;

    iput-object p2, p0, Ll/zg5;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/zg5;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p4, p0, Ll/zg5;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zg5;->a:Ll/jh5;

    iget-object v1, p0, Ll/zg5;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v2, p0, Ll/zg5;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object p0, p0, Ll/zg5;->d:Ljava/lang/String;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, v2, p0, p1}, Ll/jh5;->u(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
