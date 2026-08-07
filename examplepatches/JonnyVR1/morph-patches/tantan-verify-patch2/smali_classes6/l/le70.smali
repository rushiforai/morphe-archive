.class public final synthetic Ll/le70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/hf70;


# direct methods
.method public synthetic constructor <init>(Ll/hf70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/le70;->a:Ll/hf70;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/le70;->a:Ll/hf70;

    invoke-static {p0, p1}, Ll/hf70;->c(Ll/hf70;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
