.class public final synthetic Ll/rc10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/sc10;


# direct methods
.method public synthetic constructor <init>(Ll/sc10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rc10;->a:Ll/sc10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rc10;->a:Ll/sc10;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    invoke-virtual {p0, p1}, Ll/sc10;->K3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method
