.class public final synthetic Ll/ywy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/hxy;


# direct methods
.method public synthetic constructor <init>(Ll/hxy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ywy;->a:Ll/hxy;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywy;->a:Ll/hxy;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/hxy;->b(Ll/hxy;Landroid/util/Pair;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
