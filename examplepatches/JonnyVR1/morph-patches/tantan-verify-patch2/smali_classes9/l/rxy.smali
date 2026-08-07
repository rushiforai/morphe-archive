.class public Ll/rxy;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

.field public b:I

.field public c:I

.field public d:Z

.field public e:Z

.field public f:I

.field public g:I

.field public h:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->UNKNOWN:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    iput v0, p0, Ll/rxy;->b:I

    .line 8
    .line 9
    iput v0, p0, Ll/rxy;->c:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/rxy;->d:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/rxy;->e:Z

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Ll/rxy;->f:I

    .line 18
    .line 19
    iput v0, p0, Ll/rxy;->g:I

    .line 20
    .line 21
    iput-boolean v0, p0, Ll/rxy;->h:Z

    .line 22
    .line 23
    iput-object p1, p0, Ll/rxy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Ll/rxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;)V

    .line 27
    iput p2, p0, Ll/rxy;->b:I

    .line 28
    iput p3, p0, Ll/rxy;->c:I

    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/rxy;->f:I

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput p1, p0, Ll/rxy;->f:I

    .line 5
    .line 6
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/rxy;->f:I

    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V
    .locals 0

    .line 1
    const/4 p2, 0x2

    .line 2
    invoke-virtual {p0, p2}, Ll/rxy;->e(I)Z

    .line 3
    .line 4
    .line 5
    move-result p2

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p2, 0x1

    .line 10
    invoke-virtual {p0, p2}, Ll/rxy;->e(I)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    iget p2, p0, Ll/rxy;->c:I

    .line 17
    .line 18
    if-lez p2, :cond_2

    .line 19
    .line 20
    iget-object p3, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 21
    .line 22
    invoke-virtual {p3, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget p2, p0, Ll/rxy;->b:I

    .line 27
    .line 28
    if-lez p2, :cond_2

    .line 29
    .line 30
    iget-object p3, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 31
    .line 32
    invoke-virtual {p3, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 33
    .line 34
    .line 35
    :cond_2
    :goto_0
    iget-boolean p2, p0, Ll/rxy;->d:Z

    .line 36
    .line 37
    iget-boolean p0, p0, Ll/rxy;->e:Z

    .line 38
    .line 39
    and-int/2addr p0, p2

    .line 40
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rxy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(I)Z
    .locals 0

    .line 1
    iget p0, p0, Ll/rxy;->f:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-lez p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/rxy;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/rxy;->f:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    and-int/2addr p0, v0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public h()Ll/rxy;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/rxy;->h:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public i(Z)V
    .locals 1

    .line 1
    iget v0, p0, Ll/rxy;->f:I

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    or-int/lit8 p1, v0, 0x1

    .line 6
    .line 7
    iput p1, p0, Ll/rxy;->f:I

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    and-int/lit8 p1, v0, -0x2

    .line 11
    .line 12
    iput p1, p0, Ll/rxy;->f:I

    .line 13
    .line 14
    return-void
.end method

.method public j(Z)Ll/rxy;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rxy;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Z)Ll/rxy;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rxy;->e:Z

    .line 2
    .line 3
    return-object p0
.end method
