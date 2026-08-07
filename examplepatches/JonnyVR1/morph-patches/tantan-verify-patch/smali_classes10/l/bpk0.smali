.class public final synthetic Ll/bpk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ipk0;


# direct methods
.method public synthetic constructor <init>(Ll/ipk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bpk0;->a:Ll/ipk0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bpk0;->a:Ll/ipk0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-static {p0, p1}, Ll/ipk0;->V3(Ll/ipk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
