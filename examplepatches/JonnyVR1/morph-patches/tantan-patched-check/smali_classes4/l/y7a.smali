.class public final synthetic Ll/y7a;
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

    iput p1, p0, Ll/y7a;->a:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/y7a;->a:I

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/z7a;->n0(ILjava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
