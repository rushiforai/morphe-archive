.class public final synthetic Ll/ufn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/zfn0;


# direct methods
.method public synthetic constructor <init>(Ll/zfn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ufn0;->a:Ll/zfn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ufn0;->a:Ll/zfn0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    invoke-static {p0, p1}, Ll/zfn0;->K3(Ll/zfn0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
