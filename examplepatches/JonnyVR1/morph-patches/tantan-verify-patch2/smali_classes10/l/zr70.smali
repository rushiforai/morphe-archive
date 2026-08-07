.class public final synthetic Ll/zr70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lrx/subjects/b;


# direct methods
.method public synthetic constructor <init>(Lrx/subjects/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zr70;->a:Lrx/subjects/b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zr70;->a:Lrx/subjects/b;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    return-void
.end method
