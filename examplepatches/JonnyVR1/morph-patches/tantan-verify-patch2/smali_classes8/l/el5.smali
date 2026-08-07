.class public final synthetic Ll/el5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/il5;


# direct methods
.method public synthetic constructor <init>(Ll/il5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/el5;->a:Ll/il5;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/el5;->a:Ll/il5;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/il5;->e0(Ll/il5;Landroid/os/Bundle;)V

    return-void
.end method
