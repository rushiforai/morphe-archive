.class public final synthetic Ll/eei0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/nei0;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;


# direct methods
.method public synthetic constructor <init>(Ll/nei0;Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eei0;->a:Ll/nei0;

    iput-object p2, p0, Ll/eei0;->b:Ll/xc00;

    iput-object p3, p0, Ll/eei0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/eei0;->d:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eei0;->a:Ll/nei0;

    iget-object v1, p0, Ll/eei0;->b:Ll/xc00;

    iget-object v2, p0, Ll/eei0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/eei0;->d:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

    invoke-static {v0, v1, v2, p0}, Ll/nei0;->l0(Ll/nei0;Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    return-void
.end method
