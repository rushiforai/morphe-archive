.class public final synthetic Ll/ixw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jxw;

.field public final synthetic b:Lcom/baidu/mapapi/model/LatLng;


# direct methods
.method public synthetic constructor <init>(Ll/jxw;Lcom/baidu/mapapi/model/LatLng;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ixw;->a:Ll/jxw;

    iput-object p2, p0, Ll/ixw;->b:Lcom/baidu/mapapi/model/LatLng;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ixw;->a:Ll/jxw;

    iget-object p0, p0, Ll/ixw;->b:Lcom/baidu/mapapi/model/LatLng;

    invoke-static {v0, p0}, Ll/jxw;->b(Ll/jxw;Lcom/baidu/mapapi/model/LatLng;)V

    return-void
.end method
