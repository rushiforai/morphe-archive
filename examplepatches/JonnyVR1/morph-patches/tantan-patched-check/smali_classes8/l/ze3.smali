.class public final synthetic Ll/ze3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:Ll/bf3;


# direct methods
.method public synthetic constructor <init>(Ll/bf3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ze3;->a:Ll/bf3;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ze3;->a:Ll/bf3;

    check-cast p1, Lcom/baidu/mapapi/search/core/PoiInfo;

    check-cast p2, Lcom/baidu/mapapi/search/core/PoiInfo;

    invoke-static {p0, p1, p2}, Ll/bf3;->p(Ll/bf3;Lcom/baidu/mapapi/search/core/PoiInfo;Lcom/baidu/mapapi/search/core/PoiInfo;)I

    move-result p0

    return p0
.end method
