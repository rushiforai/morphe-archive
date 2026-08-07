.class public final synthetic Ll/qb2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/zb2;


# direct methods
.method public synthetic constructor <init>(Ll/zb2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qb2;->a:Ll/zb2;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qb2;->a:Ll/zb2;

    invoke-static {p0, p1}, Ll/zb2;->O3(Ll/zb2;Landroid/content/DialogInterface;)V

    return-void
.end method
