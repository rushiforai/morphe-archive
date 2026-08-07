.class public Ll/t7b0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/t7b0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/util/UUID;

.field public final b:I

.field public final c:[B


# direct methods
.method public constructor <init>(Ljava/util/UUID;I[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t7b0$a;->a:Ljava/util/UUID;

    .line 5
    .line 6
    iput p2, p0, Ll/t7b0$a;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/t7b0$a;->c:[B

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/t7b0$a;)Ljava/util/UUID;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t7b0$a;->a:Ljava/util/UUID;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/t7b0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/t7b0$a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ll/t7b0$a;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t7b0$a;->c:[B

    .line 2
    .line 3
    return-object p0
.end method
