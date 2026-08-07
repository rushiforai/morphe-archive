.class public final synthetic Ll/lo60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/lo60;->a:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/lo60;->a:I

    check-cast p1, Lcom/p1/mobile/android/app/Act$r;

    invoke-static {p0, p1}, Ll/fp60;->p(ILcom/p1/mobile/android/app/Act$r;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
