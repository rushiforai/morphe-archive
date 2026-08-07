.class public Ll/tzk$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/view/CardLabelShowView3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tzk;->g()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/tzk;


# direct methods
.method public constructor <init>(Ll/tzk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tzk$a;->a:Ll/tzk;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(IIIZ)V
    .locals 0

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p3, p0, Ll/tzk$a;->a:Ll/tzk;

    .line 5
    .line 6
    iget-object p3, p3, Ll/tzk;->l:Landroid/view/View;

    .line 7
    .line 8
    const/high16 p4, 0x41800000    # 16.0f

    .line 9
    .line 10
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    add-int/2addr p2, p1

    .line 15
    div-int/lit8 p2, p2, 0x2

    .line 16
    .line 17
    add-int/2addr p4, p2

    .line 18
    invoke-static {p3, p4}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/tzk$a;->a:Ll/tzk;

    .line 22
    .line 23
    invoke-static {p0, p1}, Ll/tzk;->e(Ll/tzk;I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
