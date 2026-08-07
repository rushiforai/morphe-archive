.class public final synthetic Ll/jjo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ojo;


# direct methods
.method public synthetic constructor <init>(Ll/ojo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jjo;->a:Ll/ojo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjo;->a:Ll/ojo;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/ojo;->o0(Ll/ojo;Landroid/os/Bundle;)V

    return-void
.end method
