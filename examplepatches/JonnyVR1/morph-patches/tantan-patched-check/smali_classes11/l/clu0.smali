.class public final synthetic Ll/clu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ilu0;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Z

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/ilu0;Landroid/view/View;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/clu0;->a:Ll/ilu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/clu0;->b:Landroid/view/View;

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/clu0;->c:Z

    .line 9
    .line 10
    iput p4, p0, Ll/clu0;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/clu0;->a:Ll/ilu0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/clu0;->b:Landroid/view/View;

    .line 4
    .line 5
    iget-boolean v2, p0, Ll/clu0;->c:Z

    .line 6
    .line 7
    iget p0, p0, Ll/clu0;->d:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Ll/ilu0;->b0(Landroid/view/View;ZI)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
