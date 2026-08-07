.class public final synthetic Ll/ijz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/clz;


# direct methods
.method public synthetic constructor <init>(Ll/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ijz;->a:Ll/clz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ijz;->a:Ll/clz;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/clz;->C1(Ll/clz;Ljava/lang/Integer;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
