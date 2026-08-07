.class public final synthetic Ll/w3c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x3c;


# direct methods
.method public synthetic constructor <init>(Ll/x3c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w3c;->a:Ll/x3c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w3c;->a:Ll/x3c;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/x3c;->e0(Ll/x3c;Landroid/os/Bundle;)V

    return-void
.end method
