.class public final synthetic Ll/w4u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# instance fields
.field public final synthetic a:Ll/hew0;

.field public final synthetic b:Ll/rdw0;


# direct methods
.method public synthetic constructor <init>(Ll/hew0;Ll/rdw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w4u0;->a:Ll/hew0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/w4u0;->b:Ll/rdw0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 2

    .line 1
    check-cast p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    const-string v0, "isSuccessful"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v1, "appSettingsJson"

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/ebt0;->i()Ll/grw0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1, p1}, Ll/grw0;->t(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Ll/w4u0;->b:Ll/rdw0;

    .line 30
    .line 31
    iget-object p0, p0, Ll/w4u0;->a:Ll/hew0;

    .line 32
    .line 33
    invoke-interface {p1, v0}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 34
    .line 35
    .line 36
    invoke-interface {p1}, Ll/rdw0;->zzl()Ll/vdw0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/hew0;->b(Ll/vdw0;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method
