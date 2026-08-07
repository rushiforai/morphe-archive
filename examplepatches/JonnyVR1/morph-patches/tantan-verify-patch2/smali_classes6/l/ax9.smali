.class public final synthetic Ll/ax9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/b;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/b;Ll/y20;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ax9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iput-object p2, p0, Ll/ax9;->b:Ll/y20;

    iput-object p3, p0, Ll/ax9;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ax9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iget-object v1, p0, Ll/ax9;->b:Ll/y20;

    iget-object p0, p0, Ll/ax9;->c:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->L2(Lcom/p1/mobile/putong/feed/api/b;Ll/y20;Ll/y20;Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
