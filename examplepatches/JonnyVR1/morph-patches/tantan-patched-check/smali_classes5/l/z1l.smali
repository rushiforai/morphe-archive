.class public final synthetic Ll/z1l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/c2l;


# direct methods
.method public synthetic constructor <init>(Ll/c2l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z1l;->a:Ll/c2l;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1l;->a:Ll/c2l;

    invoke-static {p0, p1}, Ll/c2l;->c(Ll/c2l;Landroid/view/View;)V

    return-void
.end method
