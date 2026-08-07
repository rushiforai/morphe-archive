.class public final synthetic Ll/fqu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/iqu;


# direct methods
.method public synthetic constructor <init>(Ll/iqu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fqu;->a:Ll/iqu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fqu;->a:Ll/iqu;

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoChatDuration;

    invoke-static {p0, p1}, Ll/iqu;->V2(Ll/iqu;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoChatDuration;)V

    return-void
.end method
