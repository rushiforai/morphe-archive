.class public final synthetic Ll/c9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g9h;


# direct methods
.method public synthetic constructor <init>(Ll/g9h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c9h;->a:Ll/g9h;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c9h;->a:Ll/g9h;

    check-cast p1, Landroid/content/Intent;

    invoke-static {p0, p1}, Ll/g9h;->b(Ll/g9h;Landroid/content/Intent;)V

    return-void
.end method
