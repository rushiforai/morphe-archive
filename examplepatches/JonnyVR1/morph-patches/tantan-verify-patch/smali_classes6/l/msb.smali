.class public final synthetic Ll/msb;
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

    iput p1, p0, Ll/msb;->a:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/msb;->a:I

    check-cast p1, Ll/nsb;

    invoke-static {p0, p1}, Ll/nsb;->d(ILl/nsb;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
