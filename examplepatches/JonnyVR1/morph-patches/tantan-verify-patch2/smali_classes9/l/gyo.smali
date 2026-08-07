.class public final synthetic Ll/gyo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lkotlin/jvm/functions/Function0;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(ZLkotlin/jvm/functions/Function0;Ljava/util/List;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/gyo;->a:Z

    iput-object p2, p0, Ll/gyo;->b:Lkotlin/jvm/functions/Function0;

    iput-object p3, p0, Ll/gyo;->c:Ljava/util/List;

    iput-object p4, p0, Ll/gyo;->d:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/gyo;->a:Z

    iget-object v1, p0, Ll/gyo;->b:Lkotlin/jvm/functions/Function0;

    iget-object v2, p0, Ll/gyo;->c:Ljava/util/List;

    iget-object p0, p0, Ll/gyo;->d:Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1, v2, p0}, Ll/kyo;->f(ZLkotlin/jvm/functions/Function0;Ljava/util/List;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
