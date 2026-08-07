.class public final synthetic Ll/qez;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/vez;


# direct methods
.method public synthetic constructor <init>(Ll/vez;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qez;->a:Ll/vez;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qez;->a:Ll/vez;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/vez;->m0(Ll/vez;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
