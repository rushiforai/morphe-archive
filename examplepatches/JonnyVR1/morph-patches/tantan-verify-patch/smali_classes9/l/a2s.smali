.class public final synthetic Ll/a2s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b2s;

.field public final synthetic b:Ll/hx50;


# direct methods
.method public synthetic constructor <init>(Ll/b2s;Ll/hx50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a2s;->a:Ll/b2s;

    iput-object p2, p0, Ll/a2s;->b:Ll/hx50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a2s;->a:Ll/b2s;

    iget-object p0, p0, Ll/a2s;->b:Ll/hx50;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    invoke-static {v0, p0, p1}, Ll/b2s;->V3(Ll/b2s;Ll/hx50;Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;)V

    return-void
.end method
