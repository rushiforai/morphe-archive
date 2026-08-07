.class public final synthetic Ll/qmh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/umh;


# direct methods
.method public synthetic constructor <init>(Ll/umh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qmh;->a:Ll/umh;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qmh;->a:Ll/umh;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/umh;->R0(Ll/umh;Landroid/os/Bundle;)V

    return-void
.end method
