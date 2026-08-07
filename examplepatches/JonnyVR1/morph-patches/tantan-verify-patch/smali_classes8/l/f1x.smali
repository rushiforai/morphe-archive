.class public final synthetic Ll/f1x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/e1x$b;

.field public final synthetic b:Landroid/util/Pair;


# direct methods
.method public synthetic constructor <init>(Ll/e1x$b;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f1x;->a:Ll/e1x$b;

    iput-object p2, p0, Ll/f1x;->b:Landroid/util/Pair;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f1x;->a:Ll/e1x$b;

    iget-object p0, p0, Ll/f1x;->b:Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/e1x$b;->E(Ll/e1x$b;Landroid/util/Pair;Landroid/view/View;)V

    return-void
.end method
