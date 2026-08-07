.class public final synthetic Ll/uzc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xzc0;


# direct methods
.method public synthetic constructor <init>(Ll/xzc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uzc0;->a:Ll/xzc0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzc0;->a:Ll/xzc0;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/xzc0;->h(Ll/xzc0;Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
