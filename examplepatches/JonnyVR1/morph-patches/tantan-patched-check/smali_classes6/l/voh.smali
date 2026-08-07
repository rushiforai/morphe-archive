.class public final synthetic Ll/voh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fph;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Ll/fph;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/voh;->a:Ll/fph;

    iput-object p2, p0, Ll/voh;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/voh;->c:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/voh;->a:Ll/fph;

    iget-object v1, p0, Ll/voh;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/voh;->c:Ljava/util/HashMap;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/fph;->v(Ll/fph;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;Ljava/lang/Throwable;)V

    return-void
.end method
