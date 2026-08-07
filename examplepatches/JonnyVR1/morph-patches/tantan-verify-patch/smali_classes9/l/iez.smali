.class public final synthetic Ll/iez;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vez;


# direct methods
.method public synthetic constructor <init>(Ll/vez;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iez;->a:Ll/vez;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iez;->a:Ll/vez;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/vez;->n0(Ll/vez;Landroid/os/Bundle;)V

    return-void
.end method
