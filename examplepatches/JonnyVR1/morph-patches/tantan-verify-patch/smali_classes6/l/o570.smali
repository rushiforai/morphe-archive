.class public final synthetic Ll/o570;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v670;


# direct methods
.method public synthetic constructor <init>(Ll/v670;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o570;->a:Ll/v670;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o570;->a:Ll/v670;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/v670;->g0(Ll/v670;Landroid/os/Bundle;)V

    return-void
.end method
