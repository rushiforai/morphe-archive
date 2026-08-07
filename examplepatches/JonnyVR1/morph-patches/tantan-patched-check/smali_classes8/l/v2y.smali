.class public final synthetic Ll/v2y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w2y;


# direct methods
.method public synthetic constructor <init>(Ll/w2y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v2y;->a:Ll/w2y;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v2y;->a:Ll/w2y;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/w2y;->e0(Ll/w2y;Landroid/os/Bundle;)V

    return-void
.end method
