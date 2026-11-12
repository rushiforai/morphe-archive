.class public abstract Lye;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lxe;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lxe;

    invoke-direct {v0}, Landroid/view/ActionMode$Callback2;-><init>()V

    sput-object v0, Lye;->a:Lxe;

    return-void
.end method


# virtual methods
.method public final d()V
    .registers 1

    invoke-virtual {p0}, Lye;->e()V

    return-void
.end method

.method public abstract e()V
.end method

.method public abstract g()Z
.end method

.method public abstract h(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
.end method

.method public abstract m(Landroid/graphics/Rect;)V
.end method

.method public abstract n(Landroid/view/Menu;)V
.end method
