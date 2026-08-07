.class public final synthetic Ll/mp4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rp4;


# direct methods
.method public synthetic constructor <init>(Ll/rp4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mp4;->a:Ll/rp4;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mp4;->a:Ll/rp4;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    invoke-static {p0, p1}, Ll/rp4;->i0(Ll/rp4;Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;)V

    return-void
.end method
