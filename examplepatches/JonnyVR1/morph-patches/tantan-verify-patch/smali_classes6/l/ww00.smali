.class public final synthetic Ll/ww00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ax00;


# direct methods
.method public synthetic constructor <init>(Ll/ax00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ww00;->a:Ll/ax00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ww00;->a:Ll/ax00;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/ax00;->e0(Ll/ax00;Landroid/os/Bundle;)V

    return-void
.end method
