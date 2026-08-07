.class public final synthetic Ll/s4x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/u4x;


# direct methods
.method public synthetic constructor <init>(Ll/u4x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s4x;->a:Ll/u4x;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s4x;->a:Ll/u4x;

    invoke-static {p0, p1}, Ll/u4x;->e(Ll/u4x;Landroid/view/View;)V

    return-void
.end method
