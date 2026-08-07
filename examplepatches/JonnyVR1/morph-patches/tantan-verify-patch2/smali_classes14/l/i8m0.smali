.class public final synthetic Ll/i8m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/j8m0;


# direct methods
.method public synthetic constructor <init>(Ll/j8m0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i8m0;->a:Ll/j8m0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i8m0;->a:Ll/j8m0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/j8m0;->g(Ll/j8m0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
