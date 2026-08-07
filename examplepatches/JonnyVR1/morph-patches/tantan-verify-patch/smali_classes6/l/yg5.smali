.class public final synthetic Ll/yg5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jh5;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/jh5;Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yg5;->a:Ll/jh5;

    iput-object p2, p0, Ll/yg5;->b:Ll/x20;

    iput-object p3, p0, Ll/yg5;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p4, p0, Ll/yg5;->d:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p5, p0, Ll/yg5;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/yg5;->a:Ll/jh5;

    iget-object v1, p0, Ll/yg5;->b:Ll/x20;

    iget-object v2, p0, Ll/yg5;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v3, p0, Ll/yg5;->d:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object v4, p0, Ll/yg5;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static/range {v0 .. v5}, Ll/jh5;->A(Ll/jh5;Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method
