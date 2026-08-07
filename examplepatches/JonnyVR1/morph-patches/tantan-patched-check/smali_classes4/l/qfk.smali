.class public final synthetic Ll/qfk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rfk;


# direct methods
.method public synthetic constructor <init>(Ll/rfk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qfk;->a:Ll/rfk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qfk;->a:Ll/rfk;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/rfk;->e0(Ll/rfk;Landroid/os/Bundle;)V

    return-void
.end method
