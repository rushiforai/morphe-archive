.class public final synthetic Ll/oyn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pyn0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/pyn0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oyn0;->a:Ll/pyn0;

    iput p2, p0, Ll/oyn0;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oyn0;->a:Ll/pyn0;

    iget p0, p0, Ll/oyn0;->b:I

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;

    invoke-static {v0, p0, p1}, Ll/pyn0;->J3(Ll/pyn0;ILcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;)V

    return-void
.end method
