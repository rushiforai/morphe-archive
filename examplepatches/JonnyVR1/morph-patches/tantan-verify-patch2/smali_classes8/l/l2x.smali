.class public final synthetic Ll/l2x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/p2x;


# direct methods
.method public synthetic constructor <init>(Ll/p2x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l2x;->a:Ll/p2x;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l2x;->a:Ll/p2x;

    invoke-static {p0, p1}, Ll/p2x;->d(Ll/p2x;Landroid/view/View;)V

    return-void
.end method
