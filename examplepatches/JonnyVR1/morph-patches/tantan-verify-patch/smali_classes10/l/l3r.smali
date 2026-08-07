.class public final synthetic Ll/l3r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/t3r;


# direct methods
.method public synthetic constructor <init>(Ll/t3r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l3r;->a:Ll/t3r;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l3r;->a:Ll/t3r;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    invoke-static {p0, p1}, Ll/t3r;->V3(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
