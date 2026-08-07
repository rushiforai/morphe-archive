.class public final synthetic Ll/qei0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/location/a;

.field public final synthetic b:Lcom/p1/mobile/putong/location/Location;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/location/a;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qei0;->a:Lcom/p1/mobile/putong/location/a;

    iput-object p2, p0, Ll/qei0;->b:Lcom/p1/mobile/putong/location/Location;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qei0;->a:Lcom/p1/mobile/putong/location/a;

    iget-object p0, p0, Ll/qei0;->b:Lcom/p1/mobile/putong/location/Location;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/location/a;->a(Lcom/p1/mobile/putong/location/a;Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method
