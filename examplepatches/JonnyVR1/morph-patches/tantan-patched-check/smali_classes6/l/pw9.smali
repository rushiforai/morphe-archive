.class public final synthetic Ll/pw9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/b;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/b;Ll/y20;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pw9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iput-object p2, p0, Ll/pw9;->b:Ll/y20;

    iput-object p3, p0, Ll/pw9;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pw9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iget-object v1, p0, Ll/pw9;->b:Ll/y20;

    iget-object p0, p0, Ll/pw9;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->v2(Lcom/p1/mobile/putong/feed/api/b;Ll/y20;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Throwable;)V

    return-void
.end method
