.class public final synthetic Ll/xdn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xdn0;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xdn0;->a:Ljava/util/List;

    check-cast p1, Ll/lx50;

    invoke-static {p0, p1}, Ll/ydn0;->a(Ljava/util/List;Ll/lx50;)Ll/lx50;

    move-result-object p0

    return-object p0
.end method
