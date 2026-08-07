.class public final synthetic Ll/sji;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/vji;

.field public final synthetic b:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Ll/vji;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sji;->a:Ll/vji;

    iput-object p2, p0, Ll/sji;->b:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sji;->a:Ll/vji;

    iget-object p0, p0, Ll/sji;->b:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lkotlin/Pair;

    invoke-static {v0, p0, p1}, Ll/vji;->c(Ll/vji;Lkotlin/jvm/functions/Function1;Lkotlin/Pair;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
