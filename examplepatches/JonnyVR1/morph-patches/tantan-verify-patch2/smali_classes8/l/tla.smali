.class public final synthetic Ll/tla;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bma;


# direct methods
.method public synthetic constructor <init>(Ll/bma;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tla;->a:Ll/bma;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tla;->a:Ll/bma;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/bma;->i0(Ll/bma;Landroid/os/Bundle;)V

    return-void
.end method
