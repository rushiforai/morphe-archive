.class public final synthetic Ll/kyn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qyn;


# direct methods
.method public synthetic constructor <init>(Ll/qyn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kyn;->a:Ll/qyn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kyn;->a:Ll/qyn;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/qyn;->a3(Ll/qyn;Landroid/os/Bundle;)V

    return-void
.end method
