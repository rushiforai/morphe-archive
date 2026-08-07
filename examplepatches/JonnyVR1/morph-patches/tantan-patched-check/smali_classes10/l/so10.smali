.class public final synthetic Ll/so10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wo10;


# direct methods
.method public synthetic constructor <init>(Ll/wo10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/so10;->a:Ll/wo10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/so10;->a:Ll/wo10;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    invoke-static {p0, p1}, Ll/wo10;->N3(Ll/wo10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;)V

    return-void
.end method
