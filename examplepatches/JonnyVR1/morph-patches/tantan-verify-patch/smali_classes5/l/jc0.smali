.class public final synthetic Ll/jc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pc0;


# direct methods
.method public synthetic constructor <init>(Ll/pc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jc0;->a:Ll/pc0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc0;->a:Ll/pc0;

    invoke-static {p0, p1}, Ll/pc0;->e(Ll/pc0;Landroid/view/View;)V

    return-void
.end method
