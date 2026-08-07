.class public final synthetic Ll/g88;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g88;->a:Lcom/p1/mobile/putong/core/api/g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g88;->a:Lcom/p1/mobile/putong/core/api/g;

    check-cast p1, Lorg/json/JSONObject;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->tc(Lcom/p1/mobile/putong/core/api/g;Lorg/json/JSONObject;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
