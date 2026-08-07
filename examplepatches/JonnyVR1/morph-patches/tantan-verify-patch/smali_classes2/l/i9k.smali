.class public final synthetic Ll/i9k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/GraphRequest$b;


# instance fields
.field public final synthetic a:Lcom/facebook/GraphRequest$b;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/GraphRequest$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i9k;->a:Lcom/facebook/GraphRequest$b;

    return-void
.end method


# virtual methods
.method public final a(Lcom/facebook/GraphResponse;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i9k;->a:Lcom/facebook/GraphRequest$b;

    invoke-static {p0, p1}, Lcom/facebook/GraphRequest;->a(Lcom/facebook/GraphRequest$b;Lcom/facebook/GraphResponse;)V

    return-void
.end method
