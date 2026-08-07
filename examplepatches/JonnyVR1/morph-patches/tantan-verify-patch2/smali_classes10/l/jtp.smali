.class public final synthetic Ll/jtp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ltp;


# direct methods
.method public synthetic constructor <init>(Ll/ltp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jtp;->a:Ll/ltp;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jtp;->a:Ll/ltp;

    invoke-static {p0, p1}, Ll/ltp;->n0(Ll/ltp;Landroid/view/View;)V

    return-void
.end method
