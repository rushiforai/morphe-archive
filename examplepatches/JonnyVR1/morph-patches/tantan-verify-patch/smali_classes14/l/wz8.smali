.class public final synthetic Ll/wz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/c09;


# direct methods
.method public synthetic constructor <init>(Ll/c09;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wz8;->a:Ll/c09;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wz8;->a:Ll/c09;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/c09;->b3(Ll/c09;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
