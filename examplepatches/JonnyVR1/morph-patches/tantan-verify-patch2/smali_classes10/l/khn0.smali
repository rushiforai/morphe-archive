.class public final synthetic Ll/khn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/thn0;


# direct methods
.method public synthetic constructor <init>(Ll/thn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/khn0;->a:Ll/thn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/khn0;->a:Ll/thn0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    invoke-static {p0, p1}, Ll/thn0;->N3(Ll/thn0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    return-void
.end method
