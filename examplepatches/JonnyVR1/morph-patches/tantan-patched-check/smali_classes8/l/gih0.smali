.class public final synthetic Ll/gih0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gih0;->a:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gih0;->a:Landroid/view/View;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/uih0;->V(Landroid/view/View;Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
