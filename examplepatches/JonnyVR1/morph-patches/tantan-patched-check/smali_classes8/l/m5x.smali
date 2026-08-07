.class public final synthetic Ll/m5x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p5x;


# direct methods
.method public synthetic constructor <init>(Ll/p5x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m5x;->a:Ll/p5x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m5x;->a:Ll/p5x;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/p5x;->f0(Ll/p5x;Landroid/os/Bundle;)V

    return-void
.end method
