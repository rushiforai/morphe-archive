.class public final synthetic Ll/dpn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/spn;


# direct methods
.method public synthetic constructor <init>(Ll/spn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dpn;->a:Ll/spn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dpn;->a:Ll/spn;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/spn;->j0(Ll/spn;Landroid/os/Bundle;)V

    return-void
.end method
