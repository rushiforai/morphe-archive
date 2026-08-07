.class public final synthetic Ll/wwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/scj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    check-cast p2, Landroid/content/Context;

    check-cast p3, Landroid/net/Uri;

    invoke-static {p1, p2, p3}, Ll/xwa;->a(Ljava/lang/String;Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method
