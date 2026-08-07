.class public final synthetic Ll/zc2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dd2;


# direct methods
.method public synthetic constructor <init>(Ll/dd2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zc2;->a:Ll/dd2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zc2;->a:Ll/dd2;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/dd2;->e0(Ll/dd2;Landroid/os/Bundle;)V

    return-void
.end method
