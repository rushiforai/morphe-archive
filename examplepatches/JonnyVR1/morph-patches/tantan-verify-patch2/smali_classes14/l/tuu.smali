.class public final synthetic Ll/tuu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vuu;


# direct methods
.method public synthetic constructor <init>(Ll/vuu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tuu;->a:Ll/vuu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tuu;->a:Ll/vuu;

    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;

    invoke-static {p0, p1}, Ll/vuu;->c3(Ll/vuu;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;)V

    return-void
.end method
