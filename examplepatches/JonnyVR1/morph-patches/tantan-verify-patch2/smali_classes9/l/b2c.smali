.class public final synthetic Ll/b2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d2c;


# direct methods
.method public synthetic constructor <init>(Ll/d2c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b2c;->a:Ll/d2c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2c;->a:Ll/d2c;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/d2c;->X3(Ll/d2c;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
