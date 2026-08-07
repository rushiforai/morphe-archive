.class public final synthetic Ll/w9s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/aas;


# direct methods
.method public synthetic constructor <init>(Ll/aas;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w9s;->a:Ll/aas;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w9s;->a:Ll/aas;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/aas;->h0(Ll/aas;Landroid/os/Bundle;)V

    return-void
.end method
