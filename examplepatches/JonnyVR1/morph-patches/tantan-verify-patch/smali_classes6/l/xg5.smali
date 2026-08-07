.class public final synthetic Ll/xg5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/jh5;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xg5;->a:Ll/jh5;

    iput-object p2, p0, Ll/xg5;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/xg5;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p4, p0, Ll/xg5;->d:Ll/x20;

    iput-object p5, p0, Ll/xg5;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xg5;->a:Ll/jh5;

    iget-object v1, p0, Ll/xg5;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v2, p0, Ll/xg5;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object v3, p0, Ll/xg5;->d:Ll/x20;

    iget-object p0, p0, Ll/xg5;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Ll/jh5;->t(Ll/jh5;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;Ljava/lang/String;)V

    return-void
.end method
