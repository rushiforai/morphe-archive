.class public final synthetic Ll/oru;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/isu;


# direct methods
.method public synthetic constructor <init>(Ll/isu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oru;->a:Ll/isu;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oru;->a:Ll/isu;

    invoke-static {p0, p1}, Ll/isu;->d(Ll/isu;Landroid/content/DialogInterface;)V

    return-void
.end method
