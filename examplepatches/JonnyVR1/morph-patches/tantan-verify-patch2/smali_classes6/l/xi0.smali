.class public final synthetic Ll/xi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yi0;


# direct methods
.method public synthetic constructor <init>(Ll/yi0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xi0;->a:Ll/yi0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xi0;->a:Ll/yi0;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/yi0;->e0(Ll/yi0;Landroid/os/Bundle;)V

    return-void
.end method
