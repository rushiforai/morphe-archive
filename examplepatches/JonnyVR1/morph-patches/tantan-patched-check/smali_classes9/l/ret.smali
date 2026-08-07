.class public final synthetic Ll/ret;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bft;


# direct methods
.method public synthetic constructor <init>(Ll/bft;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ret;->a:Ll/bft;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ret;->a:Ll/bft;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    invoke-static {p0, p1}, Ll/bft;->P3(Ll/bft;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method
