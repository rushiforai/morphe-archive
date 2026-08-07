.class public final synthetic Ll/myr;
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

    iput-object p1, p0, Ll/myr;->a:Ll/tyr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/myr;->a:Ll/tyr;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/tyr;->J(Ll/tyr;Ll/uxj0;)Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    move-result-object p0

    return-object p0
.end method
