.class public final synthetic Ll/wzb0;
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
    check-cast p1, Ll/pf60;

    check-cast p2, Lcom/p1/mobile/putong/newui/main/base/TabName;

    check-cast p3, Lcom/p1/mobile/android/app/c;

    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView;->r(Ll/pf60;Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/android/app/c;)Lkotlin/Triple;

    move-result-object p0

    return-object p0
.end method
