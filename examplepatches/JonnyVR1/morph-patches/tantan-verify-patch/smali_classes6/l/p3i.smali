.class public final synthetic Ll/p3i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;Ljava/util/List;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p3i;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;

    iput-object p2, p0, Ll/p3i;->b:Ljava/util/List;

    iput-object p3, p0, Ll/p3i;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p3i;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;

    iget-object v1, p0, Ll/p3i;->b:Ljava/util/List;

    iget-object p0, p0, Ll/p3i;->c:Ll/x20;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;->F(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/a;Ljava/util/List;Ll/x20;)V

    return-void
.end method
