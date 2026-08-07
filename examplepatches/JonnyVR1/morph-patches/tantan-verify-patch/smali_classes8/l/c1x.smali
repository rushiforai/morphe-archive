.class public final synthetic Ll/c1x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d1x;


# direct methods
.method public synthetic constructor <init>(Ll/d1x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c1x;->a:Ll/d1x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c1x;->a:Ll/d1x;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/d1x;->j0(Ll/d1x;Landroid/os/Bundle;)V

    return-void
.end method
