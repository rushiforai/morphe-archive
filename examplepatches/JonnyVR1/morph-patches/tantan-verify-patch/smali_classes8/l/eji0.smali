.class public final synthetic Ll/eji0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lorg/json/JSONObject;

.field public final synthetic b:Ll/xc00;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eji0;->a:Lorg/json/JSONObject;

    iput-object p2, p0, Ll/eji0;->b:Ll/xc00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eji0;->a:Lorg/json/JSONObject;

    iget-object p0, p0, Ll/eji0;->b:Ll/xc00;

    invoke-static {v0, p0}, Ll/gji0;->X(Lorg/json/JSONObject;Ll/xc00;)V

    return-void
.end method
