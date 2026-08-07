.class public final synthetic Ll/j6u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/v5u;


# direct methods
.method public synthetic constructor <init>(Ll/v5u;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j6u;->a:Ll/v5u;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j6u;->a:Ll/v5u;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/k6u;->a(Ll/v5u;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/v5u;

    move-result-object p0

    return-object p0
.end method
