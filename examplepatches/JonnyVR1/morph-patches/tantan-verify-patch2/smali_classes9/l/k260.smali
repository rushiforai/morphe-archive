.class public final synthetic Ll/k260;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p260;


# direct methods
.method public synthetic constructor <init>(Ll/p260;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k260;->a:Ll/p260;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k260;->a:Ll/p260;

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

    invoke-static {p0, p1}, Ll/p260;->a4(Ll/p260;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    return-void
.end method
