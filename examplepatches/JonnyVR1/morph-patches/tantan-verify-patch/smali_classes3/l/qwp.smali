.class public final synthetic Ll/qwp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xwp;


# direct methods
.method public synthetic constructor <init>(Ll/xwp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qwp;->a:Ll/xwp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qwp;->a:Ll/xwp;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;

    invoke-static {p0, p1}, Ll/xwp;->p4(Ll/xwp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;)V

    return-void
.end method
