.class public final synthetic Ll/pz10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xz10;


# direct methods
.method public synthetic constructor <init>(Ll/xz10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pz10;->a:Ll/xz10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pz10;->a:Ll/xz10;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    invoke-static {p0, p1}, Ll/xz10;->W0(Ll/xz10;Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
