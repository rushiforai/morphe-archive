.class public final synthetic Ll/er10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/er10;->a:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/er10;->a:I

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->f(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
