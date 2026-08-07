.class public final synthetic Ll/i8j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/s8j0;


# direct methods
.method public synthetic constructor <init>(Ll/s8j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i8j0;->a:Ll/s8j0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i8j0;->a:Ll/s8j0;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/s8j0;->e0(Ll/s8j0;Landroid/os/Bundle;)V

    return-void
.end method
