.class public final synthetic Ll/juo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/vuo0;


# direct methods
.method public synthetic constructor <init>(Ll/vuo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/juo0;->a:Ll/vuo0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/juo0;->a:Ll/vuo0;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/vuo0;->f(Ll/vuo0;Ljava/util/List;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
