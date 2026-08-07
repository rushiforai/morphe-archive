.class public final synthetic Ll/sja;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/google/gson/JsonObject;


# direct methods
.method public synthetic constructor <init>(Lcom/google/gson/JsonObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sja;->a:Lcom/google/gson/JsonObject;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sja;->a:Lcom/google/gson/JsonObject;

    invoke-static {p0}, Ll/jka;->s4(Lcom/google/gson/JsonObject;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
