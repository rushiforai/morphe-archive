.class public final synthetic Ll/wev;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cfv;


# direct methods
.method public synthetic constructor <init>(Ll/cfv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wev;->a:Ll/cfv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wev;->a:Ll/cfv;

    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;

    invoke-static {p0, p1}, Ll/cfv;->Z3(Ll/cfv;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;)V

    return-void
.end method
