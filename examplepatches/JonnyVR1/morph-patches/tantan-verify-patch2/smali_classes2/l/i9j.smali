.class public final Ll/i9j;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/i9j$a;,
        Ll/i9j$b;,
        Ll/i9j$c;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0003\u0013\u0007\tB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\t\u001a\u00020\u0006H\u0007\u00a2\u0006\u0004\u0008\t\u0010\u0003J\u000f\u0010\u000b\u001a\u00020\nH\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u0014\u0010\u000f\u001a\u00020\r8\u0006X\u0087\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010\u000eR\u0018\u0010\u0012\u001a\u0004\u0018\u00010\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\t\u0010\u0011R\u0014\u0010\u0015\u001a\u00020\u00108BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0013\u0010\u0014\u00a8\u0006\u0016"
    }
    d2 = {
        "Ll/i9j;",
        "",
        "<init>",
        "()V",
        "",
        "name",
        "",
        "a",
        "(Ljava/lang/String;)V",
        "b",
        "",
        "d",
        "()Z",
        "Ll/i9j$a;",
        "Ll/i9j$a;",
        "NO_OP_ARGS_BUILDER",
        "Ll/i9j$c;",
        "Ll/i9j$c;",
        "_instance",
        "c",
        "()Ll/i9j$c;",
        "instance",
        "imagepipeline-base_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/i9j;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ll/i9j$a;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static b:Ll/i9j$c;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/i9j;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/i9j;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/i9j;->INSTANCE:Ll/i9j;

    .line 7
    .line 8
    new-instance v0, Ll/i9j$b;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/i9j$b;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/i9j;->a:Ll/i9j$a;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final a(Ljava/lang/String;)V
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/i9j;->INSTANCE:Ll/i9j;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/i9j;->c()Ll/i9j$c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0, p0}, Ll/i9j$c;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static final b()V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/i9j;->INSTANCE:Ll/i9j;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/i9j;->c()Ll/i9j$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/i9j$c;->b()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static final d()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/i9j;->INSTANCE:Ll/i9j;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/i9j;->c()Ll/i9j$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/i9j$c;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    return v0
.end method


# virtual methods
.method public final c()Ll/i9j$c;
    .locals 1

    .line 1
    sget-object p0, Ll/i9j;->b:Ll/i9j$c;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-class p0, Ll/i9j;

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    new-instance v0, Ll/xod;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/xod;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/i9j;->b:Ll/i9j$c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-object v0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    monitor-exit p0

    .line 19
    throw v0

    .line 20
    :cond_0
    return-object p0
.end method
