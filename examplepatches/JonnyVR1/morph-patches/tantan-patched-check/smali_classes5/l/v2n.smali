.class public final synthetic Ll/v2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x2n;


# direct methods
.method public synthetic constructor <init>(Ll/x2n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v2n;->a:Ll/x2n;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v2n;->a:Ll/x2n;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/x2n;->e0(Ll/x2n;Landroid/os/Bundle;)V

    return-void
.end method
