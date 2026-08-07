.class public final synthetic Ll/jat;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vat;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;


# direct methods
.method public synthetic constructor <init>(Ll/vat;Ljava/lang/String;ZLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jat;->a:Ll/vat;

    iput-object p2, p0, Ll/jat;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/jat;->c:Z

    iput-object p4, p0, Ll/jat;->d:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jat;->a:Ll/vat;

    iget-object v1, p0, Ll/jat;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/jat;->c:Z

    iget-object p0, p0, Ll/jat;->d:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    invoke-static {v0, v1, v2, p0, p1}, Ll/vat;->M3(Ll/vat;Ljava/lang/String;ZLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V

    return-void
.end method
