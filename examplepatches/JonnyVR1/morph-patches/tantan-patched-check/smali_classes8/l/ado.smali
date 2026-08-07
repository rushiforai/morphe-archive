.class public final synthetic Ll/ado;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bdo;


# direct methods
.method public synthetic constructor <init>(Ll/bdo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ado;->a:Ll/bdo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ado;->a:Ll/bdo;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/bdo;->e0(Ll/bdo;Landroid/os/Bundle;)V

    return-void
.end method
