.class public final synthetic Ll/rtw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/stw;


# direct methods
.method public synthetic constructor <init>(Ll/stw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rtw;->a:Ll/stw;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rtw;->a:Ll/stw;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    invoke-static {p0, p1}, Ll/stw;->S3(Ll/stw;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method
