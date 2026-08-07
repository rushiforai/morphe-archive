.class public final synthetic Ll/qqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/sqe;


# direct methods
.method public synthetic constructor <init>(Ll/sqe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qqe;->a:Ll/sqe;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qqe;->a:Ll/sqe;

    check-cast p1, Lkotlin/Triple;

    invoke-static {p0, p1}, Ll/sqe;->s(Ll/sqe;Lkotlin/Triple;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
