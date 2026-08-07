.class public final synthetic Ll/vr40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yr40;


# direct methods
.method public synthetic constructor <init>(Ll/yr40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vr40;->a:Ll/yr40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vr40;->a:Ll/yr40;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/yr40;->g0(Ll/yr40;Landroid/os/Bundle;)V

    return-void
.end method
