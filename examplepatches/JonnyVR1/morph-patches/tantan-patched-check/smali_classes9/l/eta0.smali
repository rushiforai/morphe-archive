.class public final synthetic Ll/eta0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nta0;


# direct methods
.method public synthetic constructor <init>(Ll/nta0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eta0;->a:Ll/nta0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eta0;->a:Ll/nta0;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/nta0;->n0(Ll/nta0;Landroid/os/Bundle;)V

    return-void
.end method
