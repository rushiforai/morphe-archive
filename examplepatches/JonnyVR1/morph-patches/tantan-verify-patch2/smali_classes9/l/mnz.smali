.class public final synthetic Ll/mnz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tvz;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mnz;->a:Ll/tvz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mnz;->a:Ll/tvz;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/tvz;->Ga(Ll/tvz;Landroid/os/Bundle;)V

    return-void
.end method
