.class public final synthetic Ll/o7v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# instance fields
.field public final synthetic a:Ll/zuv0;


# direct methods
.method public synthetic constructor <init>(Ll/zuv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o7v0;->a:Ll/zuv0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 1

    .line 1
    check-cast p1, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/obt0;->j(Landroid/os/Bundle;)Lorg/json/JSONObject;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Ll/o7v0;->a:Ll/zuv0;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/zuv0;->a(Ljava/lang/Object;)Ll/hpr;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
