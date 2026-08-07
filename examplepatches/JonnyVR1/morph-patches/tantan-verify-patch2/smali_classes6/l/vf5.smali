.class public final synthetic Ll/vf5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yf5;


# direct methods
.method public synthetic constructor <init>(Ll/yf5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vf5;->a:Ll/yf5;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vf5;->a:Ll/yf5;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/yf5;->g0(Ll/yf5;Landroid/os/Bundle;)V

    return-void
.end method
