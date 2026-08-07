.class public final synthetic Ll/xzx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r0y;


# direct methods
.method public synthetic constructor <init>(Ll/r0y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xzx;->a:Ll/r0y;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzx;->a:Ll/r0y;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/r0y;->s0(Ll/r0y;Landroid/os/Bundle;)V

    return-void
.end method
