.class public final synthetic Ll/wfw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xfw;


# direct methods
.method public synthetic constructor <init>(Ll/xfw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wfw;->a:Ll/xfw;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wfw;->a:Ll/xfw;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/xfw;->e0(Ll/xfw;Landroid/os/Bundle;)V

    return-void
.end method
