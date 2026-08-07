.class public final synthetic Ll/xdi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ve4;


# instance fields
.field public final synthetic a:Ll/nei0;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/nei0;Ll/xc00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xdi0;->a:Ll/nei0;

    iput-object p2, p0, Ll/xdi0;->b:Ll/xc00;

    iput-object p3, p0, Ll/xdi0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xdi0;->a:Ll/nei0;

    iget-object v1, p0, Ll/xdi0;->b:Ll/xc00;

    iget-object p0, p0, Ll/xdi0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/nei0;->f0(Ll/nei0;Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    return-void
.end method
