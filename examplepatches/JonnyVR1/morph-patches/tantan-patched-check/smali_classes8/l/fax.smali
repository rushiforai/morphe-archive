.class public final synthetic Ll/fax;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Ll/jax;


# direct methods
.method public synthetic constructor <init>(Ll/jax;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fax;->a:Ll/jax;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fax;->a:Ll/jax;

    invoke-static {p0, p1, p2, p3}, Ll/jax;->j(Ll/jax;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
