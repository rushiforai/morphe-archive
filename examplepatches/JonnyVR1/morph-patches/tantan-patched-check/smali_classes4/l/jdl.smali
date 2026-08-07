.class public final synthetic Ll/jdl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tel;


# direct methods
.method public synthetic constructor <init>(Ll/tel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jdl;->a:Ll/tel;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jdl;->a:Ll/tel;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/tel;->H0(Ll/tel;Landroid/os/Bundle;)V

    return-void
.end method
