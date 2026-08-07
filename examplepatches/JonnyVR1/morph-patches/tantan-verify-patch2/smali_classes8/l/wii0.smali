.class public final synthetic Ll/wii0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wii0;->a:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wii0;->a:Lorg/json/JSONObject;

    invoke-static {p0}, Ll/gji0;->W(Lorg/json/JSONObject;)V

    return-void
.end method
