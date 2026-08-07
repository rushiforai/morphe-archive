.class public final synthetic Ll/hw4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mw4;


# direct methods
.method public synthetic constructor <init>(Ll/mw4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hw4;->a:Ll/mw4;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hw4;->a:Ll/mw4;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;

    invoke-static {p0, p1}, Ll/mw4;->h4(Ll/mw4;Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)V

    return-void
.end method
