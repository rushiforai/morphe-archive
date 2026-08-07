.class public final synthetic Ll/c1l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/i1l;


# direct methods
.method public synthetic constructor <init>(Ll/i1l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c1l;->a:Ll/i1l;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c1l;->a:Ll/i1l;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$StarRedpacketInfo;

    invoke-static {p0, p1}, Ll/i1l;->W3(Ll/i1l;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$StarRedpacketInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
