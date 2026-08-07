.class public final synthetic Ll/hv2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nv2;


# direct methods
.method public synthetic constructor <init>(Ll/nv2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hv2;->a:Ll/nv2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hv2;->a:Ll/nv2;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    invoke-static {p0, p1}, Ll/nv2;->R3(Ll/nv2;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method
