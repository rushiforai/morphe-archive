.class public final Lbkb;
.super Lmkb;
.source "SourceFile"


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lbkb;->a:I

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final b()La26;
    .registers 1

    sget-object p0, Lg4a;->o:Lg4a;

    return-object p0
.end method
