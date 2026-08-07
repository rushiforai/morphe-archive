.class public final synthetic Ll/zrp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bkj0;


# direct methods
.method public synthetic constructor <init>(Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zrp;->a:Ll/bkj0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zrp;->a:Ll/bkj0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlVoiceCenterApiProvider;->b(Ll/bkj0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method
