.class public final Ll/kpd$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kpd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/oml;

.field public b:Ll/pgj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ll/tp80;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/tp80<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:I

.field public f:I

.field public g:Z

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/oml;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/oml;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/kpd$b;->a:Ll/oml;

    .line 10
    .line 11
    const/16 v0, 0x1f40

    .line 12
    .line 13
    iput v0, p0, Ll/kpd$b;->e:I

    .line 14
    .line 15
    iput v0, p0, Ll/kpd$b;->f:I

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public bridge synthetic a()Ll/g6c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kpd$b;->b()Ll/kpd;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Ll/kpd;
    .locals 9

    .line 1
    new-instance v0, Ll/kpd;

    .line 2
    .line 3
    iget-object v1, p0, Ll/kpd$b;->d:Ljava/lang/String;

    .line 4
    .line 5
    iget v2, p0, Ll/kpd$b;->e:I

    .line 6
    .line 7
    iget v3, p0, Ll/kpd$b;->f:I

    .line 8
    .line 9
    iget-boolean v4, p0, Ll/kpd$b;->g:Z

    .line 10
    .line 11
    iget-object v5, p0, Ll/kpd$b;->a:Ll/oml;

    .line 12
    .line 13
    iget-object v6, p0, Ll/kpd$b;->c:Ll/tp80;

    .line 14
    .line 15
    iget-boolean v7, p0, Ll/kpd$b;->h:Z

    .line 16
    .line 17
    const/4 v8, 0x0

    .line 18
    invoke-direct/range {v0 .. v8}, Ll/kpd;-><init>(Ljava/lang/String;IIZLl/oml;Ll/tp80;ZLl/kpd$a;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/kpd$b;->b:Ll/pgj0;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ll/zi2;->e(Ll/pgj0;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-object v0
.end method

.method public c(Ll/pgj0;)Ll/kpd$b;
    .locals 0
    .param p1    # Ll/pgj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/kpd$b;->b:Ll/pgj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/lang/String;)Ll/kpd$b;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/kpd$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
