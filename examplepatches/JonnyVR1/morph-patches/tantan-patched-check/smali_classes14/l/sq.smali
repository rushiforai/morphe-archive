.class public final synthetic Ll/sq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tq;


# direct methods
.method public synthetic constructor <init>(Ll/tq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sq;->a:Ll/tq;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sq;->a:Ll/tq;

    invoke-static {p0, p1}, Ll/tq;->e0(Ll/tq;Landroid/view/View;)V

    return-void
.end method
