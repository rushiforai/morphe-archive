.class public final synthetic Ll/ne3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qe3;


# direct methods
.method public synthetic constructor <init>(Ll/qe3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ne3;->a:Ll/qe3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ne3;->a:Ll/qe3;

    check-cast p1, Landroid/view/View;

    invoke-static {p0, p1}, Ll/qe3;->c(Ll/qe3;Landroid/view/View;)V

    return-void
.end method
