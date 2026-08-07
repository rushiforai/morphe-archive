.class public final synthetic Ll/cww;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/eww;


# direct methods
.method public synthetic constructor <init>(Ll/eww;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cww;->a:Ll/eww;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cww;->a:Ll/eww;

    check-cast p1, Lcom/baidu/mapapi/search/core/PoiInfo;

    invoke-static {p0, p1}, Ll/eww;->f0(Ll/eww;Lcom/baidu/mapapi/search/core/PoiInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
