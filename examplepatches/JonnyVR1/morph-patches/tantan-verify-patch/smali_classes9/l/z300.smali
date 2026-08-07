.class public final synthetic Ll/z300;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/f400;


# direct methods
.method public synthetic constructor <init>(Ll/f400;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z300;->a:Ll/f400;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z300;->a:Ll/f400;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/f400;->g0(Ll/f400;Landroid/os/Bundle;)V

    return-void
.end method
