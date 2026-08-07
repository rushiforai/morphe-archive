.class public final synthetic Ll/ysk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(ZZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/ysk0;->a:Z

    iput-boolean p2, p0, Ll/ysk0;->b:Z

    iput p3, p0, Ll/ysk0;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/ysk0;->a:Z

    iget-boolean v1, p0, Ll/ysk0;->b:Z

    iget p0, p0, Ll/ysk0;->c:I

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->E(ZZILcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/ado0;

    move-result-object p0

    return-object p0
.end method
