.class public final synthetic Ll/mxa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nxa0;

.field public final synthetic b:Lcom/baidu/mapapi/model/LatLng;


# direct methods
.method public synthetic constructor <init>(Ll/nxa0;Lcom/baidu/mapapi/model/LatLng;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mxa0;->a:Ll/nxa0;

    iput-object p2, p0, Ll/mxa0;->b:Lcom/baidu/mapapi/model/LatLng;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mxa0;->a:Ll/nxa0;

    iget-object p0, p0, Ll/mxa0;->b:Lcom/baidu/mapapi/model/LatLng;

    check-cast p1, [I

    invoke-static {v0, p0, p1}, Ll/nxa0;->R(Ll/nxa0;Lcom/baidu/mapapi/model/LatLng;[I)V

    return-void
.end method
