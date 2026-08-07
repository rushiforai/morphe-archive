.class public final synthetic Ll/n9o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/r9o;


# direct methods
.method public synthetic constructor <init>(Ll/r9o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n9o;->a:Ll/r9o;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n9o;->a:Ll/r9o;

    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    invoke-static {p0, p1}, Ll/r9o;->s3(Ll/r9o;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
