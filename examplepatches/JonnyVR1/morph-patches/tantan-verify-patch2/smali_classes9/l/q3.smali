.class public final synthetic Ll/q3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g4;


# direct methods
.method public synthetic constructor <init>(Ll/g4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q3;->a:Ll/g4;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q3;->a:Ll/g4;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    invoke-static {p0, p1}, Ll/g4;->M3(Ll/g4;Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;)V

    return-void
.end method
