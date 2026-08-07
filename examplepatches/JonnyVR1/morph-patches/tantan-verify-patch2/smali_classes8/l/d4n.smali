.class public final synthetic Ll/d4n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/j4n;


# direct methods
.method public synthetic constructor <init>(Ll/j4n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d4n;->a:Ll/j4n;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d4n;->a:Ll/j4n;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/j4n;->h0(Ll/j4n;Landroid/os/Bundle;)V

    return-void
.end method
