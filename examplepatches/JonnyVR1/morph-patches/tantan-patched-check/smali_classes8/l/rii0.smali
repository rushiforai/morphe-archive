.class public final synthetic Ll/rii0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lorg/json/JSONArray;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONArray;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rii0;->a:Lorg/json/JSONArray;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rii0;->a:Lorg/json/JSONArray;

    check-cast p1, Lcom/p1/mobile/putong/data/IdealTag;

    invoke-static {p0, p1}, Ll/gji0;->Y(Lorg/json/JSONArray;Lcom/p1/mobile/putong/data/IdealTag;)V

    return-void
.end method
