.class public final synthetic Ll/qno0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/yno0;


# direct methods
.method public synthetic constructor <init>(Ll/yno0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qno0;->a:Ll/yno0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qno0;->a:Ll/yno0;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/yno0;->v5(Ll/yno0;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
