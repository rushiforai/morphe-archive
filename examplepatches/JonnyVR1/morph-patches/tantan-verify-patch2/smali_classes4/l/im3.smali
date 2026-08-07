.class public final synthetic Ll/im3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/om3;


# direct methods
.method public synthetic constructor <init>(Ll/om3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/im3;->a:Ll/om3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/im3;->a:Ll/om3;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/om3;->f0(Ll/om3;Landroid/os/Bundle;)V

    return-void
.end method
