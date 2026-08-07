.class public final synthetic Ll/wrs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xrs;


# direct methods
.method public synthetic constructor <init>(Ll/xrs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wrs;->a:Ll/xrs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wrs;->a:Ll/xrs;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;

    invoke-static {p0, p1}, Ll/xrs;->V3(Ll/xrs;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method
