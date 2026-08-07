.class public final synthetic Ll/s8i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lorg/json/JSONObject;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;Ll/xc00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s8i0;->a:Lorg/json/JSONObject;

    iput-object p2, p0, Ll/s8i0;->b:Ll/xc00;

    iput-object p3, p0, Ll/s8i0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s8i0;->a:Lorg/json/JSONObject;

    iget-object v1, p0, Ll/s8i0;->b:Ll/xc00;

    iget-object p0, p0, Ll/s8i0;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;

    invoke-static {v0, v1, p0, p1}, Ll/e9i0;->U(Lorg/json/JSONObject;Ll/xc00;Ljava/lang/String;Lcom/p1/mobile/putong/data/OpenSdkCodeAuth;)V

    return-void
.end method
