.class public final synthetic Ll/snn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/unn0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/unn0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/snn0;->a:Ll/unn0;

    iput-object p2, p0, Ll/snn0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/snn0;->a:Ll/unn0;

    iget-object p0, p0, Ll/snn0;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, p0, p1}, Ll/unn0;->M3(Ll/unn0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
