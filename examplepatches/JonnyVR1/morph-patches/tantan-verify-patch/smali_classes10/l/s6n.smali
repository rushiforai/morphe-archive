.class public final synthetic Ll/s6n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/e7n;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/e7n;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s6n;->a:Ll/e7n;

    iput-object p2, p0, Ll/s6n;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s6n;->a:Ll/e7n;

    iget-object p0, p0, Ll/s6n;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, p0, p1}, Ll/e7n;->q4(Ll/e7n;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
