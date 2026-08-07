.class public final synthetic Ll/wg5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/jh5;


# direct methods
.method public synthetic constructor <init>(Ll/jh5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wg5;->a:Ll/jh5;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wg5;->a:Ll/jh5;

    invoke-static {p0, p1}, Ll/jh5;->C(Ll/jh5;Landroid/content/DialogInterface;)V

    return-void
.end method
