.class public final synthetic Ll/zw2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gx2;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/gx2;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zw2;->a:Ll/gx2;

    iput-boolean p2, p0, Ll/zw2;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zw2;->a:Ll/gx2;

    iget-boolean p0, p0, Ll/zw2;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    invoke-static {v0, p0, p1}, Ll/gx2;->S3(Ll/gx2;ZLcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method
