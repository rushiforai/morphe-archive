.class public final synthetic Ll/kez;
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

    iput-object p1, p0, Ll/kez;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kez;->a:Ljava/util/List;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/vez;->r0(Ljava/util/List;Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
