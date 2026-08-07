.class public final synthetic Ll/w05;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/a15;


# direct methods
.method public synthetic constructor <init>(Ll/a15;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w05;->a:Ll/a15;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w05;->a:Ll/a15;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/a15;->f0(Ll/a15;Landroid/os/Bundle;)V

    return-void
.end method
