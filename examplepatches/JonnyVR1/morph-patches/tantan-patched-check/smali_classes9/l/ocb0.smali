.class public final synthetic Ll/ocb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lkotlin/jvm/functions/Function0;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/util/List;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(ZLkotlin/jvm/functions/Function0;ZLjava/util/List;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/ocb0;->a:Z

    iput-object p2, p0, Ll/ocb0;->b:Lkotlin/jvm/functions/Function0;

    iput-boolean p3, p0, Ll/ocb0;->c:Z

    iput-object p4, p0, Ll/ocb0;->d:Ljava/util/List;

    iput-object p5, p0, Ll/ocb0;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/ocb0;->f:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/ocb0;->a:Z

    iget-object v1, p0, Ll/ocb0;->b:Lkotlin/jvm/functions/Function0;

    iget-boolean v2, p0, Ll/ocb0;->c:Z

    iget-object v3, p0, Ll/ocb0;->d:Ljava/util/List;

    iget-object v4, p0, Ll/ocb0;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/ocb0;->f:Lkotlin/jvm/functions/Function0;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/purchase/c;->r(ZLkotlin/jvm/functions/Function0;ZLjava/util/List;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
