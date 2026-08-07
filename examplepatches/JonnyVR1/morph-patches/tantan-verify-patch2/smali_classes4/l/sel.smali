.class public final synthetic Ll/sel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    check-cast p2, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    check-cast p3, Lcom/p1/mobile/putong/newui/main/base/TabName;

    check-cast p4, Lrx/Notification;

    invoke-static {p1, p2, p3, p4}, Ll/tel$a;->a(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PartialListOpt;Lcom/p1/mobile/putong/newui/main/base/TabName;Lrx/Notification;)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method
