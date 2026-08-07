.class public final synthetic Ll/qvm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/wvm0;


# direct methods
.method public synthetic constructor <init>(Ll/wvm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qvm0;->a:Ll/wvm0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvm0;->a:Ll/wvm0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;

    invoke-static {p0, p1}, Ll/wvm0;->Z3(Ll/wvm0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceFreeCallUpdate;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
