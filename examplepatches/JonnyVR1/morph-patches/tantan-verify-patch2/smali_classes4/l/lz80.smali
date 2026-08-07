.class public final synthetic Ll/lz80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b090;


# direct methods
.method public synthetic constructor <init>(Ll/b090;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lz80;->a:Ll/b090;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lz80;->a:Ll/b090;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/b090;->h0(Ll/b090;Landroid/os/Bundle;)V

    return-void
.end method
