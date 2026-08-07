.class public final synthetic Ll/gkj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ikj;


# direct methods
.method public synthetic constructor <init>(Ll/ikj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gkj;->a:Ll/ikj;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gkj;->a:Ll/ikj;

    invoke-static {p0, p1}, Ll/ikj;->d(Ll/ikj;Landroid/view/View;)V

    return-void
.end method
