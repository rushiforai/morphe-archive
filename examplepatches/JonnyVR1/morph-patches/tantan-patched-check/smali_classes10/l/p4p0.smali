.class public final synthetic Ll/p4p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/q4p0;


# direct methods
.method public synthetic constructor <init>(Ll/q4p0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p4p0;->a:Ll/q4p0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p4p0;->a:Ll/q4p0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AnnouncementAudit;

    invoke-static {p0, p1}, Ll/q4p0;->M3(Ll/q4p0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AnnouncementAudit;)V

    return-void
.end method
