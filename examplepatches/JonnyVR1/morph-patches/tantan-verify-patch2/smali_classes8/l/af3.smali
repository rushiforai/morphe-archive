.class public final synthetic Ll/af3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bf3;


# direct methods
.method public synthetic constructor <init>(Ll/bf3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/af3;->a:Ll/bf3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/af3;->a:Ll/bf3;

    check-cast p1, Lcom/baidu/mapapi/search/core/PoiInfo;

    invoke-static {p0, p1}, Ll/bf3;->s(Ll/bf3;Lcom/baidu/mapapi/search/core/PoiInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
