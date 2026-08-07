.class public final synthetic Ll/g0x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i0x;


# direct methods
.method public synthetic constructor <init>(Ll/i0x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g0x;->a:Ll/i0x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g0x;->a:Ll/i0x;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/i0x;->j0(Ll/i0x;Landroid/os/Bundle;)V

    return-void
.end method
