.class public Ll/b9c$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b9c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/lang/String;

.field public c:Ll/l4g0;

.field public d:Lcom/p1/mobile/putong/core/data/DatingGuideData;

.field public e:I

.field public f:I

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xdc

    .line 5
    .line 6
    iput v0, p0, Ll/b9c$b;->e:I

    .line 7
    .line 8
    iput v0, p0, Ll/b9c$b;->f:I

    .line 9
    .line 10
    iput-object p1, p0, Ll/b9c$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ll/b9c;
    .locals 3

    .line 1
    new-instance v0, Ll/b9c;

    .line 2
    .line 3
    iget-object v1, p0, Ll/b9c$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/b9c;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/b9c$b;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/b9c;->F(Ll/b9c;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/b9c$b;->c:Ll/l4g0;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/b9c;->E(Ll/b9c;Ll/l4g0;)V

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ll/b9c$b;->e:I

    .line 19
    .line 20
    iget v2, p0, Ll/b9c$b;->f:I

    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Ll/b9c;->D(Ll/b9c;II)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/b9c$b;->d:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/b9c;->C(Ll/b9c;Lcom/p1/mobile/putong/core/data/DatingGuideData;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/b9c$b;->g:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0, p0}, Ll/b9c;->G(Ll/b9c;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public b(Ljava/lang/String;)Ll/b9c$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b9c$b;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/core/data/DatingGuideData;)Ll/b9c$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b9c$b;->d:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(II)Ll/b9c$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/b9c$b;->e:I

    .line 2
    .line 3
    iput p2, p0, Ll/b9c$b;->f:I

    .line 4
    .line 5
    return-object p0
.end method
