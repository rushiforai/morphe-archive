.class public final synthetic Ll/gp10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/hp10;


# direct methods
.method public synthetic constructor <init>(Ll/hp10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gp10;->a:Ll/hp10;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gp10;->a:Ll/hp10;

    invoke-static {p0, p1}, Ll/hp10;->w(Ll/hp10;Landroid/view/View;)V

    return-void
.end method
