.class public final synthetic Ll/p06;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/v06;


# direct methods
.method public synthetic constructor <init>(Ll/v06;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p06;->a:Ll/v06;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p06;->a:Ll/v06;

    check-cast p1, Ll/vxj0;

    invoke-static {p0, p1}, Ll/v06;->T3(Ll/v06;Ll/vxj0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
