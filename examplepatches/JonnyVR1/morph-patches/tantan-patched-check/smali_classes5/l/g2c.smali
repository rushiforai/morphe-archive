.class public final synthetic Ll/g2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h2c;


# direct methods
.method public synthetic constructor <init>(Ll/h2c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g2c;->a:Ll/h2c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g2c;->a:Ll/h2c;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/h2c;->l0(Ll/h2c;Landroid/os/Bundle;)V

    return-void
.end method
