.class public final synthetic Ll/xin0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yin0;


# direct methods
.method public synthetic constructor <init>(Ll/yin0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xin0;->a:Ll/yin0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xin0;->a:Ll/yin0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    invoke-static {p0, p1}, Ll/yin0;->T3(Ll/yin0;Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;)V

    return-void
.end method
