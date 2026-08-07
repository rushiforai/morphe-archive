.class public final synthetic Ll/i6p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/j6p;


# direct methods
.method public synthetic constructor <init>(Ll/j6p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i6p;->a:Ll/j6p;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i6p;->a:Ll/j6p;

    invoke-static {p0, p1}, Ll/j6p;->y(Ll/j6p;Landroid/view/View;)V

    return-void
.end method
