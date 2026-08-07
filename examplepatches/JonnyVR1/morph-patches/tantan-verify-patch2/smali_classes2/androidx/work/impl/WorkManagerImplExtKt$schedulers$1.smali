.class final Landroidx/work/impl/WorkManagerImplExtKt$schedulers$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function6;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function6<",
        "Landroid/content/Context;",
        "Landroidx/work/a;",
        "Ll/zni0;",
        "Landroidx/work/impl/WorkDatabase;",
        "Ll/fgj0;",
        "Landroidx/work/impl/a;",
        "Ljava/util/List<",
        "+",
        "Ll/h2e0;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c2\u0006\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\nH\n\u00a2\u0006\u0004\u0008\u000e\u0010\u000f"
    }
    d2 = {
        "Landroid/content/Context;",
        "<anonymous parameter 0>",
        "Landroidx/work/a;",
        "<anonymous parameter 1>",
        "Ll/zni0;",
        "<anonymous parameter 2>",
        "Landroidx/work/impl/WorkDatabase;",
        "<anonymous parameter 3>",
        "Ll/fgj0;",
        "<anonymous parameter 4>",
        "Landroidx/work/impl/a;",
        "<anonymous parameter 5>",
        "",
        "Ll/h2e0;",
        "invoke",
        "(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;)Ljava/util/List;",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
.end annotation


# instance fields
.field final synthetic $schedulers:[Ll/h2e0;


# direct methods
.method public constructor <init>([Ll/h2e0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/work/impl/WorkManagerImplExtKt$schedulers$1;->$schedulers:[Ll/h2e0;

    .line 2
    .line 3
    const/4 p1, 0x6

    .line 4
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 26
    check-cast p1, Landroid/content/Context;

    check-cast p2, Landroidx/work/a;

    check-cast p3, Ll/zni0;

    check-cast p4, Landroidx/work/impl/WorkDatabase;

    check-cast p5, Ll/fgj0;

    check-cast p6, Landroidx/work/impl/a;

    invoke-virtual/range {p0 .. p6}, Landroidx/work/impl/WorkManagerImplExtKt$schedulers$1;->invoke(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/work/a;",
            "Ll/zni0;",
            "Landroidx/work/impl/WorkDatabase;",
            "Ll/fgj0;",
            "Landroidx/work/impl/a;",
            ")",
            "Ljava/util/List<",
            "Ll/h2e0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Landroidx/work/impl/WorkManagerImplExtKt$schedulers$1;->$schedulers:[Ll/h2e0;

    .line 20
    .line 21
    invoke-static {p0}, Lkotlin/collections/ArraysKt;->toList([Ljava/lang/Object;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
