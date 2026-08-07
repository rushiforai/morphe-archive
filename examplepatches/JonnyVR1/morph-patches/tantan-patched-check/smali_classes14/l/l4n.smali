.class public final synthetic Ll/l4n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/o4n;


# direct methods
.method public synthetic constructor <init>(Ll/o4n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l4n;->a:Ll/o4n;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l4n;->a:Ll/o4n;

    check-cast p1, Lcom/p1/mobile/putong/live/external/square/api/ModelData;

    invoke-static {p0, p1}, Ll/o4n;->R2(Ll/o4n;Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
