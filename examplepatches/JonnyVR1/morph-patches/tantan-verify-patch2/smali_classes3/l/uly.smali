.class public final synthetic Ll/uly;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/lmy;

.field public final synthetic b:Ll/ovn0;


# direct methods
.method public synthetic constructor <init>(Ll/lmy;Ll/ovn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uly;->a:Ll/lmy;

    iput-object p2, p0, Ll/uly;->b:Ll/ovn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uly;->a:Ll/lmy;

    iget-object p0, p0, Ll/uly;->b:Ll/ovn0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-static {v0, p0, p1}, Ll/lmy;->X3(Ll/lmy;Ll/ovn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/d3q;

    move-result-object p0

    return-object p0
.end method
