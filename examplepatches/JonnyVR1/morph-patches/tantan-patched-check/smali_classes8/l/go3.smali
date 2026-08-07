.class public final synthetic Ll/go3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/no3;


# direct methods
.method public synthetic constructor <init>(Ll/no3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/go3;->a:Ll/no3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/go3;->a:Ll/no3;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/no3;->j0(Ll/no3;Landroid/os/Bundle;)V

    return-void
.end method
