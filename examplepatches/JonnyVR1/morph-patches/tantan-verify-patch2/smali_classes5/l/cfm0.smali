.class public Ll/cfm0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Lcom/p1/mobile/putong/data/Visitor;

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

.field public e:Z

.field public f:Ljava/lang/String;

.field public g:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;Z)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 16
    iput v0, p0, Ll/cfm0;->a:I

    .line 17
    iput-object p1, p0, Ll/cfm0;->d:Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

    .line 18
    iput-boolean p2, p0, Ll/cfm0;->e:Z

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/data/Visitor;Ljava/lang/String;I)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Ll/cfm0;->e:Z

    .line 21
    iput-object p1, p0, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 22
    iput-object p2, p0, Ll/cfm0;->c:Ljava/lang/String;

    .line 23
    iput p3, p0, Ll/cfm0;->a:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/cfm0;->a:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/cfm0;->e:Z

    .line 9
    .line 10
    iput-object p1, p0, Ll/cfm0;->f:Ljava/lang/String;

    .line 11
    .line 12
    iput-boolean p2, p0, Ll/cfm0;->g:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Ll/cfm0;->a:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const-string p0, "new"

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const/4 v0, -0x2

    .line 10
    if-ne p0, v0, :cond_1

    .line 11
    .line 12
    const-string p0, "recommend"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, "all"

    .line 16
    .line 17
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cfm0;->d:Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/cfm0;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method
