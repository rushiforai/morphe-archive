.class public final synthetic Ll/xfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yfn;


# direct methods
.method public synthetic constructor <init>(Ll/yfn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xfn;->a:Ll/yfn;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xfn;->a:Ll/yfn;

    invoke-static {p0, p1}, Ll/yfn;->c(Ll/yfn;Landroid/view/View;)V

    return-void
.end method
