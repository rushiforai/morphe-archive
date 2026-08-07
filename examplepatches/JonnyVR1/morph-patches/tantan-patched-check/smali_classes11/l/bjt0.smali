.class public final Ll/bjt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# instance fields
.field public final synthetic a:Ll/w8t0;

.field public final synthetic b:Ll/gjt0;


# direct methods
.method public constructor <init>(Ll/gjt0;Ll/w8t0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/bjt0;->a:Ll/w8t0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/bjt0;->b:Ll/gjt0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bjt0;->a:Ll/w8t0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bjt0;->b:Ll/gjt0;

    .line 4
    .line 5
    const/16 v1, 0xa

    .line 6
    .line 7
    invoke-static {p0, p1, v0, v1}, Ll/gjt0;->zzf(Ll/gjt0;Landroid/view/View;Ll/w8t0;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method
