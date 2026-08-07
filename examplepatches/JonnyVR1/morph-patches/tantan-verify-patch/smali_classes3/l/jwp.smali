.class public final synthetic Ll/jwp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/xwp;


# direct methods
.method public synthetic constructor <init>(Ll/xwp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jwp;->a:Ll/xwp;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jwp;->a:Ll/xwp;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/xwp;->f4(Ll/xwp;Ljava/util/List;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
