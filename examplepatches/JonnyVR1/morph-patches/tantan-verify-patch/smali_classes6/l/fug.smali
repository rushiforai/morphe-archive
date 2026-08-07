.class public final synthetic Ll/fug;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;


# instance fields
.field public final synthetic a:Ll/gug;

.field public final synthetic b:Ljava/util/HashMap;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Ll/gug;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fug;->a:Ll/gug;

    iput-object p2, p0, Ll/fug;->b:Ljava/util/HashMap;

    iput-object p3, p0, Ll/fug;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fug;->a:Ll/gug;

    iget-object v1, p0, Ll/fug;->b:Ljava/util/HashMap;

    iget-object p0, p0, Ll/fug;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, v1, p0, p1}, Ll/gug;->p(Ll/gug;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    return-void
.end method
