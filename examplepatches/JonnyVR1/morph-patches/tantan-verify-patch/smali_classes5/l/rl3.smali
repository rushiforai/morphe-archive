.class public final synthetic Ll/rl3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/sl3;


# direct methods
.method public synthetic constructor <init>(Ll/sl3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rl3;->a:Ll/sl3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rl3;->a:Ll/sl3;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/sl3;->e0(Ll/sl3;Landroid/os/Bundle;)V

    return-void
.end method
