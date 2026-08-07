.class public final synthetic Ll/hqu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/iqu;


# direct methods
.method public synthetic constructor <init>(Ll/iqu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hqu;->a:Ll/iqu;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hqu;->a:Ll/iqu;

    invoke-static {p0, p1}, Ll/iqu;->T2(Ll/iqu;Landroid/view/View;)V

    return-void
.end method
