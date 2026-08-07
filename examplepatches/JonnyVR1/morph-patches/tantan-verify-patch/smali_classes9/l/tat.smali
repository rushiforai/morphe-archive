.class public final synthetic Ll/tat;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


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

    iput-object p1, p0, Ll/tat;->a:Ll/vat;

    iput-object p2, p0, Ll/tat;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/tat;->c:Z

    iput-object p4, p0, Ll/tat;->d:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tat;->a:Ll/vat;

    iget-object v1, p0, Ll/tat;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/tat;->c:Z

    iget-object p0, p0, Ll/tat;->d:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    invoke-static {v0, v1, v2, p0}, Ll/vat;->V3(Ll/vat;Ljava/lang/String;ZLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V

    return-void
.end method
