.class public Ll/vr0;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field public final a:Ljava/lang/Class;

.field public final b:Ljava/util/Map;

.field public final c:Lkotlin/Lazy;

.field public final d:Lkotlin/Lazy;

.field public final e:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/util/Map;Lkotlin/Lazy;Lkotlin/Lazy;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vr0;->a:Ljava/lang/Class;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vr0;->b:Ljava/util/Map;

    .line 7
    .line 8
    iput-object p3, p0, Ll/vr0;->c:Lkotlin/Lazy;

    .line 9
    .line 10
    iput-object p4, p0, Ll/vr0;->d:Lkotlin/Lazy;

    .line 11
    .line 12
    iput-object p5, p0, Ll/vr0;->e:Ljava/util/List;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/vr0;->a:Ljava/lang/Class;

    .line 2
    .line 3
    iget-object v1, p0, Ll/vr0;->b:Ljava/util/Map;

    .line 4
    .line 5
    iget-object v2, p0, Ll/vr0;->c:Lkotlin/Lazy;

    .line 6
    .line 7
    iget-object v3, p0, Ll/vr0;->d:Lkotlin/Lazy;

    .line 8
    .line 9
    iget-object v4, p0, Ll/vr0;->e:Ljava/util/List;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    move-object v6, p2

    .line 13
    move-object v7, p3

    .line 14
    invoke-static/range {v0 .. v7}, Lkotlin/reflect/jvm/internal/calls/AnnotationConstructorCallerKt;->e(Ljava/lang/Class;Ljava/util/Map;Lkotlin/Lazy;Lkotlin/Lazy;Ljava/util/List;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
