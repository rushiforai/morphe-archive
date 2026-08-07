.class public final synthetic Ll/eqq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fqq;

.field public final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/fqq;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eqq;->a:Ll/fqq;

    iput-object p2, p0, Ll/eqq;->b:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eqq;->a:Ll/fqq;

    iget-object p0, p0, Ll/eqq;->b:Lorg/json/JSONObject;

    invoke-static {v0, p0}, Ll/fqq;->a(Ll/fqq;Lorg/json/JSONObject;)V

    return-void
.end method
