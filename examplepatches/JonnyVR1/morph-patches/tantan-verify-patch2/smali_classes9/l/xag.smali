.class public final synthetic Ll/xag;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ebg;


# direct methods
.method public synthetic constructor <init>(Ll/ebg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xag;->a:Ll/ebg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xag;->a:Ll/ebg;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/ebg;->P3(Ll/ebg;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
