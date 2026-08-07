.class public final synthetic Ll/ow9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/b;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ow9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iput-object p2, p0, Ll/ow9;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ow9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iget-object p0, p0, Ll/ow9;->b:Ljava/lang/String;

    check-cast p1, Ljava/util/List;

    check-cast p2, Lcom/p1/mobile/putong/data/DbLinks;

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->N1(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    move-result-object p0

    return-object p0
.end method
