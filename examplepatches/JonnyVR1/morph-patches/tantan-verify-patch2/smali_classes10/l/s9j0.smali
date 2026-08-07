.class public final synthetic Ll/s9j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/haj0;


# direct methods
.method public synthetic constructor <init>(Ll/haj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s9j0;->a:Ll/haj0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s9j0;->a:Ll/haj0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/haj0;->R3(Ll/haj0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
