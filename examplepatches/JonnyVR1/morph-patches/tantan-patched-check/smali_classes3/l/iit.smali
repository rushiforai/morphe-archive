.class public abstract Ll/iit;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/iit$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u00086\u0018\u0000 \u001e2\u00020\u0001:\u0001\u000cB5\u0008\u0004\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0010\u0008\u0002\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\u0000\u0018\u00010\u0006\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\r\u001a\u0004\u0008\u000e\u0010\u000fR\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u0011\u001a\u0004\u0008\u0012\u0010\u0013R\u001f\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\u0000\u0018\u00010\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017R\"\u0010\t\u001a\u00020\u00088\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0018\u0010\u0019\u001a\u0004\u0008\u001a\u0010\u001b\"\u0004\u0008\u001c\u0010\u001d\u0082\u0001\n\u001f !\"#$%&\'(\u00a8\u0006)"
    }
    d2 = {
        "Ll/iit;",
        "",
        "",
        "name",
        "",
        "trickProgress",
        "Lrx/c;",
        "obs",
        "",
        "finish",
        "<init>",
        "(Ljava/lang/String;ILrx/c;Z)V",
        "a",
        "Ljava/lang/String;",
        "g",
        "()Ljava/lang/String;",
        "b",
        "I",
        "h",
        "()I",
        "c",
        "Lrx/c;",
        "getObs",
        "()Lrx/c;",
        "d",
        "Z",
        "f",
        "()Z",
        "i",
        "(Z)V",
        "Companion",
        "Ll/qn0;",
        "Ll/nu6;",
        "Ll/h9e;",
        "Ll/l9e;",
        "Ll/bae;",
        "Ll/guf;",
        "Ll/zwm;",
        "Ll/qtv;",
        "Ll/rtv;",
        "Ll/hgl0;",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/iit$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final e:I

.field public static final f:I

.field public static final g:I

.field public static final h:I

.field public static final i:I


# instance fields
.field public final a:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:I

.field public final c:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "Ll/iit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/iit$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/iit$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/iit;->Companion:Ll/iit$a;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    sput v0, Ll/iit;->e:I

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    sput v0, Ll/iit;->f:I

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    sput v0, Ll/iit;->g:I

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    sput v0, Ll/iit;->h:I

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    sput v0, Ll/iit;->i:I

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILrx/c;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Lrx/c<",
            "Ll/iit;",
            ">;Z)V"
        }
    .end annotation

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Ll/iit;->a:Ljava/lang/String;

    .line 23
    iput p2, p0, Ll/iit;->b:I

    .line 24
    iput-object p3, p0, Ll/iit;->c:Lrx/c;

    .line 25
    iput-boolean p4, p0, Ll/iit;->d:Z

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILrx/c;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 6

    .line 1
    and-int/lit8 p6, p5, 0x4

    .line 2
    .line 3
    if-eqz p6, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    :cond_0
    move-object v3, p3

    .line 7
    and-int/lit8 p3, p5, 0x8

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    const/4 p4, 0x0

    .line 12
    :cond_1
    move v4, p4

    .line 13
    const/4 v5, 0x0

    .line 14
    move-object v0, p0

    .line 15
    move-object v1, p1

    .line 16
    move v2, p2

    .line 17
    invoke-direct/range {v0 .. v5}, Ll/iit;-><init>(Ljava/lang/String;ILrx/c;ZLkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILrx/c;ZLkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2, p3, p4}, Ll/iit;-><init>(Ljava/lang/String;ILrx/c;Z)V

    return-void
.end method

.method public static final synthetic a()I
    .locals 1

    .line 1
    sget v0, Ll/iit;->i:I

    .line 2
    .line 3
    return v0
.end method

.method public static final synthetic b()I
    .locals 1

    .line 1
    sget v0, Ll/iit;->e:I

    .line 2
    .line 3
    return v0
.end method

.method public static final synthetic c()I
    .locals 1

    .line 1
    sget v0, Ll/iit;->g:I

    .line 2
    .line 3
    return v0
.end method

.method public static final synthetic d()I
    .locals 1

    .line 1
    sget v0, Ll/iit;->h:I

    .line 2
    .line 3
    return v0
.end method

.method public static final synthetic e()I
    .locals 1

    .line 1
    sget v0, Ll/iit;->f:I

    .line 2
    .line 3
    return v0
.end method


# virtual methods
.method public final f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/iit;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final g()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/iit;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/iit;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final i(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/iit;->d:Z

    .line 2
    .line 3
    return-void
.end method
