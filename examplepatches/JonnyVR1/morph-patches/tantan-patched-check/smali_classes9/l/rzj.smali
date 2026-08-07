.class public final synthetic Ll/rzj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/rzj;->a:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/rzj;->a:I

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->b(ILcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
