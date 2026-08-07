.class public final synthetic Ll/ufg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bgg0;


# direct methods
.method public synthetic constructor <init>(Ll/bgg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ufg0;->a:Ll/bgg0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ufg0;->a:Ll/bgg0;

    invoke-virtual {p0, p1}, Ll/bgg0;->e(Landroid/view/View;)V

    return-void
.end method
