.class public final synthetic Ll/d120;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/i120;


# direct methods
.method public synthetic constructor <init>(Ll/i120;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d120;->a:Ll/i120;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d120;->a:Ll/i120;

    invoke-static {p0, p1}, Ll/i120;->d(Ll/i120;Landroid/view/View;)V

    return-void
.end method
