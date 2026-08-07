.class public final synthetic Ll/mgt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mgt;->a:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mgt;->a:Landroid/app/Dialog;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/wgt;->l(Landroid/app/Dialog;Ljava/lang/Throwable;)V

    return-void
.end method
