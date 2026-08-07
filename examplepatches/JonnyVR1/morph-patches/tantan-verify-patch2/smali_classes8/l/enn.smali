.class public final synthetic Ll/enn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/gnn;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/gnn;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/enn;->a:Ll/gnn;

    iput-object p2, p0, Ll/enn;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/enn;->a:Ll/gnn;

    iget-object p0, p0, Ll/enn;->b:Ljava/lang/String;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/gnn;->o0(Ll/gnn;Ljava/lang/String;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
