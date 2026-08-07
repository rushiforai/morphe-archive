.class public abstract Ll/mic0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/jic0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mic0;->c:Ll/y20;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic E(Ll/mic0;Ljava/lang/Object;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mic0;->F(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "TT;II)V"
        }
    .end annotation

    .line 1
    new-instance p3, Ll/lic0;

    .line 2
    .line 3
    invoke-direct {p3, p0, p2}, Ll/lic0;-><init>(Ll/mic0;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic F(Ljava/lang/Object;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mic0;->c:Ll/y20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
