.class public final synthetic Ll/ad10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bd10;


# direct methods
.method public synthetic constructor <init>(Ll/bd10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ad10;->a:Ll/bd10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ad10;->a:Ll/bd10;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    invoke-static {p0, p1}, Ll/bd10;->V3(Ll/bd10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method
