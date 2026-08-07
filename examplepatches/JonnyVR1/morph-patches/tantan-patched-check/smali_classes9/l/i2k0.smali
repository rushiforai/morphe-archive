.class public final synthetic Ll/i2k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p2k0;

.field public final synthetic b:Ll/a2k0;


# direct methods
.method public synthetic constructor <init>(Ll/p2k0;Ll/a2k0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i2k0;->a:Ll/p2k0;

    iput-object p2, p0, Ll/i2k0;->b:Ll/a2k0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i2k0;->a:Ll/p2k0;

    iget-object p0, p0, Ll/i2k0;->b:Ll/a2k0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    invoke-static {v0, p0, p1}, Ll/p2k0;->O3(Ll/p2k0;Ll/a2k0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    return-void
.end method
