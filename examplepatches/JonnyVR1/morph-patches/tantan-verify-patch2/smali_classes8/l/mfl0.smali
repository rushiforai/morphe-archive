.class public final synthetic Ll/mfl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/yfl0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/yfl0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mfl0;->a:Ll/yfl0;

    iput-boolean p2, p0, Ll/mfl0;->b:Z

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mfl0;->a:Ll/yfl0;

    iget-boolean p0, p0, Ll/mfl0;->b:Z

    invoke-static {v0, p0, p1}, Ll/yfl0;->h(Ll/yfl0;ZLandroid/content/DialogInterface;)V

    return-void
.end method
