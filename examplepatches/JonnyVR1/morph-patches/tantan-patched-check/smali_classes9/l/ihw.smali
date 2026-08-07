.class public Ll/ihw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/text/SpannableStringBuilder;

.field public b:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;


# direct methods
.method public constructor <init>(Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ihw;->a:Landroid/text/SpannableStringBuilder;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ihw;->b:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ihw;->b:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getJumpRoomID()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ihw;->b:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getLiveID()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Landroid/text/SpannableStringBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ihw;->a:Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ihw;->b:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getIconUrl()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
