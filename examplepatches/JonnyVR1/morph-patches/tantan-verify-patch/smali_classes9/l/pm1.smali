.class public final synthetic Ll/pm1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/tm1;


# direct methods
.method public synthetic constructor <init>(Ll/tm1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pm1;->a:Ll/tm1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pm1;->a:Ll/tm1;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/tm1;->o4(Ll/tm1;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/v5g;

    move-result-object p0

    return-object p0
.end method
