.class public final synthetic Ll/fhi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fhi0;->a:Ll/xc00;

    iput-object p2, p0, Ll/fhi0;->b:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fhi0;->a:Ll/xc00;

    iget-object p0, p0, Ll/fhi0;->b:Lorg/json/JSONObject;

    invoke-static {v0, p0}, Ll/shi0;->d0(Ll/xc00;Lorg/json/JSONObject;)V

    return-void
.end method
