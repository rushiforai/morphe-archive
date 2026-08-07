.class public final synthetic Ll/u2c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/pf60;

    check-cast p2, Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderView;->s(Ll/pf60;Lcom/p1/mobile/putong/newui/main/base/TabName;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
