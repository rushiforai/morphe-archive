.class public final synthetic Ll/jyy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/app/Dialog;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Dialog;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jyy;->a:Landroid/app/Dialog;

    iput-object p2, p0, Ll/jyy;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jyy;->a:Landroid/app/Dialog;

    iget-object p0, p0, Ll/jyy;->b:Ll/x20;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/azy;->b(Landroid/app/Dialog;Ll/x20;Ll/uxj0;)V

    return-void
.end method
