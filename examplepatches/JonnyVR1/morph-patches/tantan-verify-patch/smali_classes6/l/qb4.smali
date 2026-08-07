.class public final synthetic Ll/qb4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ll/oc4;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/CameraSticker;


# direct methods
.method public synthetic constructor <init>(Ll/oc4;Lcom/p1/mobile/putong/feed/data/CameraSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qb4;->a:Ll/oc4;

    iput-object p2, p0, Ll/qb4;->b:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qb4;->a:Ll/oc4;

    iget-object p0, p0, Ll/qb4;->b:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, p0, p1}, Ll/oc4;->k(Ll/oc4;Lcom/p1/mobile/putong/feed/data/CameraSticker;Ll/gcg0;)V

    return-void
.end method
