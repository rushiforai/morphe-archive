.class public final synthetic Ll/idv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/yql;


# direct methods
.method public synthetic constructor <init>(Ll/yql;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/idv;->a:Ll/yql;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/idv;->a:Ll/yql;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;->b(Ll/yql;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
