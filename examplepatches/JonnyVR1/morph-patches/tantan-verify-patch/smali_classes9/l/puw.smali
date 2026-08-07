.class public final synthetic Ll/puw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vuw;


# direct methods
.method public synthetic constructor <init>(Ll/vuw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/puw;->a:Ll/vuw;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/puw;->a:Ll/vuw;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$JailInRoom;

    invoke-static {p0, p1}, Ll/vuw;->M3(Ll/vuw;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$JailInRoom;)V

    return-void
.end method
