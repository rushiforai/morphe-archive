.class public final synthetic Ll/kc4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/CameraFilter;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/CameraFilter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kc4;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/kc4;->b:Lcom/p1/mobile/putong/feed/data/CameraFilter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kc4;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/kc4;->b:Lcom/p1/mobile/putong/feed/data/CameraFilter;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, p0, p1}, Ll/oc4;->t(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/CameraFilter;Ll/gcg0;)V

    return-void
.end method
