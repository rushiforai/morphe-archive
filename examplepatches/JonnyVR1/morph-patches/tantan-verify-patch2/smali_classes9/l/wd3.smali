.class public final synthetic Ll/wd3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fe3;


# direct methods
.method public synthetic constructor <init>(Ll/fe3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wd3;->a:Ll/fe3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wd3;->a:Ll/fe3;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/fe3;->f(Ll/fe3;Landroid/view/View;)V

    return-void
.end method
