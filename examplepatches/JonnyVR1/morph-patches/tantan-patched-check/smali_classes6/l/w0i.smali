.class public final synthetic Ll/w0i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lrx/subjects/b;

.field public final synthetic b:Lcom/tantanapp/common/data/JsonAdapter;


# direct methods
.method public synthetic constructor <init>(Lrx/subjects/b;Lcom/tantanapp/common/data/JsonAdapter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w0i;->a:Lrx/subjects/b;

    iput-object p2, p0, Ll/w0i;->b:Lcom/tantanapp/common/data/JsonAdapter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0i;->a:Lrx/subjects/b;

    iget-object p0, p0, Ll/w0i;->b:Lcom/tantanapp/common/data/JsonAdapter;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->a0(Lrx/subjects/b;Lcom/tantanapp/common/data/JsonAdapter;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
