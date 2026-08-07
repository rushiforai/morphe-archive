.class public final synthetic Ll/nc50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pc50;


# direct methods
.method public synthetic constructor <init>(Ll/pc50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nc50;->a:Ll/pc50;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nc50;->a:Ll/pc50;

    invoke-static {p0, p1}, Ll/pc50;->G(Ll/pc50;Landroid/view/View;)V

    return-void
.end method
