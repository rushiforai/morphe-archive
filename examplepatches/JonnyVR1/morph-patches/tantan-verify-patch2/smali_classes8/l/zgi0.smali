.class public final synthetic Ll/zgi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lorg/json/JSONObject;

.field public final synthetic b:Ll/xc00;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zgi0;->a:Lorg/json/JSONObject;

    iput-object p2, p0, Ll/zgi0;->b:Ll/xc00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zgi0;->a:Lorg/json/JSONObject;

    iget-object p0, p0, Ll/zgi0;->b:Ll/xc00;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/shi0;->X(Lorg/json/JSONObject;Ll/xc00;Ljava/util/List;)V

    return-void
.end method
