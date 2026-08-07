.class public final synthetic Ll/q8g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d9g;


# direct methods
.method public synthetic constructor <init>(Ll/d9g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q8g;->a:Ll/d9g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q8g;->a:Ll/d9g;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/d9g;->S3(Ll/d9g;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
