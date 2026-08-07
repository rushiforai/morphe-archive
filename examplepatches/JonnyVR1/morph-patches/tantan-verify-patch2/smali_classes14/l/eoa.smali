.class public final synthetic Ll/eoa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/joa;


# direct methods
.method public synthetic constructor <init>(Ll/joa;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eoa;->a:Ll/joa;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eoa;->a:Ll/joa;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/joa;->c3(Ll/joa;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
