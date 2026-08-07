.class public final synthetic Ll/t8i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t8i0;->a:Ll/xc00;

    iput-object p2, p0, Ll/t8i0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/t8i0;->c:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t8i0;->a:Ll/xc00;

    iget-object v1, p0, Ll/t8i0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/t8i0;->c:Lorg/json/JSONObject;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/e9i0;->V(Ll/xc00;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/Throwable;)V

    return-void
.end method
