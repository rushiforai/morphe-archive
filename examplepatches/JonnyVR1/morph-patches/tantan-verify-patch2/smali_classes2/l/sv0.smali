.class public final synthetic Ll/sv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/facebook/appevents/AccessTokenAppIdPair;

.field public final synthetic b:Ll/sse0;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/appevents/AccessTokenAppIdPair;Ll/sse0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sv0;->a:Lcom/facebook/appevents/AccessTokenAppIdPair;

    iput-object p2, p0, Ll/sv0;->b:Ll/sse0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sv0;->a:Lcom/facebook/appevents/AccessTokenAppIdPair;

    iget-object p0, p0, Ll/sv0;->b:Ll/sse0;

    invoke-static {v0, p0}, Lcom/facebook/appevents/d;->a(Lcom/facebook/appevents/AccessTokenAppIdPair;Ll/sse0;)V

    return-void
.end method
