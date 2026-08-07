.class public final synthetic Ll/jp60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/lp60;


# direct methods
.method public synthetic constructor <init>(Ll/lp60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jp60;->a:Ll/lp60;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jp60;->a:Ll/lp60;

    invoke-static {p0, p1}, Ll/lp60;->g(Ll/lp60;Landroid/view/View;)V

    return-void
.end method
