.class public Ll/txf0$a$a;
.super Ll/txf0$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/txf0$a;->b(Ll/txf0;Ljava/lang/CharSequence;)Ll/txf0$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ll/txf0$a;


# direct methods
.method public constructor <init>(Ll/txf0$a;Ll/txf0;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/txf0$a$a;->h:Ll/txf0$a;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/txf0$b;-><init>(Ll/txf0;Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e(I)I
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    return p1
.end method

.method public f(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/txf0$a$a;->h:Ll/txf0$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/txf0$a;->a:Ll/xs4;

    .line 4
    .line 5
    iget-object p0, p0, Ll/txf0$b;->c:Ljava/lang/CharSequence;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ll/xs4;->e(Ljava/lang/CharSequence;I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
