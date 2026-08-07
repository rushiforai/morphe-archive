.class public final synthetic Ll/jgi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ngi0;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/ngi0;Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jgi0;->a:Ll/ngi0;

    iput-object p2, p0, Ll/jgi0;->b:Ll/xc00;

    iput-object p3, p0, Ll/jgi0;->c:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jgi0;->a:Ll/ngi0;

    iget-object v1, p0, Ll/jgi0;->b:Ll/xc00;

    iget-object p0, p0, Ll/jgi0;->c:Lorg/json/JSONObject;

    invoke-static {v0, v1, p0}, Ll/ngi0;->M(Ll/ngi0;Ll/xc00;Lorg/json/JSONObject;)V

    return-void
.end method
