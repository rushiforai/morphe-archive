.class public final synthetic Ll/cfp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/kfp;


# direct methods
.method public synthetic constructor <init>(Ll/kfp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cfp;->a:Ll/kfp;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cfp;->a:Ll/kfp;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/kfp;->h(Ll/kfp;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
