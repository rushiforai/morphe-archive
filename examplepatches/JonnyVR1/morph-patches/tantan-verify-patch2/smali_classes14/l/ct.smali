.class public final synthetic Ll/ct;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xt;


# direct methods
.method public synthetic constructor <init>(Ll/xt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ct;->a:Ll/xt;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ct;->a:Ll/xt;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/xt;->x0(Ll/xt;Landroid/os/Bundle;)V

    return-void
.end method
