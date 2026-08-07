.class public final synthetic Ll/rmb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wmb0;


# direct methods
.method public synthetic constructor <init>(Ll/wmb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rmb0;->a:Ll/wmb0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rmb0;->a:Ll/wmb0;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/wmb0;->f0(Ll/wmb0;Landroid/os/Bundle;)V

    return-void
.end method
