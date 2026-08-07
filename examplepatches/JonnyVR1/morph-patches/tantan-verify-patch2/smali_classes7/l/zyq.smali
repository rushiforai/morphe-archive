.class public Ll/zyq;
.super Ljava/lang/Object;

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final a:Lkotlin/reflect/jvm/internal/KTypeParameterOwnerImpl;

.field public final b:Lkotlin/reflect/jvm/internal/KTypeParameterImpl;


# direct methods
.method public constructor <init>(Lkotlin/reflect/jvm/internal/KTypeParameterOwnerImpl;Lkotlin/reflect/jvm/internal/KTypeParameterImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zyq;->a:Lkotlin/reflect/jvm/internal/KTypeParameterOwnerImpl;

    .line 5
    .line 6
    iput-object p2, p0, Ll/zyq;->b:Lkotlin/reflect/jvm/internal/KTypeParameterImpl;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zyq;->a:Lkotlin/reflect/jvm/internal/KTypeParameterOwnerImpl;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zyq;->b:Lkotlin/reflect/jvm/internal/KTypeParameterImpl;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lkotlin/reflect/jvm/internal/KTypeParameterImpl;->b(Lkotlin/reflect/jvm/internal/KTypeParameterOwnerImpl;Lkotlin/reflect/jvm/internal/KTypeParameterImpl;)Lkotlin/reflect/jvm/internal/KTypeParameterOwnerImpl;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
