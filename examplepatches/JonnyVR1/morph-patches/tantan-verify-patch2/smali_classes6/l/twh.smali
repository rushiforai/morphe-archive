.class public final synthetic Ll/twh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cxh;


# direct methods
.method public synthetic constructor <init>(Ll/cxh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/twh;->a:Ll/cxh;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/twh;->a:Ll/cxh;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/cxh;->k(Ll/cxh;Landroid/view/View;)V

    return-void
.end method
