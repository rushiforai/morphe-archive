.class public final synthetic Ll/fd3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ld3;


# direct methods
.method public synthetic constructor <init>(Ll/ld3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fd3;->a:Ll/ld3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fd3;->a:Ll/ld3;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/ld3;->e(Ll/ld3;Landroid/view/View;)V

    return-void
.end method
