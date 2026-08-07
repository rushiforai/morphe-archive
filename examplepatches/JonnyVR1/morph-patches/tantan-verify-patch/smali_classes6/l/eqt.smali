.class public final synthetic Ll/eqt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/vwt;


# direct methods
.method public synthetic constructor <init>(Ll/vwt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eqt;->a:Ll/vwt;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eqt;->a:Ll/vwt;

    invoke-static {p0}, Ll/vwt;->e0(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    move-result-object p0

    return-object p0
.end method
