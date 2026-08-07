.class public final synthetic Ll/vjk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ikk;


# direct methods
.method public synthetic constructor <init>(Ll/ikk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vjk;->a:Ll/ikk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vjk;->a:Ll/ikk;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/ikk;->k0(Ll/ikk;Landroid/os/Bundle;)V

    return-void
.end method
