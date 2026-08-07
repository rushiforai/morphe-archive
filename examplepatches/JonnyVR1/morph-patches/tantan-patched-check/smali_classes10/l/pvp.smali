.class public final synthetic Ll/pvp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xup;


# direct methods
.method public synthetic constructor <init>(Ll/xup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pvp;->a:Ll/xup;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pvp;->a:Ll/xup;

    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/IntlVoiceFanBaseTaskItem$a;->d(Ll/xup;)V

    return-void
.end method
