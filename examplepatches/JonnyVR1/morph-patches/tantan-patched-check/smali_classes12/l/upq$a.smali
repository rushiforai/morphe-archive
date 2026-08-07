.class public Ll/upq$a;
.super Ll/upq;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/upq;->j(Ljava/lang/String;)Ll/upq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/upq;


# direct methods
.method public constructor <init>(Ll/upq;Ll/upq;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/upq$a;->c:Ll/upq;

    .line 2
    .line 3
    iput-object p3, p0, Ll/upq$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p2, p1}, Ll/upq;-><init>(Ll/upq;Ll/upq$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public i(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/upq$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object p0, p0, Ll/upq$a;->c:Ll/upq;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/upq;->i(Ljava/lang/Object;)Ljava/lang/CharSequence;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public j(Ljava/lang/String;)Ll/upq;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string p1, "already specified useForNull"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method
