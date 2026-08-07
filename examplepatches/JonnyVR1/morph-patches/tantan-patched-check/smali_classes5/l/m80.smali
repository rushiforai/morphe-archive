.class public final synthetic Ll/m80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/q80;


# direct methods
.method public synthetic constructor <init>(Ll/q80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m80;->a:Ll/q80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m80;->a:Ll/q80;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/q80;->g0(Ll/q80;Landroid/os/Bundle;)V

    return-void
.end method
