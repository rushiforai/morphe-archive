.class public final synthetic Ll/nu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ou;


# direct methods
.method public synthetic constructor <init>(Ll/ou;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nu;->a:Ll/ou;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nu;->a:Ll/ou;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/ou;->e0(Ll/ou;Landroid/os/Bundle;)V

    return-void
.end method
