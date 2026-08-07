.class public final synthetic Ll/i2i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/l2i0;


# direct methods
.method public synthetic constructor <init>(Ll/l2i0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i2i0;->a:Ll/l2i0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i2i0;->a:Ll/l2i0;

    invoke-static {p0, p1}, Ll/l2i0;->d(Ll/l2i0;Landroid/view/View;)V

    return-void
.end method
