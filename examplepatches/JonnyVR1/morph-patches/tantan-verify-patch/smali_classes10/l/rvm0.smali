.class public final synthetic Ll/rvm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wvm0;


# direct methods
.method public synthetic constructor <init>(Ll/wvm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rvm0;->a:Ll/wvm0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rvm0;->a:Ll/wvm0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;

    invoke-static {p0, p1}, Ll/wvm0;->Y3(Ll/wvm0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)V

    return-void
.end method
