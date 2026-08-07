.class public final synthetic Ll/xt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xt3;->a:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xt3;->a:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    invoke-static {p0, p1}, Ll/au3;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
