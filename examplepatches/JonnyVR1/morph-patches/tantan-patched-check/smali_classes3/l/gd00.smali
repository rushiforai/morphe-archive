.class public final synthetic Ll/gd00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gd00;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/gd00;->b:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gd00;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/gd00;->b:Lorg/json/JSONObject;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->Y1(Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
