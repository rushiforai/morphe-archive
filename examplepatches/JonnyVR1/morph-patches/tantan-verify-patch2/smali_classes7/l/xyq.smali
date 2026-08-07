.class public Ll/xyq;
.super Ljava/lang/Object;

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final a:Lkotlin/reflect/jvm/internal/KTypeImpl;

.field public final b:I

.field public final c:Lkotlin/Lazy;


# direct methods
.method public constructor <init>(Lkotlin/reflect/jvm/internal/KTypeImpl;ILkotlin/Lazy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xyq;->a:Lkotlin/reflect/jvm/internal/KTypeImpl;

    .line 5
    .line 6
    iput p2, p0, Ll/xyq;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/xyq;->c:Lkotlin/Lazy;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xyq;->a:Lkotlin/reflect/jvm/internal/KTypeImpl;

    .line 2
    .line 3
    iget v1, p0, Ll/xyq;->b:I

    .line 4
    .line 5
    iget-object p0, p0, Ll/xyq;->c:Lkotlin/Lazy;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lkotlin/reflect/jvm/internal/KTypeImpl;->t(Lkotlin/reflect/jvm/internal/KTypeImpl;ILkotlin/Lazy;)Ljava/lang/reflect/Type;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
