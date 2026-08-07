.class public final synthetic Ll/tbo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ubo;

.field public final synthetic b:Lcom/p1/mobile/putong/location/Location;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/ubo;Lcom/p1/mobile/putong/location/Location;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tbo;->a:Ll/ubo;

    iput-object p2, p0, Ll/tbo;->b:Lcom/p1/mobile/putong/location/Location;

    iput-boolean p3, p0, Ll/tbo;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tbo;->a:Ll/ubo;

    iget-object v1, p0, Ll/tbo;->b:Lcom/p1/mobile/putong/location/Location;

    iget-boolean p0, p0, Ll/tbo;->c:Z

    invoke-static {v0, v1, p0}, Ll/ubo;->a(Ll/ubo;Lcom/p1/mobile/putong/location/Location;Z)V

    return-void
.end method
