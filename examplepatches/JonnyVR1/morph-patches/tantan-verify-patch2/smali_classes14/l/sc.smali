.class public final synthetic Ll/sc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sc;->a:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sc;->a:Lorg/json/JSONObject;

    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/account/api/a;->S(Lorg/json/JSONObject;Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)V

    return-void
.end method
