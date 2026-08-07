.class public final synthetic Ll/xpu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# instance fields
.field public final synthetic a:Ll/hqu0;

.field public final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/hqu0;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xpu0;->a:Ll/hqu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xpu0;->b:Lorg/json/JSONObject;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xpu0;->a:Ll/hqu0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xpu0;->b:Lorg/json/JSONObject;

    .line 4
    .line 5
    check-cast p1, Ll/wit0;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ll/hqu0;->c(Lorg/json/JSONObject;Ll/wit0;)Ll/hpr;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
