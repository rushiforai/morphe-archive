.class public abstract Lc0/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lc0/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, LW/b;->a:LW/a;

    invoke-virtual {v0}, LW/a;->a()Lc0/a;

    move-result-object v0

    sput-object v0, Lc0/a;->a:Lc0/a;

    return-void
.end method


# virtual methods
.method public abstract a()Ljava/util/Random;
.end method

.method public final b()I
    .locals 2

    invoke-virtual {p0}, Lc0/a;->a()Ljava/util/Random;

    move-result-object v0

    const/high16 v1, 0x7fff0000

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    return v0
.end method
