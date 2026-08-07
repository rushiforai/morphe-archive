.class public final synthetic Ll/ixg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jxg;


# direct methods
.method public synthetic constructor <init>(Ll/jxg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ixg;->a:Ll/jxg;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ixg;->a:Ll/jxg;

    invoke-static {p0, p1}, Ll/jxg;->f(Ll/jxg;Landroid/view/View;)V

    return-void
.end method
