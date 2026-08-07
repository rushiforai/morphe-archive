.class public final synthetic Ll/cfk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ffk;


# direct methods
.method public synthetic constructor <init>(Ll/ffk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cfk;->a:Ll/ffk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cfk;->a:Ll/ffk;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/ffk;->f0(Ll/ffk;Landroid/os/Bundle;)V

    return-void
.end method
