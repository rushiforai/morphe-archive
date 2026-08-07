.class public final synthetic Ll/ojn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/pjn;


# direct methods
.method public synthetic constructor <init>(Ll/pjn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ojn;->a:Ll/pjn;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ojn;->a:Ll/pjn;

    invoke-static {p0, p1}, Ll/pjn;->y(Ll/pjn;Landroid/content/DialogInterface;)V

    return-void
.end method
