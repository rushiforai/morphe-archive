.class public Ll/r8b$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r8b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/mni0;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/android/app/Act;

.field public final d:Ll/p8b;

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/mni0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/p8b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/r8b$a;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/r8b$a;->c:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Ll/r8b$a;->d:Ll/p8b;

    .line 14
    .line 15
    new-instance p1, Ll/mni0;

    .line 16
    .line 17
    const/4 p2, 0x1

    .line 18
    invoke-direct {p1, p2}, Ll/mni0;-><init>(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/r8b$a;->e:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance p1, Ll/mni0;

    .line 27
    .line 28
    const/4 p2, -0x1

    .line 29
    invoke-direct {p1, p2}, Ll/mni0;-><init>(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic E(ILl/mni0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Ll/mni0;->a:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/mni0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/r8b$a;->F(Landroid/view/View;Ll/mni0;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r8b$a;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/r8b$a;->c:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/kec0;->Ic:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 v0, -0x1

    .line 19
    if-ne p2, v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/r8b$a;->c:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget p2, Ll/kec0;->Hc:I

    .line 28
    .line 29
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public F(Landroid/view/View;Ll/mni0;II)V
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    if-ne p3, p4, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

    .line 5
    .line 6
    iget-object p3, p0, Ll/r8b$a;->c:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object p0, p0, Ll/r8b$a;->d:Ll/p8b;

    .line 9
    .line 10
    invoke-virtual {p1, p3, p0, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->V0(Lcom/p1/mobile/android/app/Act;Ll/p8b;Ll/mni0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public G(I)Ll/mni0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r8b$a;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/mni0;

    .line 8
    .line 9
    return-object p0
.end method

.method public H(ILjava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r8b$a;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Ll/q8b;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/q8b;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-ltz p1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/r8b$a;->e:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/mni0;

    .line 21
    .line 22
    iput-object p2, v0, Ll/mni0;->b:Ljava/lang/Object;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r8b$a;->G(I)Ll/mni0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r8b$a;->G(I)Ll/mni0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Ll/mni0;->a:I

    .line 6
    .line 7
    return p0
.end method
