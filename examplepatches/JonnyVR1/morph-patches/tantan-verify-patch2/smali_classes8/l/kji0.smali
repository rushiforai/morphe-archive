.class public final synthetic Ll/kji0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wji0;

.field public final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/wji0;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kji0;->a:Ll/wji0;

    iput-object p2, p0, Ll/kji0;->b:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kji0;->a:Ll/wji0;

    iget-object p0, p0, Ll/kji0;->b:Lorg/json/JSONObject;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/wji0;->K(Ll/wji0;Lorg/json/JSONObject;Ljava/lang/Throwable;)V

    return-void
.end method
