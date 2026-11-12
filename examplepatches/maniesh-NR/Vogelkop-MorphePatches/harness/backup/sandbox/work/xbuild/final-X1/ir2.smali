.class public final Lir2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Les2;


# instance fields
.field public final synthetic a:Lmr2;


# direct methods
.method public constructor <init>(Lmr2;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lir2;->a:Lmr2;

    return-void
.end method


# virtual methods
.method public final onAdded(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lir2;->a:Lmr2;

    iput-object p1, p0, Lmr2;->x:Ljava/lang/String;

    return-void
.end method
