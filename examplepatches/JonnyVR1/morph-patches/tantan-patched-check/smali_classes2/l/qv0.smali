.class public final synthetic Ll/qv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/GraphRequest$b;


# instance fields
.field public final synthetic a:Lcom/facebook/appevents/AccessTokenAppIdPair;

.field public final synthetic b:Lcom/facebook/GraphRequest;

.field public final synthetic c:Ll/sse0;

.field public final synthetic d:Ll/yvi;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/appevents/AccessTokenAppIdPair;Lcom/facebook/GraphRequest;Ll/sse0;Ll/yvi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qv0;->a:Lcom/facebook/appevents/AccessTokenAppIdPair;

    iput-object p2, p0, Ll/qv0;->b:Lcom/facebook/GraphRequest;

    iput-object p3, p0, Ll/qv0;->c:Ll/sse0;

    iput-object p4, p0, Ll/qv0;->d:Ll/yvi;

    return-void
.end method


# virtual methods
.method public final a(Lcom/facebook/GraphResponse;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qv0;->a:Lcom/facebook/appevents/AccessTokenAppIdPair;

    iget-object v1, p0, Ll/qv0;->b:Lcom/facebook/GraphRequest;

    iget-object v2, p0, Ll/qv0;->c:Ll/sse0;

    iget-object p0, p0, Ll/qv0;->d:Ll/yvi;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/facebook/appevents/d;->e(Lcom/facebook/appevents/AccessTokenAppIdPair;Lcom/facebook/GraphRequest;Ll/sse0;Ll/yvi;Lcom/facebook/GraphResponse;)V

    return-void
.end method
