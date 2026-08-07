.class public final synthetic Ll/qz60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Ll/e070;


# direct methods
.method public synthetic constructor <init>(Ll/e070;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qz60;->a:Ll/e070;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qz60;->a:Ll/e070;

    invoke-static {p0, p1, p2, p3}, Ll/e070;->g1(Ll/e070;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
