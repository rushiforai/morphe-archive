.class public Ll/ekf$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ktf0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ekf;->t(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/ekf;


# direct methods
.method public constructor <init>(Ll/ekf;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ekf$b;->b:Ll/ekf;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ekf$b;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ekf$b;->a:Landroid/view/View;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ekf$b;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
