.class public final synthetic Ll/t8y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Ll/pf60;

    check-cast p3, Ll/uxj0;

    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;->p(Ljava/lang/Boolean;Ll/pf60;Ll/uxj0;)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method
