.class public final synthetic Ll/m3j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/n3j0;


# direct methods
.method public synthetic constructor <init>(Ll/n3j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m3j0;->a:Ll/n3j0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m3j0;->a:Ll/n3j0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    invoke-static {p0, p1}, Ll/n3j0;->L3(Ll/n3j0;Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;)V

    return-void
.end method
