.class public final synthetic Ll/yfh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ogh;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/ogh;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yfh;->a:Ll/ogh;

    iput-object p2, p0, Ll/yfh;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-boolean p3, p0, Ll/yfh;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yfh;->a:Ll/ogh;

    iget-object v1, p0, Ll/yfh;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-boolean p0, p0, Ll/yfh;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Ll/ogh;->b(Ll/ogh;Lcom/p1/mobile/putong/feed/data/Moment;ZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
