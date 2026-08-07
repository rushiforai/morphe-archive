.class public final synthetic Ll/cvn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/iun0;


# direct methods
.method public synthetic constructor <init>(Ll/iun0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cvn0;->a:Ll/iun0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cvn0;->a:Ll/iun0;

    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;->c(Ll/iun0;)V

    return-void
.end method
