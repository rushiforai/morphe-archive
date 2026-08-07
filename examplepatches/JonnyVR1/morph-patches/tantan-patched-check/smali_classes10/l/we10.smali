.class public final synthetic Ll/we10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/i6t;


# direct methods
.method public synthetic constructor <init>(ILl/i6t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/we10;->a:I

    iput-object p2, p0, Ll/we10;->b:Ll/i6t;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/we10;->a:I

    iget-object p0, p0, Ll/we10;->b:Ll/i6t;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    invoke-static {v0, p0, p1}, Ll/bf10;->d(ILl/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;)V

    return-void
.end method
