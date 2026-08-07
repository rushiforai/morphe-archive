.class public final synthetic Ll/z6x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h7x;


# direct methods
.method public synthetic constructor <init>(Ll/h7x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z6x;->a:Ll/h7x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z6x;->a:Ll/h7x;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/h7x;->F0(Ll/h7x;Landroid/os/Bundle;)V

    return-void
.end method
