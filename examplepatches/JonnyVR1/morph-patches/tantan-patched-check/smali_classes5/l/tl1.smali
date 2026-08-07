.class public final synthetic Ll/tl1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dm1;


# direct methods
.method public synthetic constructor <init>(Ll/dm1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tl1;->a:Ll/dm1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tl1;->a:Ll/dm1;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/dm1;->f0(Ll/dm1;Landroid/os/Bundle;)V

    return-void
.end method
