.class public final synthetic Ll/u790;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/p550;


# direct methods
.method public synthetic constructor <init>(Ll/p550;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u790;->a:Ll/p550;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u790;->a:Ll/p550;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Ll/p550;->j(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
