.class public final Ll/ma60;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0015\u0010\t\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\t\u0010\u0008J\u0015\u0010\u000b\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u000b\u0010\u0008J\u0015\u0010\u000c\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u000c\u0010\u0008\u00a8\u0006\r"
    }
    d2 = {
        "Ll/ma60;",
        "",
        "<init>",
        "()V",
        "",
        "muted",
        "",
        "b",
        "(Z)I",
        "a",
        "playing",
        "d",
        "c",
        "clevertap-core_release"
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
.field public static final INSTANCE:Ll/ma60;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ma60;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ma60;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ma60;->INSTANCE:Ll/ma60;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/clevertap/android/sdk/R$string;->l:I

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    sget p0, Lcom/clevertap/android/sdk/R$string;->f:I

    .line 7
    .line 8
    return p0
.end method

.method public final b(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget p0, Ll/wbc0;->j:I

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    sget p0, Ll/wbc0;->l:I

    .line 7
    .line 8
    return p0
.end method

.method public final c(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/clevertap/android/sdk/R$string;->j:I

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    sget p0, Lcom/clevertap/android/sdk/R$string;->k:I

    .line 7
    .line 8
    return p0
.end method

.method public final d(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget p0, Ll/wbc0;->g:I

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    sget p0, Ll/wbc0;->h:I

    .line 7
    .line 8
    return p0
.end method
