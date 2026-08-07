.class public final synthetic Ll/nyr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/tyr;


# direct methods
.method public synthetic constructor <init>(Ll/tyr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nyr;->a:Ll/tyr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nyr;->a:Ll/tyr;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    invoke-static {p0, p1}, Ll/tyr;->G(Ll/tyr;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
