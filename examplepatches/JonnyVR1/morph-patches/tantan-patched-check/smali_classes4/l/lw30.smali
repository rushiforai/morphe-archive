.class public final synthetic Ll/lw30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    check-cast p2, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    check-cast p3, Lcom/p1/mobile/putong/newui/main/base/TabName;

    check-cast p4, Lrx/Notification;

    check-cast p5, Ljava/lang/Boolean;

    invoke-static {p1, p2, p3, p4, p5}, Ll/b240;->V3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PartialListOpt;Lcom/p1/mobile/putong/newui/main/base/TabName;Lrx/Notification;Ljava/lang/Boolean;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
