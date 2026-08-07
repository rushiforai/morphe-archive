.class public final synthetic Ll/lgt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Ll/x20;Landroid/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lgt;->a:Ll/x20;

    iput-object p2, p0, Ll/lgt;->b:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lgt;->a:Ll/x20;

    iget-object p0, p0, Ll/lgt;->b:Landroid/app/Dialog;

    check-cast p1, Ll/vxj0;

    invoke-static {v0, p0, p1}, Ll/wgt;->e(Ll/x20;Landroid/app/Dialog;Ll/vxj0;)V

    return-void
.end method
