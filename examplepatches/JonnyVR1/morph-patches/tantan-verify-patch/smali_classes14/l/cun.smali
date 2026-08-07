.class public final synthetic Ll/cun;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/oun;

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Ll/qrr;

.field public final synthetic e:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;


# direct methods
.method public synthetic constructor <init>(Ll/oun;ZZLl/qrr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cun;->a:Ll/oun;

    iput-boolean p2, p0, Ll/cun;->b:Z

    iput-boolean p3, p0, Ll/cun;->c:Z

    iput-object p4, p0, Ll/cun;->d:Ll/qrr;

    iput-object p5, p0, Ll/cun;->e:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cun;->a:Ll/oun;

    iget-boolean v1, p0, Ll/cun;->b:Z

    iget-boolean v2, p0, Ll/cun;->c:Z

    iget-object v3, p0, Ll/cun;->d:Ll/qrr;

    iget-object p0, p0, Ll/cun;->e:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, v1, v2, v3, p0}, Ll/oun;->h3(Ll/oun;ZZLl/qrr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
