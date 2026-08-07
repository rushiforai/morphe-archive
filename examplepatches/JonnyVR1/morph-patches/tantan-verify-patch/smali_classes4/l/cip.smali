.class public final synthetic Ll/cip;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hjp;


# direct methods
.method public synthetic constructor <init>(Ll/hjp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cip;->a:Ll/hjp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cip;->a:Ll/hjp;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/hjp;->C0(Ll/hjp;Landroid/os/Bundle;)V

    return-void
.end method
