.class public final synthetic Ll/rzx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/szx;


# direct methods
.method public synthetic constructor <init>(Ll/szx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rzx;->a:Ll/szx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rzx;->a:Ll/szx;

    check-cast p1, Landroid/content/Intent;

    invoke-static {p0, p1}, Ll/szx;->n(Ll/szx;Landroid/content/Intent;)V

    return-void
.end method
