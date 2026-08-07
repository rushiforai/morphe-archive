.class public final synthetic Ll/btg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;


# instance fields
.field public final synthetic a:Ll/dtg;

.field public final synthetic b:Ljava/util/HashMap;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Ll/dtg;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/btg;->a:Ll/dtg;

    iput-object p2, p0, Ll/btg;->b:Ljava/util/HashMap;

    iput-object p3, p0, Ll/btg;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/btg;->a:Ll/dtg;

    iget-object v1, p0, Ll/btg;->b:Ljava/util/HashMap;

    iget-object p0, p0, Ll/btg;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, v1, p0, p1}, Ll/dtg;->a(Ll/dtg;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    return-void
.end method
