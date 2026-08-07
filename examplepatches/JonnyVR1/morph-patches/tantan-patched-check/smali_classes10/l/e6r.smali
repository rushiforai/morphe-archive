.class public final synthetic Ll/e6r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/k6r;


# direct methods
.method public synthetic constructor <init>(Ll/k6r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e6r;->a:Ll/k6r;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e6r;->a:Ll/k6r;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    invoke-static {p0, p1}, Ll/k6r;->L3(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
