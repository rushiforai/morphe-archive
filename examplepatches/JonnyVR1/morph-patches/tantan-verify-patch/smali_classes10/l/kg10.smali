.class public final synthetic Ll/kg10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/pg10;


# direct methods
.method public synthetic constructor <init>(Ll/pg10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kg10;->a:Ll/pg10;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kg10;->a:Ll/pg10;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/pg10;->U3(Ll/pg10;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
