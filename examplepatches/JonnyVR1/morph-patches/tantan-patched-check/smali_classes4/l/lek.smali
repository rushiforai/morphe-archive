.class public final synthetic Ll/lek;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mek;


# direct methods
.method public synthetic constructor <init>(Ll/mek;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lek;->a:Ll/mek;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lek;->a:Ll/mek;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/mek;->e0(Ll/mek;Landroid/os/Bundle;)V

    return-void
.end method
