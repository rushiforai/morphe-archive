.class public Landroidx/fragment/app/l$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/l;->o(Landroid/view/ViewGroup;Landroidx/fragment/app/l$h;Landroid/view/View;Ll/l01;Landroidx/fragment/app/l$g;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/fragment/app/l$g;

.field public final synthetic b:Landroidx/fragment/app/Fragment;

.field public final synthetic c:Ll/fg4;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/l$g;Landroidx/fragment/app/Fragment;Ll/fg4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/l$a;->a:Landroidx/fragment/app/l$g;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/fragment/app/l$a;->b:Landroidx/fragment/app/Fragment;

    .line 4
    .line 5
    iput-object p3, p0, Landroidx/fragment/app/l$a;->c:Ll/fg4;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/l$a;->a:Landroidx/fragment/app/l$g;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/fragment/app/l$a;->b:Landroidx/fragment/app/Fragment;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/fragment/app/l$a;->c:Ll/fg4;

    .line 6
    .line 7
    invoke-interface {v0, v1, p0}, Landroidx/fragment/app/l$g;->a(Landroidx/fragment/app/Fragment;Ll/fg4;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
